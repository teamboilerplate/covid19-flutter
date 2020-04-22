import 'package:covid19/data/symptoms_data.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';
import 'package:covid19/data/repository/base_repository.dart';
import 'package:covid19/models/application/country_information_model.dart';
import 'package:covid19/models/statistics/countries_list_model.dart';
import 'package:covid19/utils/bloc/application_events.dart';
import 'package:covid19/utils/bloc/application_state.dart';
import 'package:covid19/utils/cache_manager.dart';

/// This class controls the state of the application and informs the main method about the
/// flow of the application and any changes to the states of the application.
///
/// [ApplicationState] - Defines the various states of the application
///
/// 1. [AppStarted] - Indicates the opening of the application
/// 2. [TutorialModeBegin] - Indicates the start of the Tutoril section of the application
class ApplicationBloc extends Bloc<OnBoardingEvent, ApplicationState> {
  BaseRepository userRepository;

  ApplicationBloc({@required this.userRepository});

  @override
  ApplicationState get initialState => ApplicationUninitialized();

  @override
  Stream<ApplicationState> mapEventToState(OnBoardingEvent event) async* {
    // Checking for the App Started event to fetch the required information
    /// User's IP is looked up using the [fetchUserIP] method.
    /// Using the obtained IP, User's country information is looked up using the [fetchUserCountryInformation].
    /// The methods are present in the [BaseRepository]
    if (event is AppStarted) {
      // Indicating that the state of the Application is not set to load the Splash Screen
      // from main.dart
      yield ApplicationUninitialized();

      // Wrapping the Network Requests in a try/catch statement to catch any errors accounted and
      // not accounted for
      try {
        // Fetching Information about User's country ISO2 and IP Address (IP Addess isn't used in the application)
        final CountryInformationModel userCountryInformation =
            await userRepository.fetchUserCountryInformation();

        // Fetching List of countries for the Covid-19 Tracker Information
        final List<Countries> countriesList =
            await userRepository.fetchCountriesList();

        // Instantiating the ImageCacheManager to cache Image data
        final CacheManager cacheManager = CacheManager();

        // Caching the Covid-19 Prevention Do's and Don'ts
        await cacheManager.downloadFile(Endpoints.fetchPreventionGraphic);

        // Caching the Home Graphi
        await cacheManager.downloadFile(Endpoints.fetchHomeGraphic);

        // Caching the Symptom Images
        for (final item in symptomsData) {
          try {
            await cacheManager.downloadFile(item.imageURL);
          } catch (e) {
            debugPrint("Error while pre-caching: ${item.imageURL} due to: $e");
            yield ApplicationNetworkException();
          }
        }

        // Yielding the value to the output stream by passing all the data fetched
        yield ApplicationInitialized(
          countriesList: countriesList,
          userCountryInformation: userCountryInformation,
        );
      }

      // Yielding Network Exception - to be handled by main.dart to display error screen
      on NetworkException {
        yield ApplicationNetworkException();
      }

      // Yielding Generic Exception - to be handled by main.dart to display error screen
      catch (e) {
        debugPrint('Error in Application Blooc :- ${e.toString()}');
        yield ApplicationGenericException();
      }
    }

    // Yielding the start of the tutorial Section - to be handled by main.dart
    if (event is TutorialModeBegin) {
      yield ApplicationTutorialState();
    }
  }
}
