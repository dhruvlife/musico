import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/utils/functional_component.dart';

class BottomMenuButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final bool isActive;
  const BottomMenuButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text,
      required this.isActive});

  @override
  State<BottomMenuButton> createState() => _BottomMenuButtonState();
}

class _BottomMenuButtonState extends State<BottomMenuButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        height: 45.h,
        width: 60.w,
        child: Column(
          children: [
            Icon(
              widget.icon,
              color: widget.isActive
                  ? AppColors.lightElevatedButtonColor
                  : AppFunctionalComponent.isDarkMode(context)
                      ? AppColors.light
                      : AppColors.dark,
            ),
            Text(
              widget.text,
              style: widget.isActive
                  ? Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600)
                  : Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
