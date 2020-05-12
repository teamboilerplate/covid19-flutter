import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';

/// Displays the current summary information about the selected country
///
/// **Requires**
/// 1. [infoColor] - For the iconColor and the title text
/// 2. [infoIcon] - For the icon to displayed based on the label
/// 3. [infoValueNew] - For the value of new case count for the provided label
/// 4. [infoValue] - For the value of the case count for the provided label
/// 5. [infoLabel] - For the value of the label
class InfoCardWidget extends StatelessWidget {
  final Color infoColor;
  final IconData infoIcon;
  final int infoValueNew;
  final int infoValue;
  final String infoLabel;

  const InfoCardWidget({
    Key key,
    @required this.infoColor,
    @required this.infoIcon,
    @required this.infoValueNew,
    @required this.infoValue,
    @required this.infoLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Container(
      padding: EdgeInsets.only(
        top: screenHeight / 55,
        bottom: screenHeight / 75,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: AppColors.offBlackColor.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: AppColors.whiteColor,
      ),
      child: RepaintBoundary(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Information Text
            Text(
              infoLabel.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyles.infoLabelTextStyle.copyWith(
                fontSize: screenHeight / 85,
              ),
            ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 50),

            // Information New Value
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 75,
                vertical: screenHeight / 250,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                color: infoColor.withOpacity(0.3),
              ),
              child: Text(
                infoValue > 0
                    ? '+ ${rowNumberFormat(infoValueNew)}'
                    : '- ${rowNumberFormat(infoValueNew)}',
                style: TextStyles.infoCountTextStyle.copyWith(
                  fontSize: screenHeight / 70,
                  color: infoColor,
                ),
              ),
            ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 75),

            // Info Icon
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: infoColor.withAlpha(50),
                border: Border.all(
                  width: 0.5,
                  color: infoColor,
                ),
              ),
              child: Icon(
                infoIcon,
                color: infoColor,
                size: screenHeight / 55,
              ),
            ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 75),

            // Information Value
            Text(
              '${rowNumberFormat(infoValue)}',
              textAlign: TextAlign.center,
              style: TextStyles.infoCountTextStyle.copyWith(
                fontSize: screenHeight / 60,
                color: infoColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String rowNumberFormat(int number) {
  return number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+$)'),
      (match) {
    return '${match[1]},';
  });
}
