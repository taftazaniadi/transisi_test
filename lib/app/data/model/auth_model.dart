import 'dart:convert';

class LoginAuth {
  final String email;
  final String password;

  LoginAuth({
    String? email,
    String? password,
  })  : email = email ?? '',
        password = password ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginAuth.fromMap(Map<String, dynamic> map) {
    return LoginAuth(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginAuth.fromJson(String source) =>
      LoginAuth.fromMap(json.decode(source) as Map<String, dynamic>);
}
