import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/koras_api_client.dart';
import '../../../services/supabase_service.dart';
import '../../auth/domain/auth_session.dart';
import 'voice_assessment.dart';

part 'assessments_repository.g.dart';

@riverpod
AssessmentsRepository assessmentsRepository(Ref ref) => AssessmentsRepository(
      ref.watch(korasApiClientProvider),
      ref.watch(supabaseProvider),
    );

/// Voice assessment now follows the async server-side pattern:
/// upload audio → koras-api stores in R2 → koras-api calls koras-ai → writes result.
/// Mobile never calls koras-ai directly. See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §4.5.
class AssessmentsRepository {
  AssessmentsRepository(this._api, this._sb);
  final KorasApiClient _api;
  final SupabaseClient _sb;

  Future<VoiceAssessment?> latest(String userId) async {
    try {
      final row = await _sb
          .from('voice_assessments')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();
      return row == null ? null : VoiceAssessment.fromRow(row);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  Future<List<VoiceAssessment>> history(String userId, {int limit = 50}) async {
    try {
      final rows = await _sb
          .from('voice_assessments')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((r) => VoiceAssessment.fromRow(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  /// Upload audio to koras-api which handles: R2 storage → koras-ai analysis → DB insert.
  /// Returns the completed assessment. All AI/ML processing is server-side.
  Future<VoiceAssessment> persistAssessment({
    required File file,
    required String mimeType,
    bool isBaseline = false,
  }) async {
    final bytes = await file.readAsBytes();

    // Upload via koras-api — server handles R2 storage + AI analysis + DB insert
    final data = await _api.uploadAudio(bytes, mimeType);
    final assessmentId = data['assessment_id'] as String;
    final audioKey = data['audio_key'] as String;

    // Trigger server-side analysis (server calls koras-ai, inserts scores)
    final result = await _api.apiPost(
      '/recordings/${_api.userId}/assess',
      {
        'assessment_id': assessmentId,
        'audio_key': audioKey,
        'is_baseline': isBaseline,
      },
    );

    // If the server returned the assessment inline, use it.
    // Otherwise poll until complete.
    if (result.containsKey('assessment')) {
      return VoiceAssessment.fromRow(
        (result['assessment'] as Map).cast<String, dynamic>(),
      );
    }

    // Poll until analysis completes
    return _pollAssessment(assessmentId);
  }

  Future<VoiceAssessment> _pollAssessment(String assessmentId) async {
    const maxAttempts = 30;
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(const Duration(seconds: 3));
      final row = await _sb
          .from('voice_assessments')
          .select()
          .eq('id', assessmentId)
          .maybeSingle();
      if (row != null && row['overall_score'] != null) {
        return VoiceAssessment.fromRow(row);
      }
    }
    throw const ServerError('Assessment analysis timed out');
  }
}

@riverpod
Future<VoiceAssessment?> latestAssessment(Ref ref) async {
  final session = ref.watch(authSessionProvider);
  if (session == null) return null;
  return ref.watch(assessmentsRepositoryProvider).latest(session.user.id);
}

@riverpod
Future<List<VoiceAssessment>> assessmentHistory(Ref ref) async {
  final session = ref.watch(authSessionProvider);
  if (session == null) return const [];
  return ref.watch(assessmentsRepositoryProvider).history(session.user.id);
}
