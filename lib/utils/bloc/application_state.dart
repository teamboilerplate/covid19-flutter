import 'package:flutter/material.dart';
import 'package:covid19/models/application/country_information_model.dart';
import 'package:covid19/models/statistics/countries_list_model.dart';

/// Base class for the states of Authentication
///
/// Contains [ApplicationUninitialized], [ApplicationInitialized], [ApplicationTutorialState]
/// [ApplicationNetworkException] and [ApplicationGenericException]
abstract class ApplicationState {}

/// The state for the app is not set i.e [ApplicationUninitialized]
class ApplicationUninitialized extends ApplicationState {}

/// The required start-up data has been fetched and loaded in memory
class ApplicationInitialized extends ApplicationState {
  final List<Countries> countriesList;

  final CountryInformationModel userCountryInformation;

  ApplicationInitialized({
    @required this.countriesList,
    @required this.userCountryInformation,
  });
}

// This is User's first open of the Application
class ApplicationTutorialState extends ApplicationState {}

/// The User's device wasn't connected to the Internet
class ApplicationNetworkException extends ApplicationState {}

/// An Anncounted for error has occured
class ApplicationGenericException extends ApplicationState {}
