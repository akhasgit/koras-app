import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/r2_client.dart';
import '../../../services/supabase_service.dart';
import '../domain/ielts_enums.dart';
import 'ielts_models.dart';

part 'ielts_repository.g.dart';

@riverpod
IeltsRepository ieltsRepository(Ref ref) => IeltsRepository(
      ref.watch(supabaseProvider),
      ref.watch(r2ClientProvider),
    );

class IeltsRepository {
  IeltsRepository(this._sb, this._r2);
  final SupabaseClient _sb;
  final R2Client _r2;

  Future<IeltsProgress?> progress() async {
    try {
      final uid = _sb.auth.currentUser?.id;
      if (uid == null) return null;
      final row = await _sb
          .from('ielts_user_progress')
          .select()
          .eq('user_id', uid)
          .maybeSingle();
      return row == null ? null : IeltsProgress.fromJson(row);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  /// Debounced (300ms) in the runtime; this just writes.
  Future<void> saveState(
    String lessonId,
    int blockIndex,
    List<int> completed,
  ) =>
      _sb.from('ielts_lesson_state').upsert({
        'user_id': _sb.auth.currentUser?.id,
        'lesson_id': lessonId,
        'current_block_index': blockIndex,
        'completed_block_indexes': completed,
      });

  /// Insert a fresh attempt row directly (RLS); submit goes through the edge fn.
  Future<void> createAttempt(
          String attemptId, String lessonId, IeltsPart part) =>
      _sb.from('ielts_lesson_attempts').insert({
        'id': attemptId,
        'user_id': _sb.auth.currentUser?.id,
        'lesson_id': lessonId,
        'part': part.wire,
        'recording_upload_status': 'none',
      });

  Future<IeltsReport> submit({
    required String attemptId,
    required String lessonId,
    required IeltsPart part,
    required String audioObjectKey,
    String? prompt,
  }) async {
    final res = await _sb.functions.invoke('ielts-attempt-submit', body: {
      'attemptId': attemptId,
      'lessonId': lessonId,
      'part': part.wire,
      'audioObjectKey': audioObjectKey,
      if (prompt != null) 'prompt': prompt,
    });
    if (res.status != 200) throw mapEdgeError(res);
    return IeltsReport.fromJson(
        (res.data as Map)['report'] as Map<String, dynamic>);
  }

  /// Full attempt pipeline: insert row → presign → PUT → submit edge fn. See 14.
  Future<IeltsReport> submitRecording({
    required String lessonId,
    required IeltsPart part,
    required List<int> bytes,
    required String mimeType,
    String? prompt,
  }) async {
    final attemptId = const Uuid().v4();
    await createAttempt(attemptId, lessonId, part);
    final put = await _r2.presignPut(
      scope: 'ielts_attempt',
      id: attemptId,
      contentType: mimeType,
    );
    await _r2.putBytes(put.uploadUrl, bytes, mimeType);
    return submit(
      attemptId: attemptId,
      lessonId: lessonId,
      part: part,
      audioObjectKey: put.objectKey,
      prompt: prompt,
    );
  }

  Future<String> mockStart() async {
    final res = await _sb.functions.invoke('ielts-mock-start');
    if (res.status != 200) throw mapEdgeError(res);
    return (res.data as Map)['mockTestId'] as String;
  }

  Future<IeltsMockTest> mockComplete(String mockTestId) async {
    final res = await _sb.functions
        .invoke('ielts-mock-complete', body: {'mockTestId': mockTestId});
    if (res.status != 200) throw mapEdgeError(res);
    return IeltsMockTest.fromJson(
        (res.data as Map)['mockTest'] as Map<String, dynamic>);
  }
}

@riverpod
Future<IeltsProgress?> ieltsProgress(Ref ref) =>
    ref.watch(ieltsRepositoryProvider).progress();
