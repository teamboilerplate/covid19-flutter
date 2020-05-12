import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/models/statistics/statistics_response_model.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:flutter/material.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';

/// [GlobalCountriesDetails] Displays the list of stats of various contries
class GlobalCountriesDetails extends StatelessWidget {
  final List<HomeCountries> globalCountriesList;

  const GlobalCountriesDetails({Key key, this.globalCountriesList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);

    int countryItemInfected,
        countryItemRecovered,
        countryItemActive,
        countryItemDeaths,
        countryItemNewInfected,
        countryItemNewRecovered,
        countryItemNewActive,
        countryItemNewDeaths;

    // Sorting the new List of [HomeCountries] in descending order of Confirmed Cases
    globalCountriesList
        .sort((a, b) => b.totalConfirmed.compareTo(a.totalConfirmed));

    return SafeArea(
      child: Scaffold(
        body: // Global Cases List
            Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimens.horizontalPadding / 2,
            Dimens.verticalPadding / 0.75,
            Dimens.horizontalPadding / 2,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Icon
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Covid19Icons.keyboardArrowLeft,
                        size: screenWidth / 18,
                        color: AppColors.blackColor,
                      ),
                    ),

                    // Vertical Spacing
                    SizedBoxHeightWidget(screenHeight / 50),

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
                              fontSize: screenHeight / 35,
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
                    SizedBoxHeightWidget(screenHeight / 50),

                    // Global Cases List Header label
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Country',
                            textAlign: TextAlign.center,
                            style:
                                TextStyles.statisticsHeadingTextStlye.copyWith(
                              fontSize: screenHeight / 70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Infected',
                            textAlign: TextAlign.center,
                            style:
                                TextStyles.statisticsHeadingTextStlye.copyWith(
                              fontSize: screenHeight / 70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Recovered',
                            textAlign: TextAlign.center,
                            style:
                                TextStyles.statisticsHeadingTextStlye.copyWith(
                              fontSize: screenHeight / 70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Active',
                            textAlign: TextAlign.center,
                            style:
                                TextStyles.statisticsHeadingTextStlye.copyWith(
                              fontSize: screenHeight / 70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Deaths',
                            textAlign: TextAlign.center,
                            style:
                                TextStyles.statisticsHeadingTextStlye.copyWith(
                              fontSize: screenHeight / 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: ScrollConfiguration(
                  behavior: const CustomScrollBehaviour(),
                  child: Container(
                    height: screenHeight,
                    child: Column(
                      children: [
                        // Gloabl Cases List of Countries
                        Expanded(
                          flex: 8,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: globalCountriesList.length,
                            itemBuilder: (BuildContext context, int index) {
                              // Assigning Total Values for each country
                              // Total Confirmed cases
                              countryItemInfected =
                                  globalCountriesList[index].totalConfirmed;

                              // Total Recovered cases
                              countryItemRecovered =
                                  globalCountriesList[index].totalRecovered;

                              // Total Active cases
                              countryItemActive = globalCountriesList[index]
                                      .totalConfirmed -
                                  (globalCountriesList[index].totalRecovered +
                                      globalCountriesList[index].totalDeaths);

                              // Total Death cases
                              countryItemDeaths =
                                  globalCountriesList[index].totalDeaths;

                              // Assigning New Values for each country
                              // New Confirmed cases
                              countryItemNewInfected =
                                  globalCountriesList[index].newConfirmed;

                              // New Recovered cases
                              countryItemNewRecovered =
                                  globalCountriesList[index].newRecovered;

                              // New Active cases
                              countryItemNewActive =
                                  globalCountriesList[index].newConfirmed -
                                      (globalCountriesList[index].newRecovered +
                                          globalCountriesList[index].newDeaths);

                              // New Death cases
                              countryItemNewDeaths =
                                  globalCountriesList[index].newDeaths;

                              // Item that display the Country Item
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: screenHeight / 150,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth / 75,
                                  vertical: screenHeight / 100,
                                ),

                                // Adding alternate colours to the List
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? AppColors.activeColor.withOpacity(0.1)
                                      : AppColors.activeColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      screenHeight / 50,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Country Label
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        globalCountriesList[index].country,
                                        style: TextStyle(
                                          fontSize: screenHeight / 70,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    // Country Cases (New and Total)
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // New Cases Values
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // New Infected Cases
                                              Expanded(
                                                child: Text(
                                                  countryItemNewInfected == 0
                                                      ? '$countryItemNewInfected'
                                                      : '+ $countryItemNewInfected',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles
                                                      .statisticsAccentTextStyle
                                                      .copyWith(
                                                    color: AppColors
                                                        .confirmedColor,
                                                  ),
                                                ),
                                              ),

                                              // New Recovered Cases
                                              Expanded(
                                                child: Text(
                                                  countryItemNewRecovered == 0
                                                      ? '$countryItemNewRecovered'
                                                      : '+ $countryItemNewRecovered',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles
                                                      .statisticsAccentTextStyle
                                                      .copyWith(
                                                    color: AppColors
                                                        .recoveredColor,
                                                  ),
                                                ),
                                              ),

                                              // New Active Cases
                                              Expanded(
                                                child: Text(
                                                  countryItemNewActive > 0
                                                      ? '+ $countryItemNewActive'
                                                      : countryItemNewActive
                                                                  .abs() ==
                                                              0
                                                          ? '${countryItemNewActive.abs()}'
                                                          : '- ${countryItemNewActive.abs()}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles
                                                      .statisticsAccentTextStyle
                                                      .copyWith(
                                                    color:
                                                        AppColors.activeColor,
                                                  ),
                                                ),
                                              ),

                                              // New Deceased Cases
                                              Expanded(
                                                child: Text(
                                                  countryItemNewDeaths == 0
                                                      ? '$countryItemNewDeaths'
                                                      : '+ $countryItemNewDeaths',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles
                                                      .statisticsAccentTextStyle
                                                      .copyWith(
                                                    color: AppColors.deadColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Total Cases Values
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Total Infected Cases
                                              Expanded(
                                                child: Text(
                                                  '$countryItemInfected',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),

                                              // Total Recovered Cases
                                              Expanded(
                                                child: Text(
                                                  '$countryItemRecovered',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),

                                              // Total Active Cases
                                              Expanded(
                                                child: Text(
                                                  '$countryItemActive',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),

                                              // Total Deceased Casesƒ
                                              Expanded(
                                                child: Text(
                                                  '$countryItemDeaths',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
