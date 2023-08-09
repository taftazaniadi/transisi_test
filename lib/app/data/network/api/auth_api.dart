import 'package:dio/dio.dart';
import 'package:transisi_test/app/data/network/api_service.dart';

class AuthAPI {
  final ApiServices _apiServices = ApiServices();

  Future<Response> login({Map<String, dynamic>? data}) async {
    return await _apiServices.request(
      '/login',
      'POST',
      data,
    );
  }
}
