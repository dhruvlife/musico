import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';


class BrowseSectionDesign extends StatelessWidget {
  final String image;
  final String language;
  final VoidCallback onTap;
  const BrowseSectionDesign(
      {super.key, required this.image, required this.language, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: 0.45.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                  height: 100.h,
                  width: 0.45.sw,
                )),
            Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 50, 0, 50),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppSizes.buttonRadius),
                    topLeft: Radius.circular(AppSizes.buttonRadius),
                  )),
              child: Text(
                language,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.light),
              ).paddingOnly(left: 5.w, top: 5.h),
            )
          ],
        ),
      ),
    );
  }
}
