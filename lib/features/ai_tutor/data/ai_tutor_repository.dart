import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/env/env.dart';
import '../../../core/errors/app_error.dart';
import '../../../services/r2_client.dart';
import '../../../services/supabase_service.dart';
import '../domain/ai_tutor_enums.dart';
import 'ai_tutor_report.dart';

part 'ai_tutor_repository.g.dart';

@riverpod
AiTutorRepository aiTutorRepository(Ref ref) => AiTutorRepository(
      ref.watch(supabaseProvider),
      ref.watch(r2ClientProvider),
    );

/// AI Tutor control-plane calls go through the web Next.js API
/// (`{WEB_SITE_URL}/api/ai-tutor/*`) authenticated with the Supabase JWT, so
/// mobile and web share one backend. Recording bytes still PUT directly to R2.
/// See `docs/AI_TUTOR_MOBILE_WEB_ALIGNMENT_PLAN.md` and 13.
class AiTutorRepository {
  AiTutorRepository(this._sb, this._r2);
  final SupabaseClient _sb;
  final R2Client _r2;

  static String get _baseUrl => Env.webSiteUrl.replaceAll(RegExp(r'/+$'), '');

  Uri _url(String path) => Uri.parse('$_baseUrl$path');

  Map<String, String> _headers() {
    final token = _sb.auth.currentSession?.accessToken;
    if (token == null || token.isEmpty) {
      throw const AuthError('Not signed in');
    }
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Never _throwHttp(http.Response res) {
    String? body;
    try {
      final decoded = jsonDecode(res.body);
      if (decoded is Map) body = decoded['error']?.toString();
    } catch (_) {/* non-JSON body */}
    throw switch (res.statusCode) {
      401 => AuthError(body ?? 'Not signed in'),
      403 => PermissionError(body ?? 'Not allowed'),
      404 => NotFoundError(body ?? 'Not found'),
      409 => ConflictError(body ?? 'Conflict'),
      410 => GoneError(body ?? 'Resource expired'),
      final int s when s >= 500 => ServerError(body ?? 'Server error'),
      _ => UnknownError(body ?? 'Request failed (${res.statusCode})'),
    };
  }

  Future<Map<String, dynamic>> _post(
    String path,
    Map<String, dynamic> body,
  ) async {
    final http.Response res;
    try {
      res = await http.post(
        _url(path),
        headers: _headers(),
        body: jsonEncode(body),
      );
    } on AppError {
      rethrow;
    } catch (e) {
      throw NetworkError('Network problem ($e)');
    }
    if (res.statusCode != 200) _throwHttp(res);
    if (res.body.isEmpty) return const {};
    final decoded = jsonDecode(res.body);
    return (decoded as Map).cast<String, dynamic>();
  }

  Future<String> startSession(AiTutorMode mode) async {
    final data = await _post('/api/ai-tutor/start', {'mode': mode.wire});
    return data['sessionId'] as String;
  }

  Future<String> signedUrl(String sessionId) async {
    final data =
        await _post('/api/ai-tutor/signed-url', {'sessionId': sessionId});
    return data['signedUrl'] as String;
  }

  /// Persist a transcript turn. `user_id` is filled server-side from the JWT.
  Future<void> saveTurn(
    String sessionId,
    TurnRole role,
    int index,
    String transcript,
  ) =>
      _post('/api/ai-tutor/turn', {
        'sessionId': sessionId,
        'role': role == TurnRole.user ? 'user' : 'assistant',
        'turnIndex': index,
        'transcript': transcript,
      });

  /// Presign the conversation recording PUT for this session (via web API).
  Future<PresignedPut> presignRecording(
    String sessionId,
    String contentType,
  ) async {
    final data = await _post('/api/ai-tutor/recording-upload-url', {
      'sessionId': sessionId,
      'contentType': contentType,
    });
    return PresignedPut(
      uploadUrl: data['uploadUrl'] as String,
      objectKey: data['objectKey'] as String,
    );
  }

  Future<void> uploadRecording(
    PresignedPut put,
    List<int> bytes,
    String contentType,
  ) =>
      _r2.putBytes(put.uploadUrl, bytes, contentType);

  Future<AiTutorReport> endSession({
    required String sessionId,
    int? durationSeconds,
    String? audioObjectKey,
    String? recordingUploadStatus,
    String? elevenlabsConversationId,
  }) async {
    final data = await _post('/api/ai-tutor/end', {
      'sessionId': sessionId,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (audioObjectKey != null) 'audioObjectKey': audioObjectKey,
      if (recordingUploadStatus != null)
        'recordingUploadStatus': recordingUploadStatus,
      if (elevenlabsConversationId != null)
        'elevenlabsConversationId': elevenlabsConversationId,
    });
    return AiTutorReport.fromJson(
        (data['report'] as Map).cast<String, dynamic>());
  }

  Future<List<AiTutorSession>> listSessions({int limit = 30}) async {
    try {
      final uid = _sb.auth.currentUser?.id;
      if (uid == null) return const [];
      final rows = await _sb
          .from('ai_tutor_sessions')
          .select()
          .eq('user_id', uid)
          .order('created_at', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((r) => AiTutorSession.fromJson(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }
}

@riverpod
Future<List<AiTutorSession>> aiTutorSessions(Ref ref) =>
    ref.watch(aiTutorRepositoryProvider).listSessions();
