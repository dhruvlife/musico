import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/component/app_text.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/splash/widgets/splash_container.dart';
import 'package:musico/core/constant/font_size.dart';


class SignUpHeader extends StatefulWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  State<SignUpHeader> createState() => _SignUpHeaderState();
}

class _SignUpHeaderState extends State<SignUpHeader> {
  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      height: 110.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: AppStrings.logo,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                latterSpacing: 3,
              ).paddingOnly(right: AppSizes.horizontalSmall),
              
              SplashContainer(
                  height: 7.5.sp,
                  width: 7.5.sp,
                  color: AppColors.splashContainer3),
              SplashContainer(
                  height: 15.sp,
                  width: 15.sp,
                  color: AppColors.splashContainer2),
              SplashContainer(
                  height: 30.sp,
                  width: 30.sp,
                  color: AppColors.splashContainer1),
            ],
          ).paddingOnly(bottom: AppSizes.horizontalLarge),
          AppText(
            text: AppStrings.signUpSubTitle,
            fontSize: FontSize.fontSizeTitleMedium,
            fontWeight: FontWeight.w400,
            color: AppColors.notificationHome
          ),
        ],
      ),
    ).paddingSymmetric(vertical: AppSizes.horizontalMediumLarge * 2);
  }
}
