import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

/// Displays the current summary information about the selected
/// country
///
/// **Requires**
/// 1. [infoColor] - For the iconColor and the title text
/// 2. [infoIcon] - For the icon to displayed based on the label
/// 3. [infoValue] - For the value of the case count for the provided label
/// 4. [infoLabel] - For the value of the label
class InfoCard extends StatelessWidget {
  final Color infoColor;
  final IconData infoIcon;
  final String infoValue, infoLabel;

  const InfoCard({
    Key key,
    @required this.infoColor,
    @required this.infoIcon,
    @required this.infoValue,
    @required this.infoLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.horizontalPadding / 2,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight / 23,
        horizontal: screenWidth / 25,
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            color: AppColors.boxShadowColor,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  screenWidth / 25,
                ),
              ),
              color: infoColor.withAlpha(50),
              border: Border.all(
                width: 0.5,
                color: infoColor,
              ),
            ),
            child: Icon(
              infoIcon,
              color: infoColor,
              size: screenWidth / 25,
            ),
          ),

          // Vertical Spacing
          SizedBoxHeightWidget(screenHeight / 66),

          // Information Text
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '$infoValue \n',
                  style: TextStyle(
                    fontSize: screenWidth / 27,
                    color: infoColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: infoLabel.toUpperCase(),
                  style: TextStyle(
                    fontSize: screenWidth / 40,
                    color: AppColors.offBlackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
