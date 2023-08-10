import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test/app/module/auth/controller/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Transisi Test",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          // enabled: !controller.loginProcess.value,
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Email",
                          ),
                          validator: (String? value) => value!.trim().isEmpty
                              ? "Email is required"
                              : null,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          // enabled: !controller.loginProcess.value,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                              icon: const Icon(Icons.lock),
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )),
                          obscureText: !_passwordVisible,
                          validator: (String? value) => value!.trim().isEmpty
                              ? "Password is required"
                              : null,
                        ),
                        const SizedBox(height: 32),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor,
                          child: MaterialButton(
                            minWidth: Get.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 25,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login(
                                  controller.emailController.text,
                                  controller.passwordController.text,
                                );
                              }
                            },
                            child: const Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
