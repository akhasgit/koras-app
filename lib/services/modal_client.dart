import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/env/env.dart';
import '../core/errors/app_error.dart';

part 'modal_client.g.dart';

/// HTTPS client for the anonymous, short Modal `/analyze` path only.
/// Longer/privileged Modal endpoints go through edge functions (see 01/08).
/// Uses `dio` for multipart (`FormData`).
class ModalClient {
  ModalClient(this._dio);
  final Dio _dio;

  Future<Map<String, dynamic>> analyze(
    List<int> bytes,
    String filename,
  ) async {
    try {
      final form = FormData.fromMap({
        'file': MultipartFile.fromBytes(bytes, filename: filename),
      });
      final res = await _dio.post<dynamic>(
        '${Env.modalBaseUrl}/analyze',
        data: form,
      );
      return (res.data as Map).cast<String, dynamic>();
    } on DioException catch (e) {
      final status = e.response?.statusCode ?? 0;
      if (status >= 500) throw ServerError('Modal analyze failed ($status)');
      throw NetworkError('Modal analyze failed: ${e.message}');
    }
  }
}

@riverpod
ModalClient modalClient(Ref ref) => ModalClient(
      Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 60),
      )),
    );
