import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musico/core/component/app_svg.dart';
import 'package:musico/core/component/button_sizedbox.dart';
import 'package:musico/core/key/app_images.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/storage/storage_key.dart';
import 'package:musico/core/storage/storage_object.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/utils/functional_component.dart';
import 'package:musico/feature/auth/google_auth.dart';

class SignUpBottom extends StatefulWidget {
  const SignUpBottom({super.key});
  @override
  State<SignUpBottom> createState() => _SignUpBottomState();
}

class _SignUpBottomState extends State<SignUpBottom> {
  final GoogleAuthHelper googleController = GoogleAuthHelper();
  GoogleSignInAccount? user;

  Future<void> handleGoogleSignOut() async {
    await googleController.signOut();
    setState(() {
      user = null;
    });
    await StorageObject.remove(StorageKey.login); // Remove login status
    AppFunctionalComponent.showSnackBar(
        message: AppStrings.onSignOutGoogle, backgroundColor: AppColors.error);
  }

  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser =
          await googleController.signInWithGoogle();
      if (googleUser != null) {
        setState(() {
          user = googleUser;
        });

        // Store login status in GetStorage
        await StorageObject.write(StorageKey.login, true);
        await StorageObject.write(StorageKey.name, googleUser.displayName);
        await StorageObject.write(StorageKey.image, googleUser.photoUrl);

        AppFunctionalComponent.showSnackBar(
            message: 'Welcome, ${googleUser.displayName}!',
            backgroundColor: AppColors.success);

        Get.offAllNamed(RoutesName.bottomMenu, arguments: googleUser);
      }
    } catch (e) {
      AppFunctionalComponent.showSnackBar(
        backgroundColor: AppColors.error,
        message: AppStrings.googleError + e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: user == null ? 270.h : 360.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(AppStrings.signupText),
            ),
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(RoutesName.phoneAuth);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvg(
                      applyColor: true,
                      svg: AppImages.phone,
                      height: 20.sp,
                      width: 20.sp,
                    ).paddingOnly(right: AppSizes.horizontalSmall),
                    Text(AppStrings.phone),
                  ]),
            ),
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: OutlinedButton(
              onPressed: user == null ? handleGoogleSignIn : handleGoogleSignOut,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvg(
                      applyColor: false,
                      svg: AppImages.google,
                      height: 20.sp,
                      width: 20.sp,
                    ).paddingOnly(right: AppSizes.horizontalSmall),
                    Text(user == null ? AppStrings.google : AppStrings.signOut),
                  ]),
            ),
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          ButtonSizedBox(
            widget: TextButton(
              onPressed: () {},
              child: Text(AppStrings.login,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}
