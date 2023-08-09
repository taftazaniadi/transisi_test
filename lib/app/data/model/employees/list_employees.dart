import 'dart:convert';

import 'package:transisi_test/app/data/model/employees/employess.dart';

class ListEmployees {
  final List<Employee> employees;

  const ListEmployees({
    List<Employee>? employees,
  }) : employees = employees ?? const <Employee>[];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employees': employees.map((e) => e.toMap()).toList(),
    };
  }

  factory ListEmployees.fromMap(Map<String, dynamic> map) {
    return ListEmployees(
      employees: List<Employee>.from(
          map['employees']?.map((e) => Employee.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListEmployees.fromJson(String source) =>
      ListEmployees.fromMap(json.decode(source) as Map<String, dynamic>);
}