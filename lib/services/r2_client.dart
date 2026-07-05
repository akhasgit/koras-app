import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/errors/app_error.dart';
import 'koras_api_client.dart';

part 'r2_client.g.dart';

/// Simplified R2 transfer client.
///
/// Presign requests now go through koras-api (no more edge functions).
/// Direct PUT/GET remain for cases where the presigned URL is already minted
/// (e.g. AI Tutor recording upload via presigned PUT).
class R2Client {
  R2Client(this._api);
  final KorasApiClient _api;

  /// Get a playback URL for an audio key (minted by koras-api).
  Future<String> playbackUrl(String audioKey) => _api.playbackUrl(audioKey);

  /// PUT bytes directly to R2 using a presigned URL.
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
R2Client r2Client(Ref ref) => R2Client(ref.watch(korasApiClientProvider));
