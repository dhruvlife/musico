import 'package:flutter/material.dart';
import 'package:musico/core/constant/size.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  final String image;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      child: Image.asset(
        image,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
