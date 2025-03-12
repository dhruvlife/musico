
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class MusicListTile extends StatelessWidget {
  final Song song;
  final VoidCallback onTapMore;
  final VoidCallback onPlay;
  final VoidCallback onSongTap;
  final MusicController audioService;

  const MusicListTile({
    super.key,
    required this.song,
    required this.onTapMore,
    required this.onPlay,
    required this.onSongTap,
    required this.audioService,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSongTap,
      child: Obx(() {
        bool isPlay = audioService.isPlaying.value &&
            audioService.currentSong.value == song;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
            color: isPlay
                ? const Color.fromARGB(80, 33, 149, 243)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                child: Image.asset(
                  song.image,
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.fill,
                ),
              ).paddingOnly(right: AppSizes.horizontalSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.songName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: isPlay ? Colors.blue : Colors.grey,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      song.artistName,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: isPlay ? Colors.blue : Colors.grey,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onPlay, // Corrected to call the actual function
                icon: Icon(
                  isPlay ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  size: AppSizes.iconMediumLarge,
                  color: isPlay ? Colors.blue : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: onTapMore,
                icon: Icon(Icons.more_vert, size: AppSizes.iconMediumLarge),
              ),
            ],
          ).paddingSymmetric(
              horizontal: AppSizes.horizontalSmall,
              vertical: AppSizes.verticalExtraSmall),
        ).paddingOnly(bottom: AppSizes.verticalExtraSmall);
      }),
    );
  }
}
