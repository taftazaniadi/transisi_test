import 'package:transisi_test/app/data/network/api_service.dart';

class EmployeeAPI {
  final ApiServices _apiServices = ApiServices();

  Future<dynamic> listEmployee() async {
    return await _apiServices.request(
      '/users?page=1',
      'GET',
      null,
    );
  }

  Future<dynamic> detailEmployee({String? id}) async {
    return await _apiServices.request(
      '/users/$id',
      'GET',
      null,
    );
  }

  Future<dynamic> createEmployee({Map<String, dynamic>? data}) async {
    return await _apiServices.request(
      '/users',
      'POST',
      data,
    );
  }
}