import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transisi_test/app/routes/pages.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transisi Test',
      initialRoute: Pages.INITIAL,
      getPages: Pages.routes,
    );
  }
}
