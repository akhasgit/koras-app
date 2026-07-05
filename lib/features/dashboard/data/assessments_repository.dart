import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/modal_client.dart';
import '../../../services/r2_client.dart';
import '../../../services/supabase_service.dart';
import '../../auth/domain/auth_session.dart';
import '../domain/mime.dart';
import 'voice_assessment.dart';

part 'assessments_repository.g.dart';

@riverpod
AssessmentsRepository assessmentsRepository(Ref ref) => AssessmentsRepository(
      ref.watch(supabaseProvider),
      ref.watch(r2ClientProvider),
      ref.watch(modalClientProvider),
    );

class AssessmentsRepository {
  AssessmentsRepository(this._sb, this._r2, this._modal);
  final SupabaseClient _sb;
  final R2Client _r2;
  final ModalClient _modal;

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

  /// Full pipeline: presign → (R2 PUT ‖ Modal /analyze) → insert row. The R2
  /// PUT and the analyse call run in parallel. If the PUT fails the row is
  /// still inserted transcript-only (audio_key = null). See 12.
  Future<VoiceAssessment> persistAssessment({
    required File file,
    required String mimeType,
    bool isBaseline = false,
  }) async {
    final uid = _sb.auth.currentUser?.id;
    if (uid == null) throw const AuthError('Not signed in');

    final assessmentId = const Uuid().v4();
    final bytes = await file.readAsBytes();
    final ext = extensionForMime(mimeType);

    final put = await _r2.presignPut(
      scope: 'voice_assessment',
      id: assessmentId,
      contentType: mimeType,
    );

    final results = await Future.wait([
      _r2
          .putBytes(put.uploadUrl, bytes, mimeType)
          .then((_) => true)
          .catchError((_) => false),
      _modal.analyze(bytes, 'recording.$ext'),
    ]);
    final uploaded = results[0] as bool;
    final analysis = results[1] as Map<String, dynamic>;

    final scores = (analysis['scores'] as Map).cast<String, dynamic>();
    final metrics = (analysis['metrics'] as Map?)?.cast<String, dynamic>();

    try {
      final row = await _sb
          .from('voice_assessments')
          .insert({
            'id': assessmentId,
            'user_id': uid,
            'is_baseline': isBaseline,
            'overall_score': scores['overall'],
            'pitch_score': scores['pitch'],
            'pace_score': scores['pace'],
            'clarity_score': scores['clarity'],
            'resonance_score': scores['resonance'],
            'confidence_score': scores['confidence'],
            'duration_seconds': metrics?['duration_seconds'],
            'words_per_minute': metrics?['words_per_minute'],
            'mean_pitch_hz': metrics?['mean_pitch_hz'],
            'pitch_std_hz': metrics?['pitch_std_hz'],
            'hnr_db': metrics?['hnr_db'],
            'pause_count': metrics?['pause_count'],
            'long_pause_count': metrics?['long_pause_count'],
            'transcript': analysis['transcript'],
            'transcript_analysis': analysis['transcript_analysis'],
            'coach_feedback': analysis['coach_feedback'],
            'archetype': analysis['archetype'],
            'audio_key': uploaded ? put.objectKey : null,
            'audio_mime_type': uploaded ? mimeType : null,
            'audio_uploaded_at':
                uploaded ? DateTime.now().toUtc().toIso8601String() : null,
          })
          .select()
          .single();

      if (uploaded) unawaited(file.delete().catchError((_) => file));

      return VoiceAssessment.fromRow(row);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
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
