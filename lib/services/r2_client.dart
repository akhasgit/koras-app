import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/errors/app_error.dart';
import 'supabase_service.dart';

part 'r2_client.g.dart';

/// Result of a presigned-PUT request.
class PresignedPut {
  const PresignedPut({required this.uploadUrl, required this.objectKey});
  final String uploadUrl;
  final String objectKey;
}

/// Presigned-URL R2 transfer. Presign endpoints come from edge functions
/// (`recordings-presign-{put,get}`); bytes go direct via bare `http` (streams
/// without buffering the whole body — never route blobs through dio). See 08/12.
class R2Client {
  R2Client(this._sb);
  final SupabaseClient _sb;

  /// Mint a presigned PUT for an object owned by the caller.
  Future<PresignedPut> presignPut({
    required String scope,
    required String contentType,
    String? id,
    String? ownerId,
  }) async {
    final res = await _sb.functions.invoke('recordings-presign-put', body: {
      'scope': scope,
      'contentType': contentType,
      if (id != null) 'id': id,
      if (ownerId != null) 'ownerId': ownerId,
    });
    if (res.status != 200) throw mapEdgeError(res);
    final data = res.data as Map;
    return PresignedPut(
      uploadUrl: data['uploadUrl'] as String,
      objectKey: data['objectKey'] as String,
    );
  }

  /// Mint a presigned GET (5-min TTL; 410 once the object passes its lifecycle).
  Future<String> presignGet(String objectKey) async {
    final res = await _sb.functions
        .invoke('recordings-presign-get', body: {'objectKey': objectKey});
    if (res.status != 200) throw mapEdgeError(res);
    return (res.data as Map)['url'] as String;
  }

  Future<void> putBytes(
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

  Future<List<int>> getBytes(String url) async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 410) {
      throw const GoneError('Recording expired');
    }
    if (res.statusCode != 200) {
      throw NetworkError('R2 download failed (${res.statusCode})');
    }
    return res.bodyBytes;
  }
}

@riverpod
R2Client r2Client(Ref ref) => R2Client(ref.watch(supabaseProvider));
