import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/key/app_images.dart';
import 'package:musico/core/constant/size.dart';

class ForYouBannerSection extends StatelessWidget {
  const ForYouBannerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            banner(AppImages.foryouBanner4)
                .paddingOnly(right: AppSizes.horizontalSmall),
            banner(AppImages.foryouBanner6)
                .paddingOnly(right: AppSizes.horizontalSmall),
            banner(AppImages.foryouBanner3)
                .paddingOnly(right: AppSizes.horizontalSmall),
            banner(AppImages.foryouBanner2)
                .paddingOnly(right: AppSizes.horizontalSmall),
            banner(AppImages.foryouBanner5)
                .paddingOnly(right: AppSizes.horizontalSmall),
            banner(AppImages.foryouBanner1)
                .paddingOnly(right: AppSizes.horizontalSmall),
          ],
        ),
      ),
    ).paddingOnly(bottom: AppSizes.verticalMedium);
  }

  Widget banner(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      child: Image.asset(
        image,
        height: 140.h,
        width: 280.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
