
/* -- Light & Dark Elevated Button Themes -- */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/constant/font_size.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  // Light 
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.dark,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.darkerGrey,
      side: const BorderSide(color: AppColors.darkerGrey),
      padding: EdgeInsets.symmetric(vertical:8.h),
      textStyle: TextStyle(fontSize: FontSize.fontSizeTitleMedium, color: AppColors.dark, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );

  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.dark,
      backgroundColor: AppColors.light,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.darkerGrey,
      side: BorderSide(color: AppColors.lightGrey),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      textStyle: TextStyle(fontSize: FontSize.fontSizeTitleMedium, color: AppColors.dark, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}
