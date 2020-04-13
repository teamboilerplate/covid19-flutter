import 'dart:convert';
import 'package:covid19/data/countries_list_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/data/repository/base_repository.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';
import 'package:covid19/models/application/ip_model.dart';
import 'package:covid19/models/application/country_information_model.dart';
import 'package:covid19/models/home/countries_list_model.dart';
import 'package:covid19/models/home/home_response_model.dart';
import 'package:covid19/models/home/country_statistics_day_model.dart';
import 'package:covid19/utils/request_util.dart';

/// Extends the [BaseRepository] to implement the API request methods
class UserRepository implements BaseRepository {
  @override
  Future<IPModel> fetchUserIP() async {
    final jsonResponse = await HttpRequestUtil.getRequest(
      Endpoints.fetchIP,
    );

    HttpRequestUtil.handleResponseError(
      jsonResponse,
      'Error fetching User\'s IP',
    );

    return IPModel.fromJson(jsonResponse);
  }

  @override
  Future<CountryInformationModel> fetchUserCountryInformation({
    @required String ipAddress,
  }) async {
    final jsonResponse = await HttpRequestUtil.getRequest(
      '${Endpoints.fetchCurrentCountry}/$ipAddress',
    );

    HttpRequestUtil.handleResponseError(
      jsonResponse,
      'Error fetching Information about User\'s Country',
    );

    return CountryInformationModel.fromJson(jsonResponse);
  }

  @override
  Future<List<Countries>> fetchCountriesList() async {
    // final jsonResponse = await HttpRequestUtil.getRequest(
    //   Endpoints.fetchCountriesList,
    // );

    // HttpRequestUtil.handleResponseError(
    //   jsonResponse,
    //   'Error fetching List of Countries',
    // );

    return CountriesLisitModel.fromJson(jsonDecode(countriesListJSON))
        .countries;
  }

  @override
  Future<HomeResponseModel> fetchHomeData({
    @required String iso2,
  }) async {
    final jsonResponse = await HttpRequestUtil.getRequest(
      '${Endpoints.fetchHomeData}$iso2',
    );

    HttpRequestUtil.handleResponseError(
      jsonResponse,
      'Error fetching Home Data',
    );

    return HomeResponseModel.fromJson(jsonResponse);
  }

  @override
  Future<List<CountryStatistics>> fetchCountryStatistics({String iso2}) async {
    final List<CountryStatistics> countryStatisticsList = [];
    CountryStatistics countryStatistics;

    try {
      final jsonResponse = await http
          .get('${Endpoints.baseUrlStatistics}$iso2/status/confirmed');
      final responseMap = jsonDecode(jsonResponse.body);

      for (int i = 0; i < responseMap.length; i++) {
        countryStatistics = CountryStatistics.fromJson(responseMap[i]);
        countryStatisticsList.add(
          CountryStatistics(
            cases: countryStatistics.cases,
            date: countryStatistics.date,
          ),
        );
      }
    } on FormatException {
      throw NetworkException(
        message: 'API Error',
      );
    } catch (e) {
      throw APIResponseException(
        message: 'Error Fetching List of Countries',
      );
    }

    return countryStatisticsList;
  }
}
