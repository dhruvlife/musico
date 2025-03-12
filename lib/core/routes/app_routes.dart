import 'package:get/get.dart';
import 'package:musico/view/home/bottom_menu/bottom_menu.dart';
import 'package:musico/view/home/category_page/foryou_page/widgets/mix/mix_for_you_screen.dart';
import 'package:musico/view/home/home.dart';
import 'package:musico/view/search/widgets/list_song_play_screen.dart';
import 'package:musico/view/search/widgets/song_play_screen.dart';
import 'package:musico/view/auth/phone/phone_auth.dart';
import 'package:musico/view/auth/signup/signup.dart';
import 'package:musico/view/splash/splash_screen.dart';
import 'package:musico/core/routes/routes_name.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutesName.phoneAuth,
      page: () => PhoneAuthScreen(),
    ),
    GetPage(
      name: RoutesName.songListPlayScreen,
      page: () => SongListPlayScreen(language: Get.arguments),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesName.bottomMenu,
      page: () => BottomMenu(),
    ),
    GetPage(
      name: RoutesName.mixForYouScreen,
      page: () => MixForYouScreen(
        songs: Get.arguments,
      ),
    ),
    GetPage(
      name: RoutesName.songPlayScreen,
      page: () => SongPlayScreen(
        song: Get.arguments,
      ),
    ),
    GetPage(
        name: RoutesName.signUp,
        page: () => SignupScreen(),
        // curve: Curves.bounceOut,
        transitionDuration: Duration(seconds: 2),
        transition: Transition.fadeIn),
  ];
}
