import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  // Application Colour scheme
  static const Color primaryColor = Color(0xFF222A45);
  static const Color secondaryColor = Color(0xFFF1F1F1);
  static const Color accentColor = Color(0xFFDC1D7D);
  static const Color secondaryAccentColor = Color(0xFF8D5FC2);

  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color blackColor = Color(0xFF000000);

  static const Color offWhiteColor = Color(0xFFBDBDBD);

  static const Color offBlackColor = Color(0xFFBDBDBD);

  static const Color accentBlackColor = Color(0xFF525252);

  static const Color boxShadowColor = Color(0x29000000);

  static const Color blueColor = Color(0xFF007BEF);

  static const Color accentBlueColor = Color(0xFF8ECFFF);

  static const Color orangeColor = Color(0xFFFF9800);

  static const Color greenColor = Color(0xFF4CAF50);

  static const Color redColor = Color(0xFFF44336);

  // Shades of Orange
  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  // Shades of Black
  static const Map<int, Color> black = <int, Color>{
    50: Color(0xFFE0E0E0),
    100: Color(0xFFB3B3B3),
    200: Color(0xFF808080),
    300: Color(0xFF4D4D4D),
    400: Color(0xFF262626),
    500: Color(0xFF000000),
  };
}
