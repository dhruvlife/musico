import 'package:flutter/material.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/mix/widgets/mix_for_you_container.dart';

import 'package:musico/feature/music/music.dart';

class MixForYouScreen extends StatelessWidget {
  final List<Song> songs;
  const MixForYouScreen({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(songs.first.category,style: Theme.of(context).textTheme.bodyLarge,),centerTitle: true,
      ),
      body: SafeArea(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Interuption is part of life",style: Theme.of(context).textTheme.bodyLarge,),
            MixForYouContainer(songs: songs, songCategory: songs.first.songName,),
          ],
        ),
      )
    );
  }
}