import 'package:flutter/material.dart'
    show ChangeNotifier, debugPrint, required;
import 'package:covid19/data/repository/base_repository.dart';
import 'package:covid19/models/home/home_response_model.dart';
import 'package:covid19/models/home/country_statistics_day_model.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';

/// States of the [HomeScreen]
enum HomeState { loading, hasData, hasError, hasNetworkError, unInit }

/// DataModel for the [HomeScreen]
/// Contains the data for the 2 areas in the screen
/// 1. Country Summary information
/// 2. Country Statistics
class HomeStateData {
  final HomeResponseModel countryInformation;
  final List<CountryStatistics> countryStatisticsList;
  HomeStateData({
    @required this.countryInformation,
    @required this.countryStatisticsList,
  });
}

/// [ChangeNotifier] for the (lib/ui/home/home_screen.dart) [HomeScreen]
/// Handles the states of the [HomeScreen].
///
/// 1. [state] represents the current state of the [HomeScreen]
/// 2. [error] represents any error that may have occurred during the API call
/// 3. [fetchData] is used to make API calls from the [userRepository]
class HomeChangeNotifier with ChangeNotifier {
  final BaseRepository userRepository;
  HomeState state = HomeState.unInit;
  HomeStateData data;
  String error;

  HomeChangeNotifier({@required this.userRepository});

  Future<void> fetchData({@required String iso2}) async {
    // Setting the state as `HomeState.loading` indicating an API request in process
    state = HomeState.loading;

    // Signalling the change in state to `HomeState.loading`
    notifyListeners();

    // Fetching country summary information and country statistics wrapped
    // Wrapping the Network Requests in a try/catch statement to catch any errors accounted and
    // not accounted for
    try {
      final HomeResponseModel countryInformation =
          await userRepository.fetchHomeData(iso2: iso2);

      final List<CountryStatistics> countryStatisticsList =
          await userRepository.fetchCountryStatistics(iso2: iso2);

      data = HomeStateData(
        countryInformation: countryInformation,
        countryStatisticsList: countryStatisticsList,
      );

      // Setting the state as `HomeState.hasData` indicating an API request has been completed
      state = HomeState.hasData;
    }

    // Catching the [APIResponseException] and settng the appropriate state
    on APIResponseException catch (e) {
      debugPrint('API Response Exception in Home Notifier :- ${e.message}');
      state = HomeState.hasError;
      error = 'Something Went Wrong';
    }

    // Catching the [NetworkException] and settng the appropriate state
    on NetworkException catch (e) {
      debugPrint('Netowork Error in Home Notifier :- ${e.message}');
      state = HomeState.hasNetworkError;
      error = 'No Internet Connection';
    }

    /// Catching any Generic Errors and settng the appropriate state
    catch (e) {
      debugPrint(' Error in Home Notifier :- $e');
      state = HomeState.hasError;
      error = 'Something Went Wrong';
    }

    /// Signalling the change of any/all objects
     finally {
      notifyListeners();
    }
  }
}
