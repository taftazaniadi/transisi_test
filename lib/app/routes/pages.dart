// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'routes.dart';

class Pages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Container(),
    ),
    GetPage(
      name: Routes.EMPLOYEE,
      page: () => Container(),
    ),
    GetPage(
      name: Routes.DETAIL_EMPLOYEE,
      page: () => Container(),
    ),
    GetPage(
      name: Routes.ADD_EMPLOYEE,
      page: () => Container(),
    ),
  ];
}