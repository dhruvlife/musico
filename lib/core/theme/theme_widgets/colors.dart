import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // App theme colors
  static const Color primary = Colors.white;
  static const Color light = Color(0xFFF6F6F6);
  // static const Color dark = Color(0xFF272727);
  static const Color dark = Colors.black;
  static const Color mediumTransp = Color.fromARGB(50, 130, 130, 130);
  static const Color transperent = Colors.transparent;
  static const Color darkElevatedButtonColor =Color.fromRGBO(255, 179, 0, 1);
  static const Color lightElevatedButtonColor =Colors.cyan;
  static const Color lightFirstBottomMenu =  Color.fromARGB(50,255,255,255);
  static const Color darkFirstBottomMenu =  Color.fromARGB(200, 50, 50, 50);
  static const Color lightSecondBottomMenu =  Color.fromARGB(255, 200, 200, 200);
  static const Color darkSecondBottomMenu =  Color.fromARGB(250, 20, 20, 20);
  
                    
                         
  
  // shade for dark
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color notificationHome = Color(0xFF4F4F4F);
  static const Color darkGrey = Color.fromRGBO(0, 94, 99, 0.302);

  // shade for light
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // splash contaer
  static Color splashContainer1 = Colors.green.shade900;
  static Color splashContainer2 = Colors.green.shade700;
  static Color splashContainer3 = Colors.green.shade500;

  // warning
   static Color error = Colors.red;
   static Color success = Colors.green;
   static Color homeSelectDark = const Color.fromRGBO(70, 70, 70, 1);
   static Color homeSelectLight = const Color.fromRGBO(200, 200, 200, 1);

   // recent section
   static Color playButton = const Color.fromARGB(143, 200, 200, 200);
}
