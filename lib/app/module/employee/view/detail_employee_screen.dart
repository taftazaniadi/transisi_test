import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test/app/module/employee/controller/employee_controller.dart';

class DetailEmployeeScreen extends StatefulWidget {
  const DetailEmployeeScreen({super.key});

  @override
  State<DetailEmployeeScreen> createState() => _DetailEmployeeScreenState();
}

class _DetailEmployeeScreenState extends State<DetailEmployeeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
              title: const Text('Detail Employee'),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  controller.viewList();
        
                  Get.back();
                },
              ),
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.star_border,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {
                    Get.toNamed('/employee/edit');
                  },
                ),
              ],
            ),
            body: controller.obx(
              (result) {
                return ListView(
                  children: [
                    Container(
                      height: Get.height * 0.5,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            result['data']['avatar'],
                            width: 200,
                            height: 200,
                          ),
                          Text(
                            result['data']['first_name'] +
                                ' ' +
                                result['data']['last_name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: ListTile(
                        leading: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                            ),
                          ],
                        ),
                        title: Text(
                          result['data']['first_name'] +
                              ' ' +
                              result['data']['last_name'],
                        ),
                        subtitle: const Text('Fullname'),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: ListTile(
                        leading: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email,
                            ),
                          ],
                        ),
                        title: Text(result['data']['email']),
                        subtitle: const Text('Email'),
                      ),
                    ),
                  ],
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
          ),
        );
      },
    );
  }
}
