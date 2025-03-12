import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {

  var isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
