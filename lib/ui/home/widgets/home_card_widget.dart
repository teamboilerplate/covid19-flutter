import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/ui/home/home_navigator.dart';
import 'package:covid19/utils/device/device_utils.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double start, top, bottom, end;
  final String imagePath;
  final String route;

  const HomeCardWidget({
    Key key,
    this.title,
    this.backgroundColor,
    this.start = 0,
    this.top = 0,
    this.bottom = 0,
    this.end = 0,
    this.imagePath,
    this.route,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return GestureDetector(
      onTap: () => HomeNavigator.navigatorKey.currentState.pushNamed(route),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: Dimens.horizontalPadding / 2,
        ),
        height: screenHeight / 8,
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
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              start: start,
              top: top,
              end: end,
              bottom: bottom,
              child: Image(
                width: screenWidth / 10,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
