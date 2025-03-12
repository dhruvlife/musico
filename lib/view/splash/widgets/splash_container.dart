import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';

class SplashContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const SplashContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r), color: color),
    ).paddingOnly(right: AppSizes.horizontalExtraSmall);
  }
}
