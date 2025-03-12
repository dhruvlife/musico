import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double? latterSpacing;
  final Color? color;

  const AppText({
    super.key, required this.text, required this.fontSize, required this.fontWeight, this.latterSpacing, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,letterSpacing:latterSpacing,color: color ),);
  }
}
