import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musico/feature/music/music.dart';

class MixForYouSongDesign extends StatelessWidget {
  final Song song;
  const MixForYouSongDesign({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      fit: BoxFit.fill,
      song.image,
      height: 50.h,
      width: 50.w,
    );
  }
}
