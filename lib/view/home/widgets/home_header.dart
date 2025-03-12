import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:musico/core/component/app_text.dart';
import 'package:musico/core/key/app_images.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/storage/storage_key.dart';
import 'package:musico/core/storage/storage_object.dart';
import 'package:musico/core/theme/theme_widgets/colors.dart';
import 'package:musico/core/constant/size.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/constant/font_size.dart';
import 'package:musico/core/utils/functional_component.dart';
import 'package:musico/feature/auth/google_auth.dart';
import 'package:musico/core/controller/theme_controller.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key, });
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    final GoogleAuthHelper googleController = GoogleAuthHelper();
    Future<void> handleGoogleSignOut() async {
      await googleController.signOut();
      setState(() {
        googleController.user = null;
      });
      AppFunctionalComponent.showSnackBar(message: AppStrings.onSignOutGoogle);
      Get.toNamed(RoutesName.signUp);
    }
    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60.h,
            child: Column(
              children: [
                AppText(
                    text: "👋 hi ${StorageObject.read(StorageKey.name)} ,",
                    fontSize: FontSize.fontSizeTitleMedium,
                    fontWeight: FontWeight.w200),
                AppText(
                    text: "Good Evening",
                    fontSize: FontSize.fontSizeheadlineMedium,
                    fontWeight: FontWeight.w400),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 50.h,
                width: 50.w,
                child: Obx(() {
                  final ThemeController themeController =
                      Get.put(ThemeController());
                  return IconButton(
                    onPressed: () => themeController.toggleTheme(),
                    icon: Icon(
                      themeController.isDarkMode.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                  );
                }),
              ),
              Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
                child: SvgPicture.asset(
                  AppImages.notificationHome,
                  height: 28.h,
                  width: 28.w,
                ),
              ).paddingOnly(right: AppSizes.horizontalExtraSmall),
              GestureDetector(
                onTap: () {
                  handleGoogleSignOut();
                },
                child: SizedBox(
                  height: 40.sp,
                  width: 40.sp,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      StorageObject.read(StorageKey.image) ?? "",
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
