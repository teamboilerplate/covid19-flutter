import 'package:bloc/bloc.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';
import 'package:covid19/data/repository/base_repository.dart';
import 'package:covid19/models/application/country_information_model.dart';
import 'package:covid19/models/application/ip_model.dart';
import 'package:covid19/models/statistics/countries_list_model.dart';
import 'package:covid19/utils/bloc/application_events.dart';
import 'package:covid19/utils/bloc/application_state.dart';
import 'package:covid19/utils/image_cache_manager.dart';
import 'package:flutter/material.dart';

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
        // Fetching the user's Address
        final IPModel ipaddress = await userRepository.fetchUserIP();

        // Fetching Information about User's country using the retrieved IP Address
        final CountryInformationModel userCountryInformation =
            await userRepository.fetchUserCountryInformation(
          ipAddress: ipaddress.origin,
        );

        // Fetching List of countries for the Covid-19 Tracker Information
        final List<Countries> countriesList =
            await userRepository.fetchCountriesList();

        // Instantiating the ImageCacheManager to cache Image data
        final ImageCacheManager cacheManager = ImageCacheManager();

        // Caching the Covid-19 Prevention Do's and Don'ts
        await cacheManager.downloadFile(Endpoints.baseUrlPreventionInfographic);

        // Caching all the Flag images for the List of countries obtained
        await Future.forEach(
          countriesList,
          (item) async* {
            try {
              await cacheManager.downloadFile(
                '${Endpoints.baseUrlCountryFlags}${item.iso2}/flat/32.png',
              );
            }
            // Catching any erros thrown by the API - Considering all erros as Network absent error
            catch (e) {
              debugPrint(
                  'Error while pre-caching: https://www.countryflags.io/+${item.iso2}+/flat/32.png due to: $e');
              yield ApplicationNetworkException();
            }
          },
        );

        // Yielding the value to the output stream by passing all the data fetched
        yield ApplicationInitialized(
          countriesList: countriesList,
          ipAddress: ipaddress.origin,
          userCountryInformation: userCountryInformation,
        );
      }

      // Yielding Network Exception - to be handled by main.dart to display error screen
      on NetworkException {
        yield ApplicationNetworkException();
      }

      // Yielding Generic Exception - to be handled by main.dart to display error screen
      catch (e) {
        debugPrint('Error in Authentical Blooc :- ${e.toString()}');
        yield ApplicationGenericException();
      }
    }

    // Yielding the start of the tutorial Section - to be handled by main.dart
    if (event is TutorialModeBegin) {
      yield ApplicationTutorialState();
    }
  }
}
