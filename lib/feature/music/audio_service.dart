import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/feature/music/music.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  var isPlaying = true.obs;
  var currentPosition = Duration.zero.obs;
  var songDuration = Duration.zero.obs;
  var currentSong = Rx<Song?>(null);

  List<Song> songQueue = [];
  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();

    _audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      songDuration.value = duration;
    });

    _audioPlayer.onPositionChanged.listen((position) {
      currentPosition.value = position;
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      playNextSong();
    });
  }

  void resume() async {
    await _audioPlayer.resume();
  }

  void pause() async {
    await _audioPlayer.pause();
  }

  void playSong(Song song, {List<Song>? queue, int index = 0}) async {
    await _audioPlayer.pause();
    if (queue != null) {
      songQueue = queue;
      currentIndex = index;
    }
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(song.song));
    currentSong.value = song;
  }

  void stop() async {
    await _audioPlayer.stop();
  }

  void togglePlayPause() async {
    if (currentSong.value == null) {
      Get.snackbar("Error", "No song selected to play",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (isPlaying.value) {
      await _audioPlayer.pause();
    } else {
      if (currentPosition.value > Duration.zero) {
        await _audioPlayer.resume();
      } else {
        await _audioPlayer.play(AssetSource(currentSong.value!.song));
      }
    }
  }

  void listenList(List<Song> songs, int index) async {
    if (currentSong.value?.song == songs[index].song) {
      if (isPlaying.value) {
        await _audioPlayer.pause();
        isPlaying.value = false;
      } else {
        await _audioPlayer.resume();
        isPlaying.value = true;
      }
    } else {
      if (currentSong.value != null) {
        await _audioPlayer.stop();
      }

      songQueue = songs;
      currentIndex = index;
      playSong(songs[index], queue: songs, index: index);
    }
  }

  void playNextSong() {
    if (currentIndex < songQueue.length - 1) {
      currentIndex++;
      playSong(songQueue[currentIndex]);
    }
  }

  void playPreviousSong() {
    if (currentIndex > 0) {
      currentIndex--;
      playSong(songQueue[currentIndex]);
    }
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  void onClose() async {
    await _audioPlayer.dispose();
    super.onClose();
  }
}
