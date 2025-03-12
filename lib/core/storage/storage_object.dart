import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class StorageObject {
  StorageObject._();

  static Future<void> write(String key, dynamic value) async {
    box.write(key, value);
  }

  static dynamic read<T>(String key) {
    return box.read(key);
  }

  static bool hasData(String key) {
    return box.hasData(key);
  }

  static Future<void> remove(String key) async {
    box.remove(key);}
}