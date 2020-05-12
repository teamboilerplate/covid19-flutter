import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/font_family.dart';
import 'package:covid19/constants/text_styles.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.quickSand,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.accentColor,
  backgroundColor: AppColors.whiteColor,
  accentColorBrightness: Brightness.light,
  textTheme: const TextTheme(
    headline1: TextStyles.titleTextStyle,
  ),
);
