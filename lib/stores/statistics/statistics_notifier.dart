import 'package:flutter/material.dart'
    show ChangeNotifier, debugPrint, required;
import 'package:covid19/constants/strings.dart';
import 'package:covid19/data/repository/base_repository.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';
import 'package:covid19/models/statistics/statistics_response_model.dart';
import 'package:covid19/models/statistics/country_statistics_day_model.dart';

/// States of the [StatisticsScreen]
enum StatisticsState { loading, hasData, hasError, hasNetworkError, unInit }

/// DataModel for the [StatisticsScreen]
/// Contains the data for the 2 areas in the screen
/// 1. Country Summary information
/// 2. Country Statistics
class StatisticseData {
  final StatisticsResponseModel statisticsInformationData;
  final List<CountryStatistics> countryStatisticsConfirmedList;
  final List<CountryStatistics> countryStatisticsRecoveredList;
  StatisticseData({
    @required this.statisticsInformationData,
    @required this.countryStatisticsConfirmedList,
    @required this.countryStatisticsRecoveredList,
  });
}

/// [StatisticsChangeNotifier] for the (lib/ui/statistics/statistics_screen.dart) [StatisticsScreen]
/// Handles the states of the [StatisticsScreen].
///
/// 1. [state] represents the current state of the [StatisticsScreen]
/// 2. [error] represents any error that may have occurred during the API call
/// 3. [fetchData] is used to make API calls from the [userRepository]
class StatisticsChangeNotifier with ChangeNotifier {
  final BaseRepository userRepository;
  StatisticsState state = StatisticsState.unInit;
  StatisticseData data;
  String error;

  StatisticsChangeNotifier({@required this.userRepository});

  Future<void> fetchHomeData({@required String iso2}) async {
    // Setting the state as `StatisticsState.loading` indicating an API request in process
    state = StatisticsState.loading;

    // Signalling the change in state to `StatisticsState.loading`
    notifyListeners();

    // Fetching country summary information and country statistics wrapped
    // Wrapping the Network Requests in a try/catch statement to catch any errors accounted and
    // not accounted for
    try {
      final StatisticsResponseModel countryInformation =
          await userRepository.fetchHomeData(iso2: iso2);

      final List<CountryStatistics> countryStatisticsConfirmedList =
          await userRepository.fetchCountryStatisticsConfirmed(iso2: iso2);

      final List<CountryStatistics> countryStatisticsRecoveredList =
          await userRepository.fetchCountryStatisticsRecovered(iso2: iso2);

      data = StatisticseData(
        statisticsInformationData: countryInformation,
        countryStatisticsConfirmedList: countryStatisticsConfirmedList,
        countryStatisticsRecoveredList: countryStatisticsRecoveredList,
      );

      // Setting the state as `StatisticsState.hasData` indicating an API request has been completed
      state = StatisticsState.hasData;
    }

    // Catching the [APIResponseException] and settng the appropriate state
    on APIResponseException catch (e) {
      debugPrint('API Response Exception in Home Notifier :- ${e.message}');
      state = StatisticsState.hasError;
      error = Strings.genericErrorTitle;
    }

    // Catching the [NetworkException] and settng the appropriate state
    on NetworkException catch (e) {
      debugPrint('Netowork Error in Home Notifier :- ${e.message}');
      state = StatisticsState.hasNetworkError;
      error = Strings.noInternetErrorTitle;
    }

    /// Catching any Generic Errors and settng the appropriate state
    catch (e) {
      debugPrint(' Error in Home Notifier :- $e');
      state = StatisticsState.hasError;
      error = Strings.genericErrorTitle;
    }

    /// Signalling the change of any/all objects
     finally {
      notifyListeners();
    }
  }
}
