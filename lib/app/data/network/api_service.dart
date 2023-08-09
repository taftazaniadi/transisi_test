// ignore_for_file: unnecessary_question_mark

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transisi_test/app/constant/app_url.dart';
import 'package:transisi_test/app/data/network/dio_logging.dart';

class ApiServices {
  final storage = GetStorage();

  static const Duration oneMinute = Duration(minutes: 1);

  final Dio _dio = createDio();

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppUrl.baseUrl,
        sendTimeout: oneMinute,
        connectTimeout: oneMinute,
        receiveTimeout: oneMinute,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(Logging());

    return dio;
  }

  // Request Function
  Future<Response> request(
    String url,
    String method,
    dynamic? data,
  ) async {
    if (method == 'GET') {
      return await _dio.get(url);
    } else if (method == 'POST') {
      return await _dio.post(
        url,
        data: data,
      );
    } else if (method == 'UPDATE') {
      return await _dio.put(
        url,
        data: data,
      );
    } else {
      throw Exception('Method not implemented');
    }
  }
}
