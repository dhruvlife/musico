import 'package:flutter/material.dart';

class PhoneAuthController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool otpSent = false;
  bool isVerified = false;
  String? errorMessage;
  static const String fixedOTP = "1234";

  void dispose() {
    phoneController.dispose();
    otpController.dispose();
  }
}
