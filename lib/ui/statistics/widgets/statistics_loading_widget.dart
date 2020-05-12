import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/ui/statistics/statistics_screen.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/utils/emoji_flags.dart';
import 'package:covid19/widgets/custom_shimmer.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:covid19/widgets/sized_box_width_widget.dart';

/// Data being displayed when the current state of [HomeChangeNotifier]
/// is loading
/// **Requires**
/// 1. [selectedCountry] - to display the name of the country
/// 2. [selectedCountryISO2] - to fetch the flag of the selected country (From
/// the cache if already cached)
/// 3. [today] - to display the current date of the user in EEEE, d MMMM y format
class HomeLoadingWidget extends StatelessWidget {
  final String selectedCountry, selectedCountryISO2;
  final DateTime today;

  const HomeLoadingWidget({
    Key key,
    @required this.selectedCountry,
    @required this.today,
    @required this.selectedCountryISO2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return ScrollConfiguration(
      behavior: const CustomScrollBehaviour(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimens.horizontalPadding,
            Dimens.verticalPadding / 0.75,
            0,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Back Icon
              Icon(
                Covid19Icons.keyboardArrowLeft,
                size: screenHeight / 45,
                color: AppColors.blackColor,
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 50),
              // Page Title
              Text(
                Strings.outbreakTitle,
                style: TextStyles.statisticsHeadingTextStlye.copyWith(
                  fontSize: screenHeight / 45,
                ),
              ),

              // Current Date
              Text(
                todayDateFormatter(today),
                style: TextStyles.statisticsSubHeadingTextStlye.copyWith(
                  fontSize: screenHeight / 60,
                ),
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 100),

              // Global Title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: screenWidth / 50,
                    ),
                    child: Text(
                      Strings.globalTitle,
                      softWrap: true,
                      style: TextStyles.hightlightText.copyWith(
                        fontSize: screenHeight / 30,
                      ),
                    ),
                  ),
                  Icon(
                    Covid19Icons.globe,
                    size: screenHeight / 35,
                    color: AppColors.blackColor,
                  ),
                ],
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 100),

              // Last Updated On Information
              Shimmer(
                rrect: true,
                radius: 5,
                rrectSize: Size(screenWidth / 1.2, screenHeight / 65),
                gradient: Shimmer.defaultGradient,
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 50),

              // Details Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Dimens.horizontalPadding / 0.75,
                    ),
                    child: Text(
                      Strings.details,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyles.statisticsAccentTextStyle.copyWith(
                        fontSize: screenHeight / 50,
                      ),
                    ),
                  ),
                ],
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 75),

              // Information Cards
              Padding(
                padding: const EdgeInsets.only(
                  right: Dimens.horizontalPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.horizontalPadding / 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Shimmer(
                          rrect: true,
                          radius: 5,
                          rrectSize: Size(0, screenHeight / 6),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.horizontalPadding / 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Shimmer(
                          rrect: true,
                          radius: 5,
                          rrectSize: Size(0, screenHeight / 6),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.horizontalPadding / 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Shimmer(
                          rrect: true,
                          radius: 5,
                          rrectSize: Size(0, screenHeight / 6),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 35),

              const Padding(
                padding: EdgeInsets.only(
                  right: Dimens.horizontalPadding,
                ),
                child: Divider(
                  color: AppColors.offBlackColor,
                  height: 1,
                ),
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 75),

              // Country Title
              // Gesture Detector is used to eliminate the ripple effect
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: screenWidth / 50,
                      ),
                      child: Text(
                        selectedCountry,
                        softWrap: true,
                        style: TextStyles.hightlightText.copyWith(
                          fontSize: screenHeight / 30,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      Emoji.byISOCode(
                              'flag_${selectedCountryISO2.toLowerCase()}')
                          .char,
                      style: TextStyle(
                        fontSize: screenHeight / 35,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Icon(
                      Covid19Icons.arrowDropDown,
                      size: screenHeight / 30,
                      color: AppColors.offBlackColor,
                    ),
                  ),
                ],
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 200),

              // Details Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Dimens.horizontalPadding / 0.75,
                    ),
                    child: Text(
                      Strings.details,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyles.statisticsAccentTextStyle.copyWith(
                        fontSize: screenHeight / 50,
                      ),
                    ),
                  ),
                ],
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 75),

              // Information Cards
              Padding(
                padding: const EdgeInsets.only(
                  right: Dimens.horizontalPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.horizontalPadding / 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Shimmer(
                          rrect: true,
                          radius: 5,
                          rrectSize: Size(0, screenHeight / 6),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.horizontalPadding / 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Shimmer(
                          rrect: true,
                          radius: 5,
                          rrectSize: Size(0, screenHeight / 6),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.horizontalPadding / 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Shimmer(
                          rrect: true,
                          radius: 5,
                          rrectSize: Size(0, screenHeight / 6),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 25),

              // Confirmed Cases Label
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    Strings.confirmedCasesTitle,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyles.statisticsHeadingTextStlye.copyWith(
                      fontSize: screenHeight / 35,
                    ),
                  ),
                ],
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 75),

              // Information Tab
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Tab 1
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.blackColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      Strings.dailyStatiscsLable,
                      style: TextStyles.hightlightText.copyWith(
                        fontSize: screenHeight / 45,
                      ),
                    ),
                  ),

                  // Horizontal Spacing
                  SizedBoxWidthWidget(screenWidth / 45),

                  // Tab 2
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(),
                    child: Text(
                      Strings.weeklyStatiscsLable,
                      style: TextStyles.titleTextStyle.copyWith(
                        fontSize: screenHeight / 45,
                      ),
                    ),
                  ),

                  // Horizontal Spacing
                  SizedBoxWidthWidget(screenWidth / 45),

                  // Tab 3
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(),
                    child: Text(
                      Strings.dailyGrowthStatiscsLable,
                      style: TextStyles.titleTextStyle.copyWith(
                        fontSize: screenHeight / 45,
                      ),
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
