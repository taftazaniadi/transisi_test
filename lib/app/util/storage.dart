import 'package:get_storage/get_storage.dart';

class Storage {
  final storage = GetStorage();

  saveToken(String token) {
    storage.write('token', token);
  }
}