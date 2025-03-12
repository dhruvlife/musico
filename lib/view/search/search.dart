import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/search/widgets/search_alter_screen.dart';
import 'package:musico/view/search/widgets/search_not_found.dart';
import 'package:musico/view/search/widgets/song_card.dart';
import 'package:musico/feature/music/music.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Song> filteredSongs = [];
  List<String> uniqueArtists = [];

  @override
  void initState() {
    super.initState();
    uniqueArtists =
        Song.allSongs.map((song) => song.artistName).toSet().toList();
  }

  void onSearchChanged(String value) {
    setState(() {
      filteredSongs = value.isEmpty
          ? []
          : Song.allSongs
              .where((song) =>
                  song.songName.toLowerCase().contains(value.toLowerCase()) ||
                  song.artistName.toLowerCase().contains(value.toLowerCase()) ||
                  song.category.toLowerCase().contains(value.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildSearchBar(),
            Expanded(
              child: searchController.text.isEmpty
                  ? SearchAlterScreen(uniqueArtists: uniqueArtists)
                  : filteredSongs.isEmpty
                      ? NoSearchFound()
                      : buildSongList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: SearchBar(
        onChanged: onSearchChanged,
        controller: searchController,
        leading: Icon(Icons.search, color: AppColors.dark),
        hintText: "Search songs, artists, albums...",
      ),
    ).paddingSymmetric(
      horizontal: AppSizes.horizontalMedium,
      vertical: AppSizes.verticalSmall,
    );
  }

  Widget buildSongList() {
    return ListView.builder(
      itemCount: filteredSongs.length,
      itemBuilder: (context, index) {
        return SongCard(song: filteredSongs[index]);
      },
    );
  }
}
