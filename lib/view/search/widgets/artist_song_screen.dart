import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/search/widgets/song_card.dart';
import 'package:musico/feature/music/music.dart';

class ArtistSongsScreen extends StatelessWidget {
  final String artistName;
  final List<Song> artistSongs;

  const ArtistSongsScreen(
      {super.key, required this.artistName, required this.artistSongs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(artistName),
        // backgroundColor: AppColors.lightGrey,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180.h,
                width: 180.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.r),
                  child: Image.asset(
                    artistSongs.first.artistPhoto,
                    fit: BoxFit.fill,
                  ),
                ),
              ).paddingOnly(bottom: AppSizes.verticalSmall),
            ],
          ),
          Text("Hits of $artistName : ",
                  style: Theme.of(context).textTheme.headlineSmall)
              .paddingOnly(bottom: AppSizes.verticalSmall),
          Expanded(
            child: ListView.builder(
              itemCount: artistSongs.length,
              itemBuilder: (context, index) {
                return SongCard(song: artistSongs[index]);
              },
            ),
          ),
        ],
      ).paddingSymmetric(
        horizontal: AppSizes.horizontalMedium,
        vertical: AppSizes.verticalSmall,
      ),
    );
  }
}
