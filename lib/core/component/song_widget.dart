import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/utils/functional_component.dart';
import 'package:musico/feature/music/music.dart';

class SongWidget extends StatefulWidget {
  final Song song;
  const SongWidget({super.key, required this.song});

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesName.songPlayScreen, arguments: widget.song);
      },
      child: SizedBox(
        height: 110.h,
        width: 80.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    widget.song.image,
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                      color: AppColors.playButton,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Icon(
                    Icons.play_arrow,
                    color: AppFunctionalComponent.isDarkMode(context)
                        ? AppColors.dark
                        : AppColors.light,
                  ),
                ).paddingOnly(
                    left: AppSizes.horizontalExtraSmall,
                    bottom: AppSizes.verticalExtraSmall),
              ],
            ).paddingOnly(bottom: AppSizes.horizontalExtraSmall),
            Text(
              widget.song.songName.length >= 10
                  ? "${widget.song.songName.substring(0, 10)}.."
                  : widget.song.songName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            
          ],
        ),
      ).paddingOnly(right: AppSizes.horizontalSmall),
    );
  }
}
