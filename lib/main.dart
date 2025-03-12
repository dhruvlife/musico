import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musico/core/constant/app_strings.dart';
import 'package:musico/core/routes/app_routes.dart';
import 'package:musico/core/routes/routes_name.dart';
import 'package:musico/core/theme/theme.dart';
import 'package:musico/core/controller/theme_controller.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
                      Get.put(ThemeController());
    return ScreenUtilInit(
      designSize: Size(360,800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,__) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.logo,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,       
          initialRoute: RoutesName.splash,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
