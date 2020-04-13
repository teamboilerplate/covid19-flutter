import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/models/home/country_statistics_day_model.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_width_widget.dart';

class InfoGraph extends StatefulWidget {
  final List<CountryStatistics> countryStatisticsList;

  const InfoGraph({Key key, @required this.countryStatisticsList})
      : super(key: key);
  @override
  _InfoGraphState createState() => _InfoGraphState();
}

class _InfoGraphState extends State<InfoGraph> {
  bool dailySelected = true, weeklyselected = false;

  // Page Controller to control change between Daily and Weekly
  // TODO : Figure out visualisation of Monthly Data
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Toggle the selection between Daily and Monthly Items
  void toggleSelection(int itemIndex) {
    switch (itemIndex) {
      case 0:
        if (pageController.page != 0.0) {
          dailySelected = true;
          weeklyselected = false;
          pageController.animateToPage(
            0,
            duration: const Duration(
              milliseconds: 250,
            ),
            curve: Curves.bounceOut,
          );
        }
        break;
      case 1:
        if (pageController.page != 1.0) {
          dailySelected = false;
          weeklyselected = true;
          pageController.animateToPage(
            1,
            duration: const Duration(
              milliseconds: 250,
            ),
            curve: Curves.bounceOut,
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);

    // Adding the Respective Charts to the list of page [_pages]
    final List<Widget> _pages = <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimens.horizontalPadding,
          Dimens.verticalPadding / 0.75,
          Dimens.horizontalPadding,
          Dimens.verticalPadding / 50,
        ),
        child: BarChart(
          mainBarData(
            countryStatisticsList: widget.countryStatisticsList,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.horizontalPadding,
        ),
        child: LineChart(
          mainData(widget.countryStatisticsList),
        ),
      ),
    ];

    // Houses the the Tabs and the Graphs
    return Column(
      children: <Widget>[
        // Container is used for the grey underline under the tabs
        Container(
          margin: const EdgeInsets.only(
            right: Dimens.horizontalPadding,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: AppColors.offBlackColor.withAlpha(75),
              ),
            ),
          ),

          // Tab Items
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Tab 1
              // Gesture Detector used to avoid the Ripple Effect caused in InkWell
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      toggleSelection(0);
                    },
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(10),
                  decoration: dailySelected
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.blackColor,
                              width: 2,
                            ),
                          ),
                        )
                      : const BoxDecoration(),
                  child: Text(
                    'Daily',
                    style: dailySelected
                        ? TextStyles.hightlightText.copyWith(
                            fontSize: screenWidth / 20,
                          )
                        : TextStyles.titleTextStyle.copyWith(
                            fontSize: screenWidth / 20,
                          ),
                  ),
                ),
              ),

              // Horizontal Spacing
              SizedBoxWidthWidget(screenWidth / 15),

              // Tab 2
              // Gesture Detector used to avoid the Ripple Effect caused in InkWell
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      toggleSelection(1);
                    },
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(10),
                  decoration: weeklyselected
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.blackColor,
                              width: 2,
                            ),
                          ),
                        )
                      : const BoxDecoration(),
                  child: Text(
                    'Weekly',
                    style: weeklyselected
                        ? TextStyles.hightlightText.copyWith(
                            fontSize: screenWidth / 20,
                          )
                        : TextStyles.titleTextStyle.copyWith(
                            fontSize: screenWidth / 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Non-Scrollable PageView builder used to display the Charts
        Container(
          width: screenWidth,
          height: screenHeight / 3.5,
          padding: const EdgeInsets.only(
            right: Dimens.horizontalPadding,
          ),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
        )
      ],
    );
  }
}

// Bar Chart Visualisation for the Daily Data
BarChartData mainBarData({
  @required List<CountryStatistics> countryStatisticsList,
  @required double screenWidth,
  @required double screenHeight,
}) {
  final int countryStatisticsListLength = countryStatisticsList.length;
  // Empty [BarChartGroupData] List. Intialised with [] to avoid error when trying to
  // add items using the .add method
  final List<BarChartGroupData> barChartData = [];
  // Using the latest 7 days days for the Daily Information
  countryStatisticsList
      .sublist(
        countryStatisticsListLength - 7,
        countryStatisticsListLength - 0,
      )
      .asMap()
      .forEach(
    (index, item) {
      barChartData.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              y: item.cases.toDouble(),
              color: AppColors.blueColor,
              width: screenWidth / 20,
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                // Setting the max value of the Bar Chart (Y Axis) with a buffer
                // so that the graph is not painted outside the container
                y: countryStatisticsList[countryStatisticsListLength - 1]
                        .cases
                        .toDouble() +
                    countryStatisticsList[countryStatisticsListLength - 2]
                            .cases /
                        7.5,
                // Background colour of the Bar Chart - Lighter Version than the filled lines
                color: AppColors.accentBlueColor,
              ),
            ),
          ],
        ),
      );
    },
  );
  return BarChartData(
    groupsSpace: screenWidth / 12,
    alignment: BarChartAlignment.center,
    barTouchData: BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        tooltipBgColor: Colors.blueAccent,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          // Iterating through the 7 items with the index of the [countryStatisticsListLength]
          // to obtain the weekday of the particular day for the [BarTooltipItem]
          String weekDay;
          switch (group.x.toInt()) {
            case 0:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 7].date,
              );
              break;
            case 1:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 6].date,
              );
              break;
            case 2:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 5].date,
              );
              break;
            case 3:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 4].date,
              );
              break;
            case 4:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 3].date,
              );
              break;
            case 5:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 2].date,
              );
              break;
            case 6:
              weekDay = dailyWeekDay(
                date:
                    countryStatisticsList[countryStatisticsListLength - 1].date,
              );
              break;
          }
          return BarTooltipItem(
            '$weekDay \n ${(rod.y - 1).toInt()}',
            const TextStyle(
              color: AppColors.whiteColor,
            ),
          );
        },
      ),
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth / 35,
        ),
        margin: screenWidth / 50,
        getTitles: (double value) {
          // Iterating through the 7 items with the index of the [countryStatisticsListLength]
          // to obtain the Month
          switch (value.toInt()) {
            case 0:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 7].date,
              );
            case 1:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 6].date,
              );
            case 2:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 5].date,
              );
            case 3:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 4].date,
              );
            case 4:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 3].date,
              );
            case 5:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 2].date,
              );
            case 6:
              return dailyMonthData(
                date:
                    countryStatisticsList[countryStatisticsListLength - 1].date,
              );
            default:
              return '';
          }
        },
      ),
      leftTitles: const SideTitles(
        showTitles: false,
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: barChartData,
  );
}

// Smooth Area Graph Visualisation for Weekly Data
LineChartData mainData(List<CountryStatistics> countryStatisticsList) {
  final int countryStatisticsListLength = countryStatisticsList.length;
  final List<Color> gradientColors = [
    AppColors.blueColor,
    AppColors.accentBlueColor,
  ];
  // Empty [FlSpot] List. Intialised with [] to avoid error when trying to
  // add items using the .add method
  final List<FlSpot> flSpotData = [];

  // Using the latest 15 days days for the Weekly Information
  countryStatisticsList
      .sublist(
        countryStatisticsListLength - 15,
        countryStatisticsListLength - 0,
      )
      .asMap()
      .forEach(
    (index, item) {
      // Adding the indexes and the value to [flSpotData]
      flSpotData.add(
        FlSpot(
          index.toDouble(),
          item.cases.toDouble(),
        ),
      );
    },
  );
  return LineChartData(
    gridData: const FlGridData(
      show: false,
    ),
    titlesData: const FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 14,
    // Creating a buffer for the minY and maxY so that the graph is not painted
    // outside the container
    minY: countryStatisticsList[countryStatisticsListLength - 15]
            .cases
            .toDouble() -
        countryStatisticsList[countryStatisticsListLength - 8].cases.toDouble(),
    maxY: countryStatisticsList[countryStatisticsListLength - 1]
            .cases
            .toDouble() +
        countryStatisticsList[countryStatisticsListLength - 2].cases / 2.5,
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map(
          (spotIndex) {
            // Adding the dot and the line (on click of the dot) with relevant styling
            return TouchedSpotIndicatorData(
              const FlLine(
                color: AppColors.accentBlueColor,
              ),
              const FlDotData(
                dotSize: 8,
                dotColor: AppColors.blueColor,
              ),
            );
          },
        ).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        tooltipBgColor: Colors.blueAccent,
        tooltipRoundedRadius: 5,
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          // Iterating through [touchBarSpots] to create the [LineToolTipItem] to display
          // date, case count and `Confirmed` static String
          return touchedBarSpots.map((barSpot) {
            final flSpot = barSpot;
            return LineTooltipItem(
              '${dailyMonthData(date: countryStatisticsList[countryStatisticsListLength - 15 + flSpot.x.toInt()].date)}\n${flSpot.y.toInt()}\nConfirmed',
              const TextStyle(
                color: AppColors.whiteColor,
              ),
            );
          }).toList();
        },
      ),
    ),
    lineBarsData: [
      LineChartBarData(
        spots: flSpotData,
        isCurved: true,
        colors: gradientColors,
        gradientFrom: const Offset(0, 0),
        gradientTo: const Offset(-1, -1),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: true,
          dotColor: AppColors.blueColor,
          dotSize: 6.0,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors
              .map(
                (color) => color.withOpacity(0.1),
              )
              .toList(),
          gradientFrom: const Offset(1, 0),
          gradientTo: const Offset(1, 1),
          gradientColorStops: [0.25, 1],
        ),
      ),
    ],
  );
}

// Method to return the Month for the Daily Results
String dailyMonthData({String date}) {
  const monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  final parsedDateTime = DateTime.parse(date);

  return '${parsedDateTime.toLocal().day.toString()} ${jsonDecode(monthData)['${parsedDateTime.toLocal().month}']}';
}

// Method to return the Weekday for the Daily Results
String dailyWeekDay({String date}) {
  const dayData =
      '{ "1" : "Monday", "2" : "Tuesday", "3" : "Wednesday", "4" : "Thursday", "5" : "Friday", "6" : "Saturday", "7" : "Sunday" }';

  final parsedDateTime = DateTime.parse(date);

  return jsonDecode(dayData)['${parsedDateTime.toLocal().weekday}'];
}
