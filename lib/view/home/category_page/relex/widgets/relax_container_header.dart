import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/component/round_image.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class RelaxContainerHeader extends StatelessWidget {
  final String category;
  final Song song;
  final int totalSong;
  final VoidCallback onPlayList;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const RelaxContainerHeader({
    super.key,
    required this.category,
    required this.song,
    required this.totalSong,
    required this.onPlayList,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final audioService = MusicController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundImage(
              image: song.image,
              height: 50.h,
              width: 50.w,
            ).paddingOnly(right: AppSizes.horizontalMedium),
            SizedBox(
              height: 50.h,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      song.songName.length <= 13
                          ? song.songName
                          : "${song.songName.substring(0, 12)}..",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text("Total songs : $totalSong",
                      style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ).paddingOnly(top: AppSizes.verticalSmall),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 30.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: AppColors.mediumTransp,
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  relexHeaderButton(Icons.favorite, () {}),
                  relexHeaderButton(Icons.more_vert, () {}),
                  relexHeaderButton(Icons.skip_previous, onPrev),
                  relexHeaderButton(
                      audioService.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      onPlayList),
                  relexHeaderButton(Icons.skip_next, onNext),
                ],
              ),
            ).paddingOnly(right: AppSizes.horizontalSmall),
          ],
        ),
      ],
    );
  }

  SizedBox relexHeaderButton(IconData icon, VoidCallback fun) {
    return SizedBox(
      height: 30.h,
      width: 30.w,
      child: IconButton(
        onPressed: fun,
        icon: Icon(
          icon,
          size: AppSizes.iconSmall,
        ),
      ),
    );
  }
}

