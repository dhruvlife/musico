
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSizedBox extends StatelessWidget {
  final Widget widget;
  final double? height;
  const ButtonSizedBox({
    super.key,
    required this.widget,  this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:height?? 50.h,
      child: widget,
    );
  }
}
