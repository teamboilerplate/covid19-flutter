import 'dart:io';

class Dimens {
  Dimens._(); // this basically makes it so you can instantiate this class

  // For all screens
  static const double horizontalPadding = 12.0;
  static const double verticalPadding = 12.0;

  static double get bottomNavigationBarHeightBuffer =>
      Platform.isAndroid ? 50 : 0;
}
