import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/constant/font_size.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._(); //To avoid creating instances

  // Light Theme 
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.dark,
      side: const BorderSide(color: AppColors.dark),
      textStyle: TextStyle(fontSize: FontSize.fontSizeTitleMedium, color: AppColors.black, fontWeight: FontWeight.w600),
      padding:  EdgeInsets.symmetric(vertical:8.h, horizontal: AppSizes.horizontalMedium),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );

//  Dark Theme 
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.light,
      side:const BorderSide(color: AppColors.light),
      textStyle:TextStyle(fontSize: FontSize.fontSizeTitleMedium, color: AppColors.light, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: AppSizes.horizontalMedium),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}
