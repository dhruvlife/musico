import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/auth/signup/widgets/signup_bottom.dart';
import 'package:musico/view/auth/signup/widgets/signup_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SignUpHeader(),
            Spacer(),
            SignUpBottom()
                .paddingSymmetric(horizontal: AppSizes.horizontalLarge)
          ],
        ),
      ),
    );
  }
}
