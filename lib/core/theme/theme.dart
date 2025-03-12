import 'package:flutter/material.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/theme/theme_widgets/elevated_button_theme.dart';
import 'package:musico/core/theme/theme_widgets/outlined_button_theme.dart';
import 'package:musico/core/theme/theme_widgets/searchbar_theme.dart';
import 'package:musico/core/theme/theme_widgets/text_theme.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    scaffoldBackgroundColor: AppColors.light,
    searchBarTheme: SearchbarTheme.lightSearchBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    scaffoldBackgroundColor: AppColors.dark,
    searchBarTheme: SearchbarTheme.darkSearchBarTheme,
  );
}