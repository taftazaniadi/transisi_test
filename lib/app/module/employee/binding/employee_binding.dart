import 'package:get/get.dart';
import 'package:transisi_test/app/module/employee/controller/employee_controller.dart';

class EmployeeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeController>(
      () => EmployeeController(),
    );
  }
}
