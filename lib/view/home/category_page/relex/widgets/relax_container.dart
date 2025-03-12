import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/component/app_text.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/home/category_page/relex/widgets/relax_container_header.dart';
import 'package:musico/view/home/category_page/relex/widgets/relax_music_listtile.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/constant/font_size.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class RelaxContainer extends StatelessWidget {
  final List<Song> songs;
  final String songCategory;
  final VoidCallback onTapSeeAll;
  final VoidCallback onPlay;
  final VoidCallback onPlayList;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  const RelaxContainer({
    super.key,
    required this.songs,
    required this.songCategory,
    required this.onTapSeeAll,
    required this.onPlay, required this.onPlayList, required this.onPrev, required this.onNext,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: AppColors.mediumTransp,
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
            width: 250.w,
            child: RelaxContainerHeader(
              onPlayList: onPlayList,
              category: songCategory,
              song: songs.first,
              totalSong: songs.length, onPrev: onPrev , onNext: onNext,
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 200.h,
            child: ListView.builder(
                 itemCount: songs.length < 4 ? songs.length : 4,

                itemBuilder: (context, index) {
                  return RelaxMusicListTile(
                    song: songs[index],
                    onTapMore: () {},
                    onPlay: onPlay,
                    onSongTap: () {
                      Get.toNamed(RoutesName.songPlayScreen,
                          arguments: songs[index]);
                    }, audioService: MusicController(),
                    // currentSong: songs[index].obs,
                  );
                }),
          ),
          // RelaxMusicListtile(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 35.h,
                width: 70.w,
                child: ElevatedButton(
                    onPressed: onTapSeeAll,
                    child: AppText(
                        text: "See All",
                        fontSize: FontSize.fontSizeTitleSmall,
                        fontWeight: FontWeight.w500)),
              ).paddingOnly(
                  right: AppSizes.horizontalMedium,
                  top: AppSizes.verticalMedium),
            ],
          )
        ],
      ),
    ).paddingSymmetric(
        horizontal: AppSizes.horizontalMedium,
        vertical: AppSizes.verticalMedium);
  }
}
