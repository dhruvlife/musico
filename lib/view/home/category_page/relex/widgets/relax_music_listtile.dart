// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class RelaxMusicListTile extends StatelessWidget {
  final Song song;
  final VoidCallback onTapMore;
  final VoidCallback onPlay;
  final VoidCallback onSongTap;
  final MusicController audioService;

  const RelaxMusicListTile({
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
        bool isPlaying = audioService.currentSong.value?.song == song.song;
        bool isPlay = audioService.isPlaying.value && audioService.currentSong.value?.song == song.song;

        return Container(
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
            color: isPlaying ? Colors.blue.withOpacity(0.2) : Colors.transparent,
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:isPlaying ? Colors.blue : Colors.grey, ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // color: isPlaying ? Colors.blue : Colors.grey,
                    Text(
                      song.artistName,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color:isPlaying ? Colors.blue : Colors.grey, ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onPlay,
                icon: Icon(
                  isPlay ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  size: AppSizes.iconMediumLarge,
                  color: isPlaying ? Colors.blue : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: onTapMore,
                icon:  Icon(Icons.more_vert, size: AppSizes.iconMediumLarge ),
              ),
            ],
          ).paddingSymmetric(horizontal: AppSizes.horizontalSmall, vertical: AppSizes.verticalExtraSmall),
        ).paddingOnly(bottom: AppSizes.verticalExtraSmall);
      }),
    );
  }
}
