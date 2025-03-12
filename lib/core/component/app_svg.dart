import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';

class AppSvg extends StatelessWidget {
  final String svg;
  final double height;
  final double width;
  final Color? color;
  final bool applyColor;
  const AppSvg({
    super.key,
    required this.svg,
    required this.height,
    required this.width,
    this.color,required this.applyColor,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      height: height,
      width: width,
      colorFilter:applyColor? ColorFilter.mode(color ?? AppColors.grey, BlendMode.srcIn) :null,
    );
  }
}
