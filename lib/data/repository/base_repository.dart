import 'package:flutter/material.dart';
import 'package:covid19/models/application/ip_model.dart';
import 'package:covid19/models/application/country_information_model.dart';
import 'package:covid19/models/home/countries_list_model.dart';
import 'package:covid19/models/home/home_response_model.dart';
import 'package:covid19/models/home/country_statistics_day_model.dart';

/// Repository that houses all the methods to make API requests
///
/// [TestRepository] and [UserRepository] extend the BaseRepository
/// to override and implement the API requests
abstract class BaseRepository {
  /// Fetch List of all countries
  Future<IPModel> fetchUserIP();

  /// Fetch Current Country iso2 for the user
  Future<CountryInformationModel> fetchUserCountryInformation(
      {@required String ipAddress});

  /// Fetch List of all countries
  Future<List<Countries>> fetchCountriesList();

  /// Fetch Information about the required countries
  Future<HomeResponseModel> fetchHomeData({@required String iso2});

  /// Fetch Statistics about the required country
  Future<List<CountryStatistics>> fetchCountryStatistics(
      {@required String iso2});
}
