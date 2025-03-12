import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/key/app_images.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/search/widgets/artist_card.dart';
import 'package:musico/view/search/widgets/browse_section_design.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/feature/music/music.dart';

class SearchAlterScreen extends StatelessWidget {
  final List<String> uniqueArtists;
  const SearchAlterScreen({super.key, required this.uniqueArtists});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                  child: Row(
                    children: [
                      Icon(Icons.trending_up).paddingOnly(right: 10.w),
                      Text(
                        "Treding Artists",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: uniqueArtists.length,
                    itemBuilder: (context, index) {
                      final artistName = uniqueArtists[index];
                      final artistPhoto = Song.allSongs
                          .firstWhere((song) => song.artistName == artistName)
                          .artistPhoto;
                      return ArtistCard(
                          artistName: artistName, artistPhoto: artistPhoto);
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Browse",
            style: Theme.of(context).textTheme.bodyLarge,
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BrowseSectionDesign(
                language: AppStrings.english,
                image: AppImages.foryouBanner5, onTap: () { 
                  Get.toNamed(RoutesName.songListPlayScreen,arguments: AppStrings.english);
                 },
              ),
              BrowseSectionDesign(
                language:AppStrings.hindi,
                image: AppImages.foryouBanner4, onTap: () {
                  Get.toNamed(RoutesName.songListPlayScreen,arguments: AppStrings.hindi);
                  },
              ),
            ],
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BrowseSectionDesign(
                language:AppStrings.instrumental,
                image: AppImages.foryouBanner6, onTap: () { 
                  Get.toNamed(RoutesName.songListPlayScreen,arguments: AppStrings.instrumental);
                 },
              ),
              BrowseSectionDesign(
                language: AppStrings.english,
                image: AppImages.foryouBanner3, onTap: () {
                  Get.toNamed(RoutesName.songListPlayScreen,arguments: AppStrings.english);
                  },
              ),
            ],
          ),
        ],
      ).paddingSymmetric(
          horizontal: AppSizes.horizontalSmall,
          vertical: AppSizes.verticalSmall),
    );
  }
}
