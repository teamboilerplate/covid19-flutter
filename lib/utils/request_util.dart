import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' show md5;
import 'package:flutter/material.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';

/// A class wrapper to house url, body and headers under one name
class RequestWrapper {
  final String url;
  final Map body, headers;

  RequestWrapper({
    @required this.url,
    @required this.body,
    @required this.headers,
  });
}

/// Given a [RequestWrapper] object, generate a unique [md5] hash for
/// Utilises all the parameters of the [RequestWrapper] object
class HttpRequestUtil {
  static String hashRequest(RequestWrapper request) {
    final urlHash = generateHash(request.url);
    // final headerHash = generateHash(sortMap(request.headers).toString());
    final bodyHash = generateHash(sortMap(request.body ?? {}).toString());
    final requestHash = generateHash(urlHash + bodyHash);
    debugPrint("Request Hash :- $requestHash");
    return requestHash;
  }

  /// Given a [map], sorts the keys in the alphabetical order
  static SplayTreeMap sortMap(Map map) {
    return SplayTreeMap.from(map, (a, b) => a.compareTo(b) as int);
  }

  /// Given a [String], generates the [md5] hash for it
  static String generateHash(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  /// Sends a ***HTTP GET*** request to the specified url
  static Future<Map> getRequest(
    String url, {
    Map<String, String> headers = const {},
  }) async {
    debugPrint('getting $url');

    try {
      // Fetch the contens of the fiven URL and decode it
      final response = await http.get(url, headers: headers);
      final responseMap = jsonDecode(response.body);

      debugPrint('HTTP Response :- \n $responseMap');
      return responseMap;
    }
    // Catching the [FormatException] which occurs due to the server not responding
    // with a JSON but rather with some error message
    on FormatException {
      debugPrint('Get Request Format Exception');
      throw 'Server Error. API not deployed [ E_API01 ]';
    }
    // Catching the [SocketException] which occurs due to loss of Internet Connection.
    // Thus throwing the Network Exception
    on SocketException {
      debugPrint('Get Request Socket Exception');
      throw NetworkException(
        message: 'You don’t seem to have an active Internet Connection',
      );
    }
    // Catching any Generic Errors and throwing APIRresponseException to display
    // generic error screen to the user
    catch (e) {
      debugPrint('Error in GET Request :- \n ${e.message}');
      throw APIResponseException(
        message: 'Unknown Exception while GETting',
      );
    }
  }

  /// Handles errors by throwing it up the call stack if the http request to the
  /// server has failed.
  /// Has to be implemented in the future to perform a check if the current API
  /// is functional
  static void handleResponseError(
    Map jsonResponse,
    String customError,
  ) {
    debugPrint('In Handle Response Error + ${jsonResponse.toString()}');
  }
}
