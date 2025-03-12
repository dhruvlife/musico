import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/utils/functional_component.dart';
import 'package:musico/view/home/category_page/foryou_page/foryou.dart';
import 'package:musico/view/home/category_page/relex/relex.dart';
import 'package:musico/view/home/widgets/home_header.dart';
import 'package:musico/core/constant/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    AppStrings.category1,
    AppStrings.category2,
    AppStrings.category3,
    AppStrings.category4,
    AppStrings.category5,
    AppStrings.category6,
  ];

  final List<Widget> selectedPage = [
    ForyouScreen(),
    RelexScreen(),
    Text("Category 3"),
    Text("Category 4"),
    Text("Category 5"),
    Text("Category 6"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              HomeHeader(),
              SizedBox(
                height: AppSizes.appBarHeight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: selectedCategoryIndex == index
                                ? AppFunctionalComponent.isDarkMode(context)
                                    ? AppColors.homeSelectDark
                                    : AppColors
                                        .homeSelectLight // Active bg color
                                : AppColors.transperent,
                            side: BorderSide.none),
                        onPressed: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Text(
                          categories[index],
                        ),
                      ).paddingOnly(right: AppSizes.horizontalSmall);
                    }),
                  ).paddingOnly(right: AppSizes.horizontalMedium),
                ),
              ),

              // Display Selected Category
              Expanded(child: selectedPage[selectedCategoryIndex]),
            ],
          ).paddingSymmetric(horizontal: AppSizes.horizontalSmall),
        ],
      ),
    );
  }
}
