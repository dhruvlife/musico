import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/core/utils/functional_component.dart';
import 'package:musico/view/download/download_screen.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/view/home/home.dart';
import 'package:musico/view/home/bottom_menu/widgets/bottom_menu_button.dart';
import 'package:musico/view/search/search.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key, });
  @override
  State<BottomMenu> createState() => _BottomMenuState();
}
class _BottomMenuState extends State<BottomMenu> {
  int selectedMenuIndex = 0;

  final List<IconData> bottomIcons = [
    Icons.home,
    Icons.search,
    Icons.library_music,
  ];

  final List<String> bottomMenuTitles = [
    "Home",
    "Search",
    "Library",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      SearchScreen(),
      DownloadScreen(),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          pages[selectedMenuIndex],
          Container(
            height: AppSizes.appBarHeight * 1.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.buttonRadius * 2)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppFunctionalComponent.isDarkMode(context)
                      ? AppColors.darkFirstBottomMenu
                      : AppColors.lightFirstBottomMenu,
                  AppFunctionalComponent.isDarkMode(context)
                      ? AppColors.darkSecondBottomMenu
                      : AppColors.lightSecondBottomMenu,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomIcons.length, (index) {
                return BottomMenuButton(
                  onPressed: () {
                    setState(() {
                      selectedMenuIndex = index;
                    });
                  },
                  icon: bottomIcons[index],
                  text: bottomMenuTitles[index],
                  isActive: selectedMenuIndex == index,
                );
              }),
            ).paddingSymmetric(horizontal: AppSizes.horizontalLarge),
          ),
        ],
      ),
    );
  }
}
