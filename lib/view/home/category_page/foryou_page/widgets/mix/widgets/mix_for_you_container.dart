import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/component/music_listtile.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/home/category_page/relex/widgets/relax_container_header.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class MixForYouContainer extends StatefulWidget {
  final List<Song> songs;
  final String songCategory;
  const MixForYouContainer({
    super.key,
    required this.songs,
    required this.songCategory,
  });
  @override
  State<MixForYouContainer> createState() => _MixForYouContainerState();
}

class _MixForYouContainerState extends State<MixForYouContainer> {
  int selectedIndex = 0;
  final audioService = Get.put(MusicController());
  @override
  void initState() {
    audioService.playSong(widget.songs[selectedIndex],
        queue: widget.songs, index: selectedIndex);
    super.initState();
  }
  @override
  void dispose() {
    audioService.onClose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Get the injected MusicController

    return Center(
      child: Container(
        height: 0.8.sh,
        width: 0.9.sw,
        decoration: BoxDecoration(
          color: AppColors.mediumTransp,
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.songs.first.artistName}'s Best",
              style: Theme.of(context).textTheme.bodyLarge,
            ).paddingOnly(
                top: AppSizes.verticalMedium, left: AppSizes.horizontalMedium),
            SizedBox(
              height: 0.15.sh,
              child: RelaxContainerHeader(
                onPlayList: () {
                  audioService.isPlaying.value &&
                          audioService.currentSong ==
                              widget.songs[selectedIndex]
                      ? audioService.togglePlayPause()
                      : audioService.listenList(widget.songs, selectedIndex);
                },
                category: widget.songCategory,
                song: widget.songs[selectedIndex],
                totalSong: widget.songs.length,
                onPrev: () {
                  setState(() {});
                  selectedIndex--;
                  audioService.playPreviousSong();
                },
                onNext: () {
                  setState(() {});
                  selectedIndex++;
                  audioService.playNextSong();
                },
              ),
            ),
            Divider(indent: 20, endIndent: 20),
            SizedBox(
              height: 0.55.sh,
              child: ListView.builder(
                itemCount: widget.songs.length,
                itemBuilder: (context, index) {
                  return MusicListTile(
                    song: widget.songs[index],
                    onTapMore: () {},
                    onPlay: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      audioService.currentIndex == index
                          ? audioService.togglePlayPause()
                          : audioService.playSong(widget.songs[index],
                              queue: widget.songs, index: index);
                    },
                    onSongTap: () {
                      selectedIndex = index;
                      audioService.stop();
                      Get.toNamed(RoutesName.songPlayScreen,
                          arguments: widget.songs[index]);
                    },
                    audioService: audioService,
                  );
                },
              ),
            ).paddingSymmetric(horizontal: AppSizes.horizontalSmall),
          ],
        ),
      ).paddingSymmetric(
          horizontal: AppSizes.horizontalMedium,
          vertical: AppSizes.verticalMedium),
    );
  }
}
