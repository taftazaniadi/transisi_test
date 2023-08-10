import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test/app/module/employee/controller/employee_controller.dart';

class ListEmployeeScreen extends StatefulWidget {
  const ListEmployeeScreen({super.key});

  @override
  State<ListEmployeeScreen> createState() => _ListEmployeeScreenState();
}

class _ListEmployeeScreenState extends State<ListEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('List Employee'),
            automaticallyImplyLeading: false,
          ),
          body: controller.obx(
            (result) {
              return ListView.builder(
                itemCount: result['data'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        result['data'][index]['avatar'],
                      ),
                    ),
                    title: Text(
                      result['data'][index]['first_name'] + ' ' + result['data'][index]['last_name'],
                    ),
                    subtitle: Text(
                      result['data'][index]['email'],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.star_border,
                      ),
                      onPressed: () {
                        // controller.delete(result['data'][index]['id']);
                      },
                    ),
                    onTap: () {
                      controller.detail(result['data'][index]['id']);
                    },
                  );
                },
              );
            },
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onError: (error) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed('/employee/add'),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
