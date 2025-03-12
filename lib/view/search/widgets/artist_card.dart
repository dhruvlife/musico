import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/search/widgets/artist_song_screen.dart';
import 'package:musico/feature/music/music.dart';

class ArtistCard extends StatelessWidget {
  final String artistName;
  final String artistPhoto;

  const ArtistCard({
    super.key,
    required this.artistName,
    required this.artistPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final artistSongs = Song.allSongs
            .where((song) => song.artistName == artistName)
            .toList();
        Get.to(() => ArtistSongsScreen(
              artistName: artistName,
              artistSongs: artistSongs,
            ));
      },
      child: SizedBox(
        height: 80.h,
        width: 80.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.asset(
                artistPhoto,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.fill,
              ),
            ).paddingOnly(right: AppSizes.horizontalSmall),
            Text(
              artistName,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
