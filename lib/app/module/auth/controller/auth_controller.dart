import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test/app/data/network/api/auth_api.dart';
import 'package:transisi_test/app/util/process_dialog.dart';
import 'package:transisi_test/app/util/storage.dart';

class AuthController extends GetxController with StateMixin {
  final AuthAPI _loginAuth = AuthAPI();
  final Storage _storage = Storage();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void login(String email, String password) async {
    showAlertDialog(isDarkMode: Get.isDarkMode);

    Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'password': password,
    };

    try {
      final response = await _loginAuth.login(data: data);

      if (response.statusCode == 200) {
        Get.offNamed('/employee');

        _storage.saveToken(response.data['token']);
      } else {
        Get.back();

        Get.snackbar(
          'Error',
          response.statusMessage!,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.back();

      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
