import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/mix/widgets/mix_for_you_design.dart';
import 'package:musico/feature/music/music.dart';

class MixForYouList extends StatelessWidget {
  final List<Song> songs;
  final VoidCallback onTapMixList;

  const MixForYouList({super.key, required this.songs, required this.onTapMixList,});

  @override
  Widget build(BuildContext context) {
    int songsShow = songs.length.clamp(0, 4); // Ensure max 4 songs
    return SizedBox(
      height: 160.h,
      width: 120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTapMixList,
            child: Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(color: AppColors.mediumTransp),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: songsShow,
                itemBuilder: (context, index) {
                  return SizedBox(
                          height: 120.h,
                          width: 120.w,
                          child: MixForYouSongDesign(song: songs[index]))
                      .paddingSymmetric(horizontal: 1.w, vertical: 1.h);
                },
              ),
            ).paddingOnly(right: 10.w),
          ),
          if (songs.isNotEmpty)
            Text(
              songs.first.category, // Show category name
              style: Theme.of(context).textTheme.labelLarge,
            ),
        ],
      ),
    );
  }
}
