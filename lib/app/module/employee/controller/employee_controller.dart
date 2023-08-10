import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test/app/data/network/api/employee_api.dart';

class EmployeeController extends GetxController with StateMixin {
  final EmployeeAPI _employeeAPI = EmployeeAPI();

  late TextEditingController nameController;
  late TextEditingController jobController;

  var employee = {}.obs;
  var listEmployee = {}.obs;

  @override
  void onInit() {
    super.onInit();

    viewList();

    nameController = TextEditingController();
    jobController = TextEditingController();
  }

  void viewList() async {
    change(null, status: RxStatus.loading());

    try {
      final response = await _employeeAPI.listEmployee();

      if (response.statusCode == 200) {
        listEmployee.addAll(response.data);

        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(response.statusMessage!));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void detail($id) async {
    Get.toNamed(
      '/employee/detail',
    );

    change(null, status: RxStatus.loading());

    try {
      final response = await _employeeAPI.detailEmployee(id: $id);

      if (response.statusCode == 200) {
        employee.addAll(response.data);

        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(response.statusMessage!));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void create($name, $job) async {
    change(null, status: RxStatus.loading());

    Map<String, dynamic> data = <String, dynamic>{
      'name': $name,
      'job': $job,
    };

    try {
      final response = await _employeeAPI.createEmployee(data: data);

      if (response.statusCode == 201) {
        nameController.text = '';
        jobController.text = '';

        viewList();

        Get.offNamed(
          '/employee',
        );

        Get.snackbar(
          'Success',
          'Create Employee Success',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.back();

        Get.snackbar(
          'Error',
          response.statusMessage!,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        change(null, status: RxStatus.error(response.statusMessage!));
      }
    } catch (e) {
      Get.back();

      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
