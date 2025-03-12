import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/constant/font_size.dart';
import 'package:musico/feature/auth/phone_auth_controller.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final PhoneAuthController controller = PhoneAuthController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppStrings.onPhoneSuccess,
          style: TextStyle(
              fontSize: FontSize.fontSizeLabelLarge, color: AppColors.light),
        ),
        backgroundColor: AppColors.splashContainer1,
        duration: const Duration(seconds: 2),
      ),
    );
    Get.offAllNamed(RoutesName.home,
        arguments: controller.phoneController.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.phoneAuth),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Phone Number Input
            TextFormField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: AppStrings.enterPhone,
                prefixText: "+91 ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.requirePhone;
                } else if (value.length != 10) {
                  return AppStrings.validPhone;
                }
                return null;
              },
            ).paddingOnly(bottom: AppSizes.verticalExtraSmall),

            if (controller.otpSent)
              TextFormField(
                controller: controller.otpController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                  labelText: AppStrings.enterOtp,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppSizes.buttonRadius)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.requireOtp;
                  } else if (value.length != 4) {
                    return AppStrings.digitOtp;
                  }
                  return null;
                },
              ),

            if (controller.errorMessage != null)
              Text(
                controller.errorMessage!,
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: FontSize.fontSizeTitleSmall,
                ),
              ).paddingOnly(bottom: AppSizes.verticalSmall),

            if (controller.otpSent)
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (controller.otpController.text ==
                          PhoneAuthController.fixedOTP) {
                        controller.errorMessage = null;
                        showSuccessSnackbar(context);

                        // print(controller.phoneController.toString());
                      } else {
                        controller.errorMessage = AppStrings.invalidOtp;
                      }
                    });
                  },
                  child: Text(AppStrings.verifyOtp),
                ),
              ),

            if (!controller.otpSent)
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      setState(() {
                        controller.otpSent = true;
                        controller.errorMessage = null;
                      });
                    }
                  },
                  child: Text(AppStrings.sendOtp),
                ),
              ),
          ],
        ).paddingSymmetric(
          vertical: AppSizes.verticalLarge,
          horizontal: AppSizes.horizontalLarge,
        ),
      ),
    );
  }
}
