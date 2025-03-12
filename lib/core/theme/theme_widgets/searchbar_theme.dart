import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/constant/font_size.dart';

class SearchbarTheme{
SearchbarTheme._();
static final lightSearchBarTheme = SearchBarThemeData(
  textStyle: WidgetStateProperty.all(TextStyle(color: AppColors.dark,fontSize: FontSize.fontSizeTitleMedium,fontWeight: FontWeight.w500)),
  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius))),
  backgroundColor: WidgetStateProperty.all(AppColors.lightGrey),
  constraints: BoxConstraints(maxWidth: 200.w,minHeight: 56.h)
);
static final darkSearchBarTheme = SearchBarThemeData(
  textStyle: WidgetStateProperty.all(TextStyle(color: AppColors.dark,fontSize: FontSize.fontSizeTitleMedium,fontWeight: FontWeight.w500)),
  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius))),
  backgroundColor: WidgetStateProperty.all(AppColors.lightGrey),
  constraints: BoxConstraints(maxWidth: 200.w,minHeight: 56.h)
);
}