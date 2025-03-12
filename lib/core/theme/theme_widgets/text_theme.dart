import 'package:flutter/material.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/font_size.dart';

class AppTextTheme {
  AppTextTheme._(); 

  /// Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeheadlineLarge, fontWeight: FontWeight.w800, color: AppColors.dark),
    headlineMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeheadlineMedium, fontWeight: FontWeight.w600, color: AppColors.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: FontSize.fontSizeheadlineSmall, fontWeight: FontWeight.w500, color: AppColors.dark),

    titleLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleLarge, fontWeight: FontWeight.w600, color: AppColors.dark),
    titleMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeLabelMedium, fontWeight: FontWeight.w500, color: AppColors.dark),
    titleSmall: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleSmall, fontWeight: FontWeight.w400, color: AppColors.dark),

    bodyLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleMedium, fontWeight: FontWeight.w600, color: AppColors.dark),
    bodyMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleSmall, fontWeight: FontWeight.w500, color: AppColors.dark),
    bodySmall: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleSmall, fontWeight: FontWeight.w300, color: AppColors.dark),

    labelLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeLabelLarge, fontWeight: FontWeight.normal, color: AppColors.dark),
    labelMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeLabelMedium, fontWeight: FontWeight.normal, color: AppColors.dark),
    labelSmall: const TextStyle().copyWith(fontSize:FontSize.fontSizeLabelSmall, fontWeight: FontWeight.normal, color: AppColors.dark),
  );

  /// Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeheadlineLarge, fontWeight: FontWeight.w800, color: AppColors.light),
    headlineMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeheadlineMedium, fontWeight: FontWeight.w600, color: AppColors.light),
    headlineSmall: const TextStyle().copyWith(fontSize: FontSize.fontSizeheadlineSmall, fontWeight: FontWeight.w500, color: AppColors.light),

    titleLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleLarge, fontWeight: FontWeight.w600, color: AppColors.light),
    titleMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleMedium, fontWeight: FontWeight.w500, color: AppColors.light),
    titleSmall: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleSmall, fontWeight: FontWeight.w400, color: AppColors.light),

    bodyLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleMedium, fontWeight: FontWeight.w600, color: AppColors.light),
    bodyMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleSmall, fontWeight: FontWeight.w500, color: AppColors.light),
    bodySmall: const TextStyle().copyWith(fontSize: FontSize.fontSizeTitleSmall, fontWeight: FontWeight.w300, color: AppColors.light),

    labelLarge: const TextStyle().copyWith(fontSize: FontSize.fontSizeLabelLarge, fontWeight: FontWeight.normal, color: AppColors.light),
    labelMedium: const TextStyle().copyWith(fontSize: FontSize.fontSizeLabelMedium, fontWeight: FontWeight.normal, color: AppColors.light),
    labelSmall: const TextStyle().copyWith(fontSize:FontSize.fontSizeLabelSmall, fontWeight: FontWeight.normal, color: AppColors.light),
  );
}
