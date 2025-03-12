
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/feature/music/music.dart';
class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        child: Image.asset(
          song.image,
          width: 50.w,
          height: 50.h,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(song.songName),
      subtitle: Text(song.artistName),
      trailing: IconButton(
        icon: Icon(Icons.play_circle_fill, size: AppSizes.iconLarge),
        onPressed: () {
          Get.toNamed(RoutesName.songPlayScreen, arguments: song);
        },
      ),
    );
  }
}
