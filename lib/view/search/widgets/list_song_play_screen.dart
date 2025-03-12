import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/home/category_page/relex/widgets/relax_music_listtile.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class SongListPlayScreen extends StatelessWidget {
  final String language;
  const SongListPlayScreen({super.key, required this.language});
  @override
  Widget build(BuildContext context) {
    final List<Song> langSongs =
        Song.allSongs.where((song) => song.language == language).toList();
    final MusicController audioService = Get.put(MusicController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          language,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: langSongs.length,
              itemBuilder: (context, index) {
                return RelaxMusicListTile(
                  song: langSongs[index],
                  onTapMore: () {},
                  onSongTap: () {
                    audioService.listenList(langSongs, index);
                    Get.toNamed(RoutesName.songPlayScreen,
                        arguments: langSongs[index]);
                  },
                  onPlay: () {
                    if (audioService.currentSong.value?.song ==
                            langSongs[index].song &&
                        audioService.isPlaying.value) {
                      audioService.togglePlayPause();
                    } else {
                      audioService.listenList(langSongs, index);
                    }
                  },
                  audioService: audioService,
                );
              },
            ).paddingSymmetric(
                horizontal: AppSizes.horizontalMedium,
                vertical: AppSizes.verticalMedium),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    audioService.playPreviousSong();
                  },
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () => audioService.listenList(
                      langSongs, audioService.currentIndex),
                  icon: Icon(
                    audioService.isPlaying.value
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                  ),
                ),
                IconButton(
                  onPressed: audioService.playNextSong,
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
