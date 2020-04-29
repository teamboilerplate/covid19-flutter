import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:covid19/ui/home/home_navigator.dart';
import 'package:covid19/utils/device/device_utils.dart';

/// Displays the navigation Home Cards
///
/// **Requires**
/// 1. [title] - For the title text
/// 2. [backgroundColor] - For the backgroundColor of the Card
/// 3. [imagePath] - For the Image to be displayed
/// 4. [backgroundImage] - Determines if the image is a background Image or not
/// 5. [route] - For the value to be used to navigate to the desired screen using [HomeNavigator]
class HomeCardWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String imagePath;
  final bool backgroundImage;
  final String route;

  const HomeCardWidget({
    Key key,
    this.title,
    this.backgroundColor,
    this.imagePath,
    this.backgroundImage = false,
    this.route,
  }) : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return GestureDetector(
      onTap: () => HomeNavigator.navigatorKey.currentState.pushNamed(route),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBoxHeightWidget(screenHeight / 75),
          Container(
            height: screenHeight / 6,
            margin: const EdgeInsets.symmetric(
              horizontal: Dimens.horizontalPadding / 2,
            ),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  color: AppColors.boxShadowColor,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: backgroundColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth / 35),
              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
          ),
          SizedBoxHeightWidget(screenHeight / 250),
        ],
      ),
    );
  }
}
