import 'package:get/get.dart';
import 'package:transisi_test/app/module/auth/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
