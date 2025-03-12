import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/feature/download/download.dart';
import 'package:musico/feature/music/music.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});
  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final DownloadService downloadController = Get.put(DownloadService());
  @override
  void initState() {
    downloadController.loadDownloadedSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Downloads")),
      body: Obx(() {
        if (downloadController.downloadSong.isEmpty) {
          return const Center(child: Text("No Downloads"));
        }
        return ListView.builder(
          itemCount: downloadController.downloadSong.length,
          itemBuilder: (context, index) {
            final songPath = downloadController.downloadSong[index];
            final songName = songPath.split('/').last.replaceAll('.mp3', '');
            Song song = Song.allSongs.where((song) => song.songName == songName).first;
            return ListTile(
              leading: const Icon(Icons.music_note, color: Colors.blue),
              title: Text(songName),
              trailing: SizedBox(
                width: 100.w,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        color: AppColors.lightElevatedButtonColor,
                        size: AppSizes.iconMedium,
                      ),
                      onPressed: () {
                        Get.toNamed(RoutesName.songPlayScreen, arguments: song);
                      },
                    ),
                    IconButton(
                      icon:  Icon(Icons.delete, color: AppColors.error),
                      onPressed: () {
                        downloadController.removeSong(songPath);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
