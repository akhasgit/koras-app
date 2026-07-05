import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/env/env.dart';
import '../../../core/errors/app_error.dart';
import '../../../services/koras_api_client.dart';
import '../../../services/supabase_service.dart';
import '../domain/ielts_enums.dart';
import 'ielts_models.dart';

part 'ielts_repository.g.dart';

@riverpod
IeltsRepository ieltsRepository(Ref ref) => IeltsRepository(
      ref.watch(korasApiClientProvider),
      ref.watch(supabaseProvider),
    );

/// IELTS routes through koras-api (`/ielts/{uid}/...`).
/// All scoring (band, criteria) is server-side.
/// See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §4.4.
class IeltsRepository {
  IeltsRepository(this._api, this._sb);
  final KorasApiClient _api;
  final SupabaseClient _sb;

  String get _uid => _api.userId;

  static String get _baseUrl => Env.korasApiUrl.replaceAll(RegExp(r'/+$'), '');

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

  /// Submit recording — audio goes to koras-api as multipart, backend runs
  /// Whisper + Claude analysis in background (202). Returns attemptId for polling.
  Future<String> submitRecording({
    required String lessonId,
    required IeltsPart part,
    required List<int> bytes,
    required String mimeType,
    String? prompt,
    int? durationSeconds,
  }) async {
    // 1. Start attempt on backend
    final startData = await _api.apiPost('/ielts/$_uid/attempt/start', {
      'lesson_id': lessonId,
      'part': part.wire,
      if (prompt != null) 'prompt': prompt,
    });
    final attempt = (startData['attempt'] as Map).cast<String, dynamic>();
    final attemptId = attempt['id'] as String;

    // 2. Submit audio as multipart (backend uploads to R2 + runs analysis in bg)
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl/ielts/$_uid/attempt/submit'),
    );
    request.files.add(http.MultipartFile.fromBytes(
      'audio',
      bytes,
      filename: 'recording.webm',
    ));
    request.fields['attempt_id'] = attemptId;
    request.fields['lesson_id'] = lessonId;
    request.fields['part'] = part.wire;
    if (prompt != null) request.fields['prompt'] = prompt;
    if (durationSeconds != null) {
      request.fields['duration_seconds'] = durationSeconds.toString();
    }

    await _api.apiPostForm('/ielts/$_uid/attempt/submit', request);
    return attemptId;
  }

  /// Poll attempt status until analysis is complete.
  Future<Map<String, dynamic>> getAttempt(String attemptId) async {
    return _api.apiGet('/ielts/$_uid/attempt/$attemptId');
  }

  Future<String> mockStart() async {
    final data = await _api.apiPost('/ielts/$_uid/mock/start', {});
    final mock = data['mock'] as Map;
    return mock['id'] as String;
  }

  Future<Map<String, dynamic>> mockComplete(String mockTestId) async {
    return _api.apiPost('/ielts/$_uid/mock/complete', {
      'mockTestId': mockTestId,
    });
  }

  Future<Map<String, dynamic>?> getMock(String mockTestId) async {
    final data = await _api.apiGet('/ielts/$_uid/mock/$mockTestId');
    return data['mock'] as Map<String, dynamic>?;
  }
}

@riverpod
Future<IeltsProgress?> ieltsProgress(Ref ref) =>
    ref.watch(ieltsRepositoryProvider).progress();
