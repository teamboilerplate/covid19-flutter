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
        // [AppBar] with 0 size used to set the statusbar background color and
        // statusbat text/icon color
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: AppColors.transparentColor,
            brightness: Brightness.light,
            elevation: 0.0,
          ),
        ),
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
                      backgroundColor: AppColors.primaryColor,
                      title: Strings.latestNumbersTitle,
                      imagePath: AssetImages.latestNumbers,
                      backgroundImage: true,
                      route: HomeRoutes.latestNumbers.name,
                    ),
                  ),

                  // Prevention Numbers Card
                  Expanded(
                    flex: 1,
                    child: HomeCardWidget(
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
                child: Hero(
                  tag: 'symptomChecker',
                  child: SymptomCheckerCardWidget(),
                ),
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 50),

              // Symptoms and Myth Busters
              Row(
                children: <Widget>[
                  // Symptoms Card
                  Expanded(
                    flex: 1,
                    child: HomeCardWidget(
                      backgroundColor: AppColors.primaryColor,
                      title: Strings.symptomsTitle,
                      imagePath: AssetImages.symptoms,
                      route: HomeRoutes.latestNumbers.name,
                    ),
                  ),

                  // Myth Busters Card
                  Expanded(
                    flex: 1,
                    child: HomeCardWidget(
                      backgroundColor: AppColors.primaryColor,
                      title: Strings.mythBusterTitle,
                      imagePath: AssetImages.mythBusters,
                      route: HomeRoutes.prevention.name,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
