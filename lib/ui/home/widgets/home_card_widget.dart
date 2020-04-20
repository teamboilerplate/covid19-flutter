import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/text_styles.dart';
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
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return GestureDetector(
      onTap: () => HomeNavigator.navigatorKey.currentState.pushNamed(route),
      // Rounded Card
      child: Container(
        height: screenHeight / 8,
        margin: const EdgeInsets.symmetric(
          horizontal: Dimens.horizontalPadding / 2,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            // Setting the property to fill the complete card
            // and centering it inside the card at the bottom
            // if the backgroundImage property is set to true
            // or else centering it to the bottom right of the card
            // and scaling it
            fit: backgroundImage ? BoxFit.contain : BoxFit.scaleDown,
            alignment: backgroundImage
                ? Alignment.bottomCenter
                : Alignment.bottomRight,
          ),
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

        // Text Label
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight / 55,
            horizontal: screenWidth / 25,
          ),
          child: SizedBox(
            width: screenWidth / 1.5,
            child: Text(
              title,
              style: TextStyles.homeCardTitle.copyWith(
                fontSize: screenWidth / 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
