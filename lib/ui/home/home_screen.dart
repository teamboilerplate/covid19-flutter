import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/res/asset_images.dart';
import 'package:covid19/constants/app_theme.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/models/home/countries_list_model.dart';
import 'package:covid19/stores/home/home_notifier.dart';
import 'package:covid19/ui/home/widgets/home_loading_widget.dart';
import 'package:covid19/ui/home/widgets/symptom_checker_widget.dart';
import 'package:covid19/ui/home/widgets/info_widget.dart';
import 'package:covid19/ui/home/widgets/info_graph_widgert.dart';
import 'package:covid19/ui/static/static_error_screen.dart';
import 'package:covid19/utils/bloc/application_bloc.dart';
import 'package:covid19/utils/bloc/application_state.dart';
import 'package:covid19/utils/image_cache_manager.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/country_picker/country_picker_dialog.dart';
import 'package:covid19/widgets/progress_indicator_widget.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/// Displays the country Information and country statistics
/// Handles the various states of the [HomeChangeNotifier] to perform
/// the appropriate action
class _HomeScreenState extends State<HomeScreen> {
  List<Countries> countriesList;
  DateTime today;
  List<Countries> countrySearchItems = [];
  String selectedCountry, selectedCountryISO2;

  @override
  void initState() {
    super.initState();

    // Setting the value of [selectedCountry] and [selectedCountryISO2] which
    // used to display the current selected country and to fetch the flag flat icon
    // of the Country respectively
    //
    // Using [Futre.delayed] act as an additional secutiry layer to perform the requested
    // tasks before the UI is painted
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        // Using [Bloc] to obtain the state which contains the [selectedCountry], [selectedCountryISO2]
        // and [countriesList]
        final ApplicationState state =
            BlocProvider.of<ApplicationBloc>(context).state;
        if (state is ApplicationInitialized) {
          setState(
            () {
              selectedCountry = state.userCountryInformation.countryName;
              selectedCountryISO2 = state.userCountryInformation.countryCode;
              countriesList = state.countriesList;
              // Adding all the items of the [countriesList] to [countrySearchItems]
              for (final item in countriesList) {
                countrySearchItems.add(
                  Countries(
                    iso2: item.iso2,
                    name: item.name,
                  ),
                );
              }
              // Makign the Network Call to fetch the summary information for the selected country
              _fetchData(iso2: selectedCountryISO2);
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Fetching Information about provided countries
  Future<void> _fetchData({@required String iso2}) async {
    Provider.of<HomeChangeNotifier>(context, listen: false).fetchData(
      iso2: iso2,
    );
    setState(() {
      today = DateTime.now();
    });
  }

  // Building the row item for the Searchable Country Dialog
  Widget _buildDialogItem(Countries country) {
    return Row(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              '${Endpoints.baseUrlCountryFlags}${country.iso2}/flat/32.png',
          cacheManager: ImageCacheManager(),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(country.name),
        )
      ],
    );
  }

  // Method used to open the Searchable Country Dialog
  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: themeData,
          child: CountryPickerDialog(
            isDividerEnabled: true,
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: AppColors.offBlackColor,
            countriesList: countrySearchItems,
            isSearchable: true,
            onValuePicked: (Countries country) {
              setState(
                () {
                  // Setting the values of [selectedCountry] and [selectedCountryISO2]
                  // after selecting a country.
                  // This data is used to fetch the Information and Statistics about
                  // the selectec country.
                  selectedCountry = country.name;
                  selectedCountryISO2 = country.iso2;
                  _fetchData(iso2: selectedCountryISO2);
                },
              );
            },
            itemBuilder: _buildDialogItem,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Consumer<HomeChangeNotifier>(
          builder: (
            BuildContext context,
            HomeChangeNotifier notifier,
            Widget child,
          ) {
            switch (notifier.state) {
              // Switch Case which signfiies that [HomeState] is Loading
              case HomeState.loading:
                return Stack(
                  children: <Widget>[
                    HomeLoadingWidget(
                      today: today,
                      selectedCountry: selectedCountry,
                      selectedCountryISO2: selectedCountryISO2,
                    ),
                    const CustomProgressIndicatorWidget(),
                  ],
                );

              // Switch Case which signfiies that [HomeState] has some content
              case HomeState.hasData:
                final HomeStateData data = notifier.data;
                return RefreshIndicator(
                  onRefresh: () => _fetchData(
                    iso2: selectedCountryISO2,
                  ),
                  color: AppColors.accentColor,
                  child: ScrollConfiguration(
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
                            GestureDetector(
                              onTap: () {
                                _openCountryPickerDialog();
                              },
                              child: Row(
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
                                        style:
                                            TextStyles.hightlightText.copyWith(
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
                            ),

                            // Verical Spacing
                            SizedBoxHeightWidget(screenHeight / 200),

                            // Current Date
                            Text(
                              todayDateFormatter(today),
                              style:
                                  TextStyles.homeSubHeadingTextStlye.copyWith(
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

                            // Last Updated On Information
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              // Last Updated Date & Time
                              children: <Widget>[
                                Text(
                                  lastUpdateDateFormatter(
                                      data.countryInformation.lastUpdate),
                                  maxLines: 2,
                                  softWrap: true,
                                  style: TextStyles.homeSubHeadingTextStlye
                                      .copyWith(
                                    fontSize: screenWidth / 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _fetchData(
                                    iso2: selectedCountry,
                                  ),
                                  child: Icon(
                                    Icons.cached,
                                    size: screenWidth / 28,
                                    color: AppColors.offBlackColor,
                                  ),
                                ),
                              ],
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
                                    style:
                                        TextStyles.homeAccentTextStyle.copyWith(
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
                                    child: InfoCard(
                                      infoColor: AppColors.orangeColor,
                                      infoIcon: Icons.add,
                                      infoValue: data
                                          .countryInformation.confirmed.value
                                          .toString(),
                                      infoLabel: 'infected',
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InfoCard(
                                      infoColor: AppColors.greenColor,
                                      infoIcon: Icons.favorite,
                                      infoValue: data
                                          .countryInformation.recovered.value
                                          .toString(),
                                      infoLabel: 'recovered',
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InfoCard(
                                      infoColor: AppColors.redColor,
                                      infoIcon: Icons.close,
                                      infoValue: data
                                          .countryInformation.deaths.value
                                          .toString(),
                                      infoLabel: 'deaths',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Verical Spacing
                            SizedBoxHeightWidget(screenHeight / 25),

                            // Confirmed Cases Label
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Confirmed Cases',
                                  maxLines: 2,
                                  softWrap: true,
                                  style:
                                      TextStyles.homeHeadingTextStlye.copyWith(
                                    fontSize: screenWidth / 18,
                                  ),
                                ),

                                // Date Range Label
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //     right: Dimens.horizontalPadding,
                                //   ),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.end,
                                //     children: <Widget>[
                                //       Text(
                                //         '18 - 22 Mar',
                                //         maxLines: 2,
                                //         softWrap: true,
                                //         style: TextStyles.homeAccentTextStyle
                                //             .copyWith(
                                //           fontSize: screenWidth / 25,
                                //         ),
                                //       ),
                                //       Icon(
                                //         Icons.arrow_drop_down,
                                //         size: 25,
                                //         color: AppColors.offBlackColor,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),

                            // Verical Spacing
                            SizedBoxHeightWidget(screenHeight / 75),

                            // Information Tab
                            InfoGraph(
                              countryStatisticsList: data.countryStatisticsList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              // Switch Case which signfiies that [HomeState] has some Generic error
              case HomeState.hasError:
                final error = notifier.error;
                return Scaffold(
                  body: Center(
                    child: StaticErrorScreen(
                      image: AssetImage(AssetImages.genericError),
                      title: error,
                      desc:
                          'We are having some technical difficulties.\nPlease try again',
                      actionText: 'RETRY',
                      onRetry: () =>
                          notifier.fetchData(iso2: selectedCountryISO2),
                    ),
                  ),
                );

              // Switch Case which signfiies that [HomeState] has Network error
              case HomeState.hasNetworkError:
                final error = notifier.error;
                return Scaffold(
                  body: Center(
                    child: StaticErrorScreen(
                      image: AssetImage(AssetImages.noInternet),
                      title: error,
                      desc:
                          'You don’t seem to have an active Internet Connection',
                      actionText: 'RETRY',
                      onRetry: () =>
                          notifier.fetchData(iso2: selectedCountryISO2),
                    ),
                  ),
                );

              // Switch Case which signfiies that [HomeState] is Unitlialised
              // which is the default state for [HomeState]
              case HomeState.unInit:
                return const Center(
                  child: CustomProgressIndicatorWidget(),
                );
            }
            // If the state of [HomeState] is none of the switched states,
            // returning an empty container to catch it if it ever occurs
            // This should never happen.
            return Container();
          },
        ),
      ),
    );
  }
}

String todayDateFormatter(DateTime date) {
  const dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  const monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return '${json.decode(dayData)['${date.weekday}']}, ${date.day.toString()} ${json.decode(monthData)['${date.month}']} ${date.year.toString()}';
}

String lastUpdateDateFormatter(String date) {
  final parsedDateTime = DateTime.parse(date);

  return 'Information Last Updated : ${todayDateFormatter(parsedDateTime.toLocal())} ${parsedDateTime.toLocal().hour.toString()}:${parsedDateTime.toLocal().minute.toString()} ${parsedDateTime.toLocal().timeZoneName}';
}
