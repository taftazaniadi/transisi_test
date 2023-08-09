import 'dart:convert';

class Employee {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const Employee({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  })  : id = id ?? 0,
        email = email ?? '',
        firstName = firstName ?? '',
        lastName = lastName ?? '',
        avatar = avatar ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}
