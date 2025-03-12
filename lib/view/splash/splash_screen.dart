import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musico/core/component/app_text.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/storage/storage_key.dart';
import 'package:musico/core/storage/storage_object.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/splash/widgets/splash_container.dart';

import 'package:musico/core/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GoogleSignInAccount? user;
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    bool isLoggedIn = StorageObject.hasData(StorageKey.login) &&
        StorageObject.read<bool>(StorageKey.login) == true;
    await Future.delayed(Duration(seconds: 2));
    if (isLoggedIn) {
      Get.offAllNamed(RoutesName.bottomMenu,
          arguments: {StorageKey.name, StorageKey.image, StorageKey.login});
    } else {
      Get.toNamed(
        RoutesName.signUp,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInLeft(
              from: -100,
              child: AppText(
                text: AppStrings.logo,
                fontSize: 40.sp,
                fontWeight: FontWeight.w700,
                latterSpacing: 2,
              ).paddingOnly(right: AppSizes.horizontalMedium),
            ),
            BounceInDown(
              from: 100,
              child: SplashContainer(
                height: 10.sp,
                width: 10.sp,
                color: AppColors.splashContainer3,
              ),
            ),
            BounceInDown(
              from: 175,
              child: SplashContainer(
                height: 20.sp,
                width: 20.sp,
                color: AppColors.splashContainer2,
              ),
            ),
            BounceInDown(
              from: 250,
              child: SplashContainer(
                height: 40.sp,
                width: 40.sp,
                color: AppColors.splashContainer1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomAnimationBounceDown extends StatelessWidget {
//   final Widget widget;
//   final double height;
//   final double width;
//   final Color color;
//   const CustomAnimationBounceDown({super.key, required this.widget, required this.height, required this.width, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return BounceInDown(
//       child: SplashContainer(
//         height: height,
//         width: width,
//         color: color,
//       ),
//     );
//   }
// }
