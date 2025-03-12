

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/foryou_section/foryou_banner_section.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/foryou_section/recent_song_design.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/mix/widgets/mix_for_you_list.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/feature/music/music.dart';

class ForyouScreen extends StatefulWidget {
  const ForyouScreen({super.key});

  @override
  State<ForyouScreen> createState() => _ForyouScreenState();
}

class _ForyouScreenState extends State<ForyouScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Google Sign-In instance
  GoogleSignInAccount? user; // Nullable user instance

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    user = _googleSignIn.currentUser;
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Song>> categorizedSongs = {};

    for (var song in Song.allSongs) {
      categorizedSongs.putIfAbsent(song.category, () => []).add(song);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.featureTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ).paddingSymmetric(vertical: AppSizes.verticalExtraSmall),
          const ForYouBannerSection(),
          SizedBox(
            height: 160.h,
            width: double.infinity,
            child: const RecentSection(),
          ),
          Text(
            AppStrings.mixTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ).paddingOnly(bottom: AppSizes.verticalMedium),
          SizedBox(
            height: 140.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorizedSongs.length,
              itemBuilder: (context, index) {
                String category = categorizedSongs.keys.elementAt(index);
                List<Song> songs = categorizedSongs[category] ?? [];

                return MixForYouList(
                  songs: songs,
                  onTapMixList: () {
                    Get.toNamed(RoutesName.mixForYouScreen,arguments:songs);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
