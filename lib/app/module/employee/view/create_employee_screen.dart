import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test/app/module/employee/controller/employee_controller.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.viewList();

            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Create Employee'),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Get.offNamed('/employee');
                },
              ),
              elevation: 0,
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.create(
                        controller.nameController.text,
                        controller.jobController.text,
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Full Name",
                      ),
                      validator: (String? value) =>
                          value!.trim().isEmpty ? "Full Name is required" : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: controller.jobController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.badge),
                        labelText: "Job",
                      ),
                      validator: (String? value) =>
                          value!.trim().isEmpty ? "Job is required" : null,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
