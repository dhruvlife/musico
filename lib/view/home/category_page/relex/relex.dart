import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/mix/widgets/mix_for_you_list.dart';
import 'package:musico/view/home/category_page/relex/widgets/relax_container.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class RelexScreen extends StatelessWidget {
  const RelexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<Song>> categorizedSongs = {};
    final audioService = MusicController();

    for (var song in Song.allSongs) {
      categorizedSongs.putIfAbsent(song.category, () => []).add(song);
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.relextTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ).paddingOnly(top: AppSizes.verticalMedium),
          SizedBox(
            height: 440.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorizedSongs.length - 1,
              itemBuilder: (context, index) {
                String category = categorizedSongs.keys.elementAt(index);
                List<Song> songs = categorizedSongs[category] ?? [];

                return RelaxContainer(
                  onPlayList: () {
                    audioService.listenList(songs, 0);
                  },
                  songCategory: songs[index].songName,
                  songs: songs,
                  onPrev: audioService.playPreviousSong,
                  onNext: audioService.playNextSong,
                  onTapSeeAll: () {
                    Get.toNamed(RoutesName.mixForYouScreen, arguments: songs);
                  },
                  onPlay: () {
                    audioService.listenList(songs, index);
                  },
                );
              },
            ),
          ),
          Text(
            AppStrings.mixTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorizedSongs.length,
              itemBuilder: (context, index) {
                String category = categorizedSongs.keys.elementAt(index);
                List<Song> songs = categorizedSongs[category] ?? [];

                return MixForYouList(
                  songs: songs,
                  onTapMixList: () {
                    Get.toNamed(RoutesName.mixForYouScreen, arguments: songs);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
