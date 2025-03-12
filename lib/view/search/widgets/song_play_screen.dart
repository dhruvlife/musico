// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:musico/core/constant/size.dart';
// import 'package:musico/core/constant/song_path.dart';
// import 'package:musico/core/utils/functional_component.dart';
// import 'package:musico/feature/download/download.dart';
// import 'package:musico/feature/music/audio_service.dart';
// import 'package:musico/feature/music/music.dart';

// class SongPlayScreen extends StatefulWidget {
//   final Song song;
//   const SongPlayScreen({super.key, required this.song});

//   @override
//   State<SongPlayScreen> createState() => _SongPlayScreenState();
// }

// class _SongPlayScreenState extends State<SongPlayScreen> {
//   final musicController = Get.put(MusicController());
//   final downloader = DownloadService();

//   @override
//   void initState() {
//     super.initState();
//     musicController.playSong(widget.song);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.song.songName,
//             style: Theme.of(context).textTheme.bodyLarge),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.download),
//             onPressed: ()  {
//            // download on tap
//             },
//           ).paddingOnly(right: AppSizes.horizontalMedium),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Song Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
//             child: Image.asset(widget.song.image,
//                 width: 200.w, height: 200.h, fit: BoxFit.fill),
//           ).paddingOnly(bottom: AppSizes.verticalMedium),

//           Text(widget.song.artistName,
//               style: Theme.of(context).textTheme.bodyLarge),

//           Obx(
//             () => Slider(
//               activeColor: Colors.blue.shade800,
//               value: musicController.currentPosition.value.inSeconds
//                   .toDouble()
//                   .clamp(0.0,
//                       musicController.songDuration.value.inSeconds.toDouble()),
//               min: 0,
//               max: musicController.songDuration.value.inSeconds.toDouble(),
//               onChanged: (value) {
//                 musicController.seek(Duration(seconds: value.toInt()));
//               },
//             ),
//           ).paddingSymmetric(horizontal: AppSizes.horizontalMedium),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Obx(() => Text(
//                   "${musicController.currentPosition.value.inMinutes}:${(musicController.currentPosition.value.inSeconds % 60).toString().padLeft(2, '0')}")),
//               Obx(() => Text(
//                   "${musicController.songDuration.value.inMinutes}:${(musicController.songDuration.value.inSeconds % 60).toString().padLeft(2, '0')}")),
//             ],
//           ).paddingSymmetric(horizontal: AppSizes.horizontalLarge),

//           // Play/Pause Button
//           Obx(
//             () => IconButton(
//               icon: Icon(
//                 musicController.isPlaying.value
//                     ? Icons.pause_circle
//                     : Icons.play_circle,
//                 size: AppSizes.iconLarge * 1.5,
//                 color: Colors.blue,
//               ),
//               onPressed: () {
//                 musicController.togglePlayPause();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/feature/download/download.dart';
import 'package:musico/feature/music/audio_service.dart';
import 'package:musico/feature/music/music.dart';

class SongPlayScreen extends StatefulWidget {
  final Song song;
  const SongPlayScreen({super.key, required this.song});

  @override
  State<SongPlayScreen> createState() => _SongPlayScreenState();
}

class _SongPlayScreenState extends State<SongPlayScreen> {
  final musicController = Get.put(MusicController());
  final downloader = DownloadService();

  @override
  void initState() {
    super.initState();
    musicController.playSong(widget.song);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.songName,
            style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
        actions: [
           Obx(() {
            bool isDownloaded = downloader.downloadSong.contains(
                "/storage/emulated/0/Download/Musico/${widget.song.songName}.mp3");
            return IconButton(
              icon: Icon(isDownloaded ? Icons.download_done : Icons.download),
              onPressed: () async {
                await downloader.downloadFromAsset(
                  "assets/${widget.song.song}",
                  '${widget.song.songName}.mp3',
                );
              },
            );
          }),
          // IconButton(
          //   icon: Icon(Icons.download),
          //   onPressed: () async {
          //     await downloader.downloadFromAsset(
          //       "assets/${widget.song.song}",
          //       '${widget.song.songName}.mp3',
          //     );
          //   },
          // ).paddingOnly(right: AppSizes.horizontalMedium),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
            child: Image.asset(widget.song.image,
                width: 200.w, height: 200.h, fit: BoxFit.fill),
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          Text(widget.song.artistName,
              style: Theme.of(context).textTheme.bodyLarge),
          Obx(
            () => Slider(
              activeColor: Colors.blue.shade800,
              value: musicController.currentPosition.value.inSeconds
                  .toDouble()
                  .clamp(0.0,
                      musicController.songDuration.value.inSeconds.toDouble()),
              min: 0,
              max: musicController.songDuration.value.inSeconds.toDouble(),
              onChanged: (value) {
                musicController.seek(Duration(seconds: value.toInt()));
              },
            ),
          ).paddingSymmetric(horizontal: AppSizes.horizontalMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                  "${musicController.currentPosition.value.inMinutes}:${(musicController.currentPosition.value.inSeconds % 60).toString().padLeft(2, '0')}")),
              Obx(() => Text(
                  "${musicController.songDuration.value.inMinutes}:${(musicController.songDuration.value.inSeconds % 60).toString().padLeft(2, '0')}")),
            ],
          ).paddingSymmetric(horizontal: AppSizes.horizontalLarge),
          Obx(
            () => IconButton(
              icon: Icon(
                musicController.isPlaying.value
                    ? Icons.pause_circle
                    : Icons.play_circle,
                size: AppSizes.iconLarge * 1.5,
                color: Colors.blue,
              ),
              onPressed: () {
                musicController.togglePlayPause();
              },
            ),
          ),
        ],
      ),
    );
  }
}
