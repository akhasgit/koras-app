import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/r2_client.dart';
import '../../../services/supabase_service.dart';
import '../domain/default_questions.dart';
import 'interview_models.dart';

part 'interview_prep_repository.g.dart';

@riverpod
InterviewPrepRepository interviewPrepRepository(Ref ref) =>
    InterviewPrepRepository(
      ref.watch(supabaseProvider),
      ref.watch(r2ClientProvider),
    );

class InterviewPrepRepository {
  InterviewPrepRepository(this._sb, this._r2);
  final SupabaseClient _sb;
  final R2Client _r2;

  /// Defaults (`user_id IS NULL`) + the caller's own scenarios.
  Future<List<InterviewScenario>> listScenarios() async {
    try {
      final uid = _sb.auth.currentUser?.id;
      final rows = await _sb
          .from('interview_prep_scenarios')
          .select()
          .or('user_id.is.null${uid != null ? ',user_id.eq.$uid' : ''}')
          .order('created_at', ascending: false);
      return (rows as List)
          .map((r) => InterviewScenario.fromJson(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  Future<InterviewScenario> createScenario({
    required String title,
    String? jobRole,
    String? company,
    String? jobDescription,
  }) async {
    try {
      final row = await _sb
          .from('interview_prep_scenarios')
          .insert({
            'user_id': _sb.auth.currentUser?.id,
            'title': title,
            'job_role': jobRole,
            'company': company,
            'job_description': jobDescription,
          })
          .select()
          .single();
      return InterviewScenario.fromJson(row);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  /// Generate a question bank; falls back to the ported default bank on error.
  Future<List<InterviewQuestion>> generateQuestions({
    required String scenarioId,
    String? jobDescription,
  }) async {
    try {
      final res = await _sb.functions
          .invoke('interview-prep-generate-questions', body: {
        'scenarioId': scenarioId,
        if (jobDescription != null) 'jobDescription': jobDescription,
      });
      if (res.status != 200) return kDefaultQuestions;
      return ((res.data as Map)['questions'] as List)
          .map((q) => InterviewQuestion.fromJson(q as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return kDefaultQuestions;
    }
  }

  /// Record one answer: insert attempt → presign → PUT → request analysis.
  /// Returns the attemptId so the caller can track it (don't block on analysis).
  Future<String> recordAnswer({
    required String scenarioId,
    required String questionId,
    required String sessionId,
    required List<int> bytes,
    required String mimeType,
  }) async {
    final attemptId = const Uuid().v4();
    await _sb.from('interview_prep_attempts').insert({
      'id': attemptId,
      'user_id': _sb.auth.currentUser?.id,
      'scenario_id': scenarioId,
      'question_id': questionId,
      'practice_session_id': sessionId,
      'recording_upload_status': 'none',
      'analysis_status': 'created',
      'attempt_status': 'started',
    });

    final put = await _r2.presignPut(
      scope: 'interview_attempt',
      id: attemptId,
      contentType: mimeType,
    );
    await _r2.putBytes(put.uploadUrl, bytes, mimeType);
    await _sb.from('interview_prep_attempts').update({
      'audio_object_key': put.objectKey,
      'recording_upload_status': 'uploaded',
      'attempt_status': 'recorded',
    }).eq('id', attemptId);

    await analyze(attemptId);
    return attemptId;
  }

  /// Server enforces max 2 in-flight analyses per user (409 → caller retries).
  Future<void> analyze(String attemptId) async {
    final res = await _sb.functions
        .invoke('interview-prep-analyze', body: {'attemptId': attemptId});
    if (res.status == 409) {
      throw const ConflictError('analysis queue full');
    }
    if (res.status != 200) throw mapEdgeError(res);
  }

  Future<List<InterviewAttempt>> listAttemptsBySession(String sessionId) async {
    try {
      final rows = await _sb
          .from('interview_prep_attempts')
          .select()
          .eq('practice_session_id', sessionId)
          .order('created_at');
      return (rows as List)
          .map((r) => InterviewAttempt.fromJson(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }
}

@riverpod
Future<List<InterviewScenario>> interviewScenarios(Ref ref) =>
    ref.watch(interviewPrepRepositoryProvider).listScenarios();
