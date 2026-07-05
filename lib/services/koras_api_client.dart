import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/env/env.dart';
import '../core/errors/app_error.dart';
import 'supabase_service.dart';

part 'koras_api_client.g.dart';

/// Centralized HTTP client for all koras-api calls.
///
/// Mirrors the web's `koras-api.ts` — attaches the Supabase JWT as
/// `Authorization: Bearer <token>` on every request and targets
/// `KORAS_API_URL/{feature}/{uid}/{action}`.
///
/// All AI processing happens server-side. The mobile app never calls
/// koras-ai directly. See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §0.
class KorasApiClient {
  KorasApiClient(this._sb);
  final SupabaseClient _sb;

  static String get _baseUrl =>
      Env.korasApiUrl.replaceAll(RegExp(r'/+$'), '');

  String get userId {
    final uid = _sb.auth.currentUser?.id;
    if (uid == null || uid.isEmpty) throw const AuthError('Not signed in');
    return uid;
  }

  Map<String, String> _authHeaders() {
    final token = _sb.auth.currentSession?.accessToken;
    if (token == null || token.isEmpty) {
      throw const AuthError('Not signed in');
    }
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Map<String, String> _authHeadersNoContentType() {
    final token = _sb.auth.currentSession?.accessToken;
    if (token == null || token.isEmpty) {
      throw const AuthError('Not signed in');
    }
    return {'Authorization': 'Bearer $token'};
  }

  Never _throwHttp(http.Response res) {
    String? body;
    try {
      final decoded = jsonDecode(res.body);
      if (decoded is Map) {
        body = (decoded['error'] ?? decoded['detail'])?.toString();
      }
    } catch (_) {}
    throw switch (res.statusCode) {
      401 => AuthError(body ?? 'Not signed in'),
      403 => PermissionError(body ?? 'Not allowed'),
      404 => NotFoundError(body ?? 'Not found'),
      409 => ConflictError(body ?? 'Conflict'),
      410 => GoneError(body ?? 'Resource expired'),
      429 => ConflictError(body ?? 'Too many requests'),
      final int s when s >= 500 => ServerError(body ?? 'Server error'),
      _ => UnknownError(body ?? 'Request failed (${res.statusCode})'),
    };
  }

  /// JSON GET with auth.
  Future<Map<String, dynamic>> apiGet(String path) async {
    final http.Response res;
    try {
      res = await http.get(
        Uri.parse('$_baseUrl$path'),
        headers: _authHeaders(),
      );
    } on AppError {
      rethrow;
    } catch (e) {
      throw NetworkError('Network problem ($e)');
    }
    if (!res.ok) _throwHttp(res);
    if (res.body.isEmpty) return const {};
    return (jsonDecode(res.body) as Map).cast<String, dynamic>();
  }

  /// JSON POST with auth. Returns parsed response body.
  Future<Map<String, dynamic>> apiPost(
    String path,
    Map<String, dynamic> body,
  ) async {
    final http.Response res;
    try {
      res = await http.post(
        Uri.parse('$_baseUrl$path'),
        headers: _authHeaders(),
        body: jsonEncode(body),
      );
    } on AppError {
      rethrow;
    } catch (e) {
      throw NetworkError('Network problem ($e)');
    }
    if (!res.ok) _throwHttp(res);
    if (res.body.isEmpty) return const {};
    return (jsonDecode(res.body) as Map).cast<String, dynamic>();
  }

  /// Multipart POST with auth (for file uploads).
  Future<Map<String, dynamic>> apiPostForm(
    String path,
    http.MultipartRequest request,
  ) async {
    request.headers.addAll(_authHeadersNoContentType());
    final http.StreamedResponse streamed;
    try {
      streamed = await request.send();
    } on AppError {
      rethrow;
    } catch (e) {
      throw NetworkError('Network problem ($e)');
    }
    final res = await http.Response.fromStream(streamed);
    if (!res.ok) _throwHttp(res);
    if (res.body.isEmpty) return const {};
    return (jsonDecode(res.body) as Map).cast<String, dynamic>();
  }

  /// Upload audio bytes to koras-api `/recordings/{uid}/upload`.
  Future<Map<String, dynamic>> uploadAudio(
    List<int> bytes,
    String mimeType, {
    String? assessmentId,
  }) async {
    final uid = userId;
    final ext = _extForMime(mimeType);
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl/recordings/$uid/upload'),
    );
    request.files.add(http.MultipartFile.fromBytes(
      'audio',
      bytes,
      filename: 'recording.$ext',
    ));
    if (assessmentId != null) {
      request.fields['assessment_id'] = assessmentId;
    }
    return apiPostForm('/recordings/$uid/upload', request);
  }

  /// Get a presigned playback URL for an audio key.
  Future<String> playbackUrl(String audioKey) async {
    final uid = userId;
    final data = await apiGet(
      '/recordings/$uid/playback-url?audio_key=${Uri.encodeComponent(audioKey)}',
    );
    return data['playbackUrl'] as String;
  }

  /// Upload audio blob directly to R2 via a presigned PUT URL.
  Future<void> putBytesToR2(
    String uploadUrl,
    List<int> bytes,
    String contentType,
  ) async {
    final res = await http.put(
      Uri.parse(uploadUrl),
      body: bytes,
      headers: {'content-type': contentType},
    );
    if (res.statusCode != 200) {
      throw NetworkError('R2 upload failed (${res.statusCode})');
    }
  }
}

String _extForMime(String mime) {
  if (mime.contains('webm')) return 'webm';
  if (mime.contains('ogg')) return 'ogg';
  if (mime.contains('mp4') || mime.contains('m4a')) return 'mp4';
  if (mime.contains('wav')) return 'wav';
  return 'bin';
}

extension on http.Response {
  bool get ok => statusCode >= 200 && statusCode < 300;
}

@riverpod
KorasApiClient korasApiClient(Ref ref) =>
    KorasApiClient(ref.watch(supabaseProvider));
