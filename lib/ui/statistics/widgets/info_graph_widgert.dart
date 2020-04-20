import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/models/statistics/country_statistics_day_model.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_width_widget.dart';

class InfoGraphWidget extends StatefulWidget {
  final List<CountryStatistics> countryStatisticsList;

  const InfoGraphWidget({Key key, @required this.countryStatisticsList})
      : super(key: key);
  @override
  _InfoGraphWidgetState createState() => _InfoGraphWidgetState();
}

class _InfoGraphWidgetState extends State<InfoGraphWidget> {
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
        // Checking if the list has any elemnts i.e the API provided
        // data for the queried country
        child: (widget.countryStatisticsList.isNotEmpty)
            ? BarChart(
                mainBarData(
                  countryStatisticsList: widget.countryStatisticsList.sublist(
                    (widget.countryStatisticsList.length) - 7,
                    (widget.countryStatisticsList.length) - 0,
                  ),
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              )
            : Text(
                Strings.emptyData,
                style: TextStyles.errorHeadingTextStlye.copyWith(
                  fontSize: screenWidth / 25,
                ),
              ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: Dimens.horizontalPadding,
          top: Dimens.verticalPadding / 0.45,
          right: Dimens.horizontalPadding,
        ),
        // Checking if the list has any elemnts i.e the API provided
        // data for the queried country
        child: (widget.countryStatisticsList.isNotEmpty)
            ? LineChart(
                // Using the latest 15 days days for the Weekly Information
                areaChartData(
                  countryStatisticsList: widget.countryStatisticsList.sublist(
                    (widget.countryStatisticsList.length) - 15,
                    (widget.countryStatisticsList.length) - 0,
                  ),
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.verticalPadding / 0.75,
                  right: Dimens.verticalPadding / 50,
                ),
                child: Text(
                  Strings.emptyData,
                  style: TextStyles.errorHeadingTextStlye.copyWith(
                    fontSize: screenWidth / 25,
                  ),
                ),
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

  // Calculating the max value in the array to be passed onto the normalization function
  // [normalizedValue]
  final dailyStatisticsMax =
      countryStatisticsList[countryStatisticsListLength - 1].cases.toDouble();

  // Calculating the min value in the array to be passed onto the normalization function
  // [normalizedValue]
  final dailyStatisticsMin =
      countryStatisticsList[countryStatisticsListLength - 7].cases.toDouble();

  // Creating a buffer value to display the the top-most title on the left side bar
  // for the [BarChartData]
  final leftTitleTopBuffer =
      countryStatisticsList[countryStatisticsListLength - 1].cases.toDouble() +
          countryStatisticsList[countryStatisticsListLength - 2].cases / 7.5;

  // Looping through the list to add each individual item with the normalized values
  // to the [BarChartGroupData] which is used to plot the points on the graph
  countryStatisticsList.asMap().forEach(
    (index, item) {
      barChartData.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              y: normalizedValue(
                oldValue: item.cases,
                oldMin: dailyStatisticsMin,
                oldMax: dailyStatisticsMax,
                newMin: 4,
              ),
              color: AppColors.blueColor,
              width: screenWidth / 20,
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                // Setting the max value of the Bar Chart (Y Axis) with a buffer
                // so that the graph is not painted outside the container
                y: 11,
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
    groupsSpace: screenWidth / 14,
    alignment: BarChartAlignment.center,

    // Define the properties for the Bar Chart when touched over a plot
    barTouchData: BarTouchData(
      // Defining the properties of the ToolTip which occurs when touched/hovered over a plotted item
      // [fitInsideHorizontally] and [fitInsideVertically] are set to true to fit the tooltip in the
      // view of the Widget
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
            '$weekDay \n ${countryStatisticsList[group.x].cases}',
            TextStyles.statisticsToopTipTextStyle.copyWith(
              fontSize: screenWidth / 30,
            ),
          );
        },
      ),
    ),

    // Side and Bottom Tiles
    titlesData: FlTitlesData(
      show: true,
      // Side Titles
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: TextStyles.statisticsLabelTextStyle.copyWith(
          fontSize: screenWidth / 33,
        ),
        margin: screenWidth / 22,
        reservedSize: screenWidth / 15,
        getTitles: (value) {
          if (value == 2) {
            return '${getUnitValue(countryStatisticsList[2].cases.toDouble())}';
          } else if (value == 6) {
            return '${getUnitValue(countryStatisticsList[3].cases.toDouble())}';
          } else if (value == 10) {
            return '${getUnitValue(leftTitleTopBuffer)}';
          } else {
            return '';
          }
        },
      ),

      // Bottom Titles
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: TextStyles.statisticsLabelTextStyle.copyWith(
          fontSize: screenWidth / 30,
        ),
        reservedSize: screenWidth / 20,
        margin: screenHeight / 175,
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
    ),

    // Hiding the Box plotted around the Bar Chart
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: barChartData,
  );
}

// Smooth Area Graph Visualisation for Weekly Data
LineChartData areaChartData({
  @required List<CountryStatistics> countryStatisticsList,
  @required double screenWidth,
  @required double screenHeight,
}) {
  final int countryStatisticsListLength = countryStatisticsList.length;
  final List<Color> gradientColors = [
    AppColors.blueColor,
    AppColors.accentBlueColor,
  ];
  // Empty [FlSpot] List. Intialised with [] to avoid error when trying to
  // add items using the .add method
  final List<FlSpot> flSpotData = [];

  // Calculating the max value in the array to be passed onto the normalization function
  // [normalizedValue]
  final weeklyStatisticsMax =
      countryStatisticsList[countryStatisticsListLength - 1].cases.toDouble();

  // Calculating the min value in the array to be passed onto the normalization function
  // [normalizedValue]
  final weeklyStatisticsMin =
      countryStatisticsList[countryStatisticsListLength - 15].cases.toDouble();

  // Creating a buffer value to display the the top-most title on the left side bar
  // for the [LineChartData]
  final leftTitleTopBuffer =
      countryStatisticsList[countryStatisticsListLength - 1].cases.toDouble() +
          countryStatisticsList[countryStatisticsListLength - 2].cases / 5;

  // Looping through the list to add each individual item with the normalized values
  // to [flSpotData] which is used to plot the points on the graph
  countryStatisticsList.asMap().forEach(
    (index, item) {
      // Adding the indexes and the value to [flSpotData]
      flSpotData.add(
        FlSpot(
          index.toDouble(),
          normalizedValue(
            oldValue: item.cases,
            oldMin: weeklyStatisticsMin,
            oldMax: weeklyStatisticsMax,
            newMin: 0,
          ),
        ),
      );
    },
  );
  return LineChartData(
    gridData: const FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      // Side Titles
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: TextStyles.statisticsLabelTextStyle.copyWith(
          fontSize: screenWidth / 33,
        ),
        margin: screenWidth / 22,
        reservedSize: screenWidth / 15,

        // Setting the cases values using the [getUnitValue] method across the graph
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '${getUnitValue(countryStatisticsList[1].cases.toDouble())}';
              break;
            case 7:
              return '${getUnitValue(countryStatisticsList[9].cases.toDouble())}';
              break;
            case 13:
              return '${getUnitValue(leftTitleTopBuffer)}';
              break;
          }
          return '';
        },
      ),

      // Bottom Titles
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: screenWidth / 20,
        margin: screenHeight / 175,
        textStyle: TextStyles.statisticsLabelTextStyle.copyWith(
          fontSize: screenWidth / 30,
        ),

        // Setting the date values using the [dailyMonthData] method across the graph
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return '${dailyMonthData(date: countryStatisticsList[2].date)}';
            case 7:
              return '${dailyMonthData(date: countryStatisticsList[7].date)}';
            case 12:
              return '${dailyMonthData(date: countryStatisticsList[12].date)}';
          }
          return '';
        },
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),

    // Setting the range of values on x-axis between 0 and 14 to accompany the 15 days
    minX: 0,
    maxX: 14,

    // Setting the range of values on y-axis between -5 to 13 to create a buffer between
    // the minimum and maximum value.
    // The actual number of entries are 10 which are plotted between [0...10]
    minY: -5,
    maxY: 13,

    // Define the properties for the graph when touched over a point
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map(
          (spotIndex) {
            // Adding the dot and the line (on click of the dot) with relevant styling
            return TouchedSpotIndicatorData(
              FlLine(
                color: AppColors.accentBlueColor.withOpacity(0.5),
              ),
              FlDotData(
                dotSize: screenWidth / 50,
                dotColor: AppColors.blueColor,
              ),
            );
          },
        ).toList();
      },

      // Defining the properties of the ToolTip which occurs when touched/hovered over a plotted item
      // [fitInsideHorizontally] and [fitInsideVertically] are set to true to fit the tooltip in the
      // view of the Widget
      touchTooltipData: LineTouchTooltipData(
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        tooltipBgColor: Colors.blueAccent,
        tooltipRoundedRadius: screenWidth / 50,
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          // Iterating through [touchBarSpots] to create the [LineToolTipItem] to display
          // date, case count and `Confirmed` static String
          return touchedBarSpots.map((barSpot) {
            final flSpot = barSpot;
            return LineTooltipItem(
              '${dailyMonthData(date: countryStatisticsList[flSpot.x.toInt()].date)}\n${countryStatisticsList[flSpot.x.toInt()].cases}\nConfirmed',
              TextStyles.statisticsToopTipTextStyle.copyWith(
                fontSize: screenWidth / 30,
              ),
            );
          }).toList();
        },
      ),
    ),

    // Setting the properties for the Line Graph
    // Setting the [belowBarData] property to display a gradient below the plotted Line Graph
    lineBarsData: [
      LineChartBarData(
        spots: flSpotData,
        isCurved: true,
        colors: gradientColors,
        gradientFrom: const Offset(0, 0),
        gradientTo: const Offset(-1, -1),
        barWidth: screenWidth / 150,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          dotColor: AppColors.blueColor,
          dotSize: screenWidth / 75,
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

/// Method to return the Month from a given String of date of the `Zulu time` (UTC) format
String dailyMonthData({String date}) {
  const monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  final parsedDateTime = DateTime.parse(date);

  return '${parsedDateTime.toLocal().day.toString()} ${jsonDecode(monthData)['${parsedDateTime.toLocal().month}']}';
}

/// Method to return the Weekday from a given String of date of the `Zulu time` (UTC) format
String dailyWeekDay({String date}) {
  const dayData =
      '{ "1" : "Monday", "2" : "Tuesday", "3" : "Wednesday", "4" : "Thursday", "5" : "Friday", "6" : "Saturday", "7" : "Sunday" }';

  final parsedDateTime = DateTime.parse(date);

  return jsonDecode(dayData)['${parsedDateTime.toLocal().weekday}'];
}

/// Used to normalize the value of number of cases to a smaller quantity
double normalizedValue(
    {int oldValue, double oldMax, double oldMin, int newMin}) {
  const int newMax = 10;
  final double newValue =
      (((oldValue - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin;
  return double.parse(newValue.toStringAsExponential(3));
}

/// Returns the value in K, M, G, T, P and E for a given number
/// (Returns the Human Readable or humanized number)
String getUnitValue(double count) {
  // https://stackoverflow.com/questions/9769554/how-to-convert-number-into-k-thousands-m-million-and-b-billion-suffix-in-jsp
  if (count < 1000) return "${count.toStringAsFixed(0)}";

  // ~/ is effective division to product an integer result
  final int exp = math.log(count) ~/ math.log(1000);
  final String value = 'KMGTPE'[exp - 1];

  return '${(count / math.pow(1000, exp)).toStringAsFixed(0)} $value';
}
