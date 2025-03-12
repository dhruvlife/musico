//snackbar
//bottomsheet
//dialoglog
//method je multiple time use thai a
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';

class AppFunctionalComponent {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static void showSnackBar({
    required String message,
    String title = 'Alert',
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
      snackPosition: position,
      duration: duration,
      margin: const EdgeInsets.all(10),
      borderRadius: AppSizes.buttonRadius,
    );
  }
}
