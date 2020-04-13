import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';

class TextStyles {
  TextStyles._(); // this basically makes it so you can instantiate this class

  /// ------------------------------------------------------
  /// Global Font Styles
  /// used used throughout the app
  ///

  static const titleTextStyle = TextStyle(
    color: AppColors.accentBlackColor,
  );

  static const hightlightText = TextStyle(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );

  /// ------------------------------------------------------
  /// Font Styles for Error Screen
  /// used in (ui/static/static_error_screen)
  ///
  static const errorHeadingTextStlye = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static const errorDescriptionTextStlye = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static const errorButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  /// ------------------------------------------------------
  /// Font Styles for Home
  /// used in (ui/home)
  ///

  static const homeHeadingTextStlye = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static const homeSubHeadingTextStlye = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.offBlackColor,
  );

  static const homeAccentTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.blueColor,
  );

  static const homeSymptonCheckerHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

  static const homeSymptonCheckerSubHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.offWhiteColor,
  );
}
