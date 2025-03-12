import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/utils/functional_component.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService extends GetxController {
  var downloadSong = <String>[].obs;
  var isDownloading = false.obs;
  var downloadProgress = 0.0.obs;
  var isDeleted = false.obs;

  final box = GetStorage();
  final String downloadPath = '/storage/emulated/0/Download/Musico/';

  @override
  void onInit() {
    super.onInit();
    requestStoragePermission().then((granted) {
      if (granted) loadDownloadedSongs();
    });
  }

  Future<bool> requestStoragePermission() async {
    var status = await Permission.manageExternalStorage.request();
    if (status.isGranted) return true;
    if (status.isDenied) {
      AppFunctionalComponent.showSnackBar(
          message: "Storage permission is required.",
          title: "Permission Required",
          backgroundColor: AppColors.error);
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    return false;
  }

  Future<void> downloadFromAsset(String assetPath, String fileName) async {
    if (!await requestStoragePermission()) return;

    final newFilePath = "$downloadPath$fileName";
    if (downloadSong.contains(newFilePath)) {
      AppFunctionalComponent.showSnackBar(
        message: 'This song is already downloaded.',
        title: 'Already Downloaded',
      );

      return;
    }
    try {
      isDownloading.value = true;
      final musicFolder = Directory(downloadPath);
      if (!await musicFolder.exists()) {
        await musicFolder.create(recursive: true);
      }

      final newFile = File(newFilePath);
      final songData = await rootBundle.load(assetPath);
      await newFile.writeAsBytes(songData.buffer.asUint8List());

      addSong(newFilePath);
      AppFunctionalComponent.showSnackBar(
          message: 'Song downloaded successfully!',
          title: 'Success',
          backgroundColor: AppColors.success);
    } catch (e) {
      AppFunctionalComponent.showSnackBar(
          message: 'Error: $e',
          title: 'Download Failed',
          backgroundColor: AppColors.error);
    } finally {
      isDownloading.value = false;
    }
  }

  void loadDownloadedSongs() {
    final musicFolder = Directory(downloadPath);
    if (musicFolder.existsSync()) {
      downloadSong.assignAll(
          musicFolder.listSync().whereType<File>().map((file) => file.path));
    }

    var storedSongs = box.read<List>('downloaded_songs') ?? [];
    downloadSong.addAll(storedSongs
        .map((e) => e.toString())
        .where((e) => !downloadSong.contains(e)));
    downloadSong.refresh();
    update();
  }

  void addSong(String path) {
    if (!downloadSong.contains(path)) {
      downloadSong.add(path);
      box.write('downloaded_songs', downloadSong);
      downloadSong.refresh();
      update();
    }
  }

  Future<void> removeSong(String path) async {
    if (downloadSong.contains(path)) {
      final file = File(path);
      if (await file.exists()) await file.delete();

      downloadSong.remove(path);
      box.write('downloaded_songs', downloadSong);
      isDeleted.value = true;
      AppFunctionalComponent.showSnackBar(
          message: 'Song removed from downloads.', title: 'Deleted');
    }
  }
}
