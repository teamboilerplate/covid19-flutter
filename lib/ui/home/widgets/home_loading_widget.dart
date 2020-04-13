import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/ui/home/home_screen.dart';
import 'package:covid19/ui/home/widgets/symptom_checker_widget.dart';
import 'package:covid19/utils/image_cache_manager.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:covid19/widgets/sized_box_width_widget.dart';
import 'package:covid19/widgets/custom_shimmer.dart';

/// Data being displayed when the current state of [HomeChangeNotifier]
/// is loading
/// **Requires**
/// 1. [selectedCountry] - to display the name of the country
/// 3. [selectedCountryISO2] - to fetch the flag of the selected country (From
/// the cache if already cached)
/// 4. [today] - to display the current date of the user in EEEE, d MMMM y format
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
          padding: EdgeInsets.fromLTRB(
            Dimens.horizontalPadding,
            Dimens.verticalPadding * 3,
            0,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Page Title
              Text(
                'Current Outbreak',
                style: TextStyles.homeHeadingTextStlye.copyWith(
                  fontSize: screenWidth / 28,
                ),
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 100),

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
                          fontSize: screenWidth / 10,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${Endpoints.baseUrlCountryFlags}$selectedCountryISO2/flat/32.png',
                      cacheManager: ImageCacheManager(),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: screenWidth / 12,
                      color: AppColors.offBlackColor,
                    ),
                  ),
                ],
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 200),

              // Current Date
              Text(
                todayDateFormatter(today),
                style: TextStyles.homeSubHeadingTextStlye.copyWith(
                  fontSize: screenWidth / 25,
                ),
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 25),

              // Sympton Checker Card
              SymptomCheckerCard(),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 20),

              // Covid-19 Stats Header
              Text(
                'Covid-19 Latest update',
                maxLines: 2,
                softWrap: true,
                style: TextStyles.homeHeadingTextStlye.copyWith(
                  fontSize: screenWidth / 18,
                ),
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 100),

              Shimmer(
                rrect: true,
                radius: 5,
                rrectSize: Size(screenWidth / 1.1, screenHeight / 47),
                gradient: Shimmer.defaultGradient,
              ),

              // Verical Spacing
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
                      'Details',
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyles.homeAccentTextStyle.copyWith(
                        fontSize: screenWidth / 25,
                      ),
                    ),
                  ),
                ],
              ),

              // Verical Spacing
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
                          rrectSize: Size(0, screenHeight / 6.2),
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
                          rrectSize: Size(0, screenHeight / 6.2),
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
                          rrectSize: Size(0, screenHeight / 6.2),
                          gradient: Shimmer.defaultGradient,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 23),

              // Active Cases Label
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Confirmed Cases',
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyles.homeHeadingTextStlye.copyWith(
                      fontSize: screenWidth / 18,
                    ),
                  ),
                ],
              ),

              // Verical Spacing
              SizedBoxHeightWidget(screenHeight / 75),

              // Information Tab
              Container(
                margin: const EdgeInsets.only(
                  right: Dimens.horizontalPadding,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: AppColors.offBlackColor,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Tab 1
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Daily',
                        style: TextStyles.hightlightText.copyWith(
                          fontSize: screenWidth / 20,
                        ),
                      ),
                    ),

                    // Horizontal Spacing
                    SizedBoxWidthWidget(screenWidth / 15),

                    // Tab 2
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(),
                      child: Text(
                        'Weekly',
                        style: TextStyles.titleTextStyle.copyWith(
                          fontSize: screenWidth / 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
