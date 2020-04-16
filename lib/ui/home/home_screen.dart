import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/res/asset_images.dart';
import 'package:covid19/ui/home/home_navigator.dart';
import 'package:covid19/ui/home/widgets/home_card_widget.dart';
import 'package:covid19/ui/home/widgets/symptom_checker_card_widget.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';

/// [HomeScreen] is the first Screen of the application which displays various
/// cards available to the user and handles routes for each of them
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Material(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(
            Dimens.horizontalPadding,
            Dimens.verticalPadding / 0.75,
            0,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Page Title
              Text(
                Strings.appName,
                style: TextStyles.statisticsHeadingTextStlye.copyWith(
                  fontSize: screenWidth / 12,
                ),
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 30),

              // Latest Numbers and Prevention Cards
              Row(
                children: <Widget>[
                  // Latest Numbers Card
                  Expanded(
                    flex: 1,
                    child: HomeCardWidget(
                      start: -screenWidth / 10,
                      end: -screenWidth / 10,
                      bottom: -screenHeight / 20,
                      backgroundColor: AppColors.primaryColor,
                      title: Strings.latestNumbersTitle,
                      imagePath: AssetImages.latestNumbers,
                      route: HomeRoutes.latestNumbers.name,
                    ),
                  ),

                  // Prevention Numbers Card
                  Expanded(
                    flex: 1,
                    child: HomeCardWidget(
                      end: -screenWidth / 5,
                      bottom: -screenHeight / 100,
                      backgroundColor: AppColors.primaryColor,
                      title: Strings.preventionTitle,
                      imagePath: AssetImages.prevention,
                      route: HomeRoutes.prevention.name,
                    ),
                  ),
                ],
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 50),

              // Sympton Checker Card
              GestureDetector(
                onTap: () => HomeNavigator.navigatorKey.currentState
                    .pushNamed(HomeRoutes.symptomChecker.name),
                child: SymptomCheckerCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
