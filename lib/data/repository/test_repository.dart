import 'package:flutter/material.dart';
import 'package:covid19/data/repository/base_repository.dart';
import 'package:covid19/models/application/ip_model.dart';
import 'package:covid19/models/application/country_information_model.dart';
import 'package:covid19/models/home/countries_list_model.dart';
import 'package:covid19/models/home/home_response_model.dart';
import 'package:covid19/models/home/country_statistics_day_model.dart';

/// Extends the [BaseRepository] to implement the API request methods
///
/// Mimics the API response with a static response and 1 second delay
class TestRepository implements BaseRepository {
  // Adds a 1 second delay whenever used
  Future<void> _wait() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  Future<IPModel> fetchUserIP() async {
    _wait();
    return IPModel(
      origin: "103.69.21.105",
    );
  }

  @override
  Future<CountryInformationModel> fetchUserCountryInformation({
    @required String ipAddress,
  }) async {
    _wait();
    return CountryInformationModel(
      countryName: "India",
      countryCode: "IN",
    );
  }

  @override
  Future<List<Countries>> fetchCountriesList() async {
    _wait();
    return [
      Countries(
        name: "India",
        iso2: "IN",
        iso3: "IND",
      )
    ];
  }

  @override
  Future<HomeResponseModel> fetchHomeData({
    @required String iso2,
  }) async {
    _wait();
    return HomeResponseModel(
      confirmed: CasesInfo(
        value: 555,
      ),
      recovered: CasesInfo(
        value: 555,
      ),
      deaths: CasesInfo(
        value: 555,
      ),
      lastUpdate: "2020-04-11T16:46:16.000Z",
    );
  }

  @override
  Future<List<CountryStatistics>> fetchCountryStatistics({String iso2}) async {
    return [
      CountryStatistics(
        country: "India",
        countryCode: "IN",
        lat: "20.59",
        lon: "78.96",
        cases: 0,
        status: "confirmed",
        date: "2020-01-22T00:00:00Z",
      )
    ];
  }
}
