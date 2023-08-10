// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:transisi_test/app/module/auth/binding/auth_binding.dart';
import 'package:transisi_test/app/module/auth/view/login_view.dart';
import 'package:transisi_test/app/module/employee/binding/employee_binding.dart';
import 'package:transisi_test/app/module/employee/view/create_employee_screen.dart';
import 'package:transisi_test/app/module/employee/view/detail_employee_screen.dart';
import 'package:transisi_test/app/module/employee/view/list_employee_screen.dart';

part 'routes.dart';

class Pages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.EMPLOYEE,
      page: () => const ListEmployeeScreen(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_EMPLOYEE,
      page: () => const DetailEmployeeScreen(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: Routes.ADD_EMPLOYEE,
      page: () => const CreateEmployeeScreen(),
      binding: EmployeeBinding(),
    ),
  ];
}