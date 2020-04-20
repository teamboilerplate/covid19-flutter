import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:covid19/utils/cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' show md5;
import 'package:flutter/material.dart';
import 'package:covid19/data/network/exceptions/network_exceptions.dart';

/// A class wrapper to house url and body under one name
class RequestWrapper {
  final String url;
  final Map body;

  RequestWrapper({
    @required this.url,
    @required this.body,
  });
}

/// Given a [RequestWrapper] object, generate a unique [md5] hash for
/// Utilises all the parameters of the [RequestWrapper] object
class HttpRequestUtil {
  static String hashRequest(RequestWrapper request) {
    final urlHash = generateHash(request.url);
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
  /// Dynamic is used to support different types of JSON responses
  /// Maps and Arrays in the case of the current situation of use
  static dynamic getRequest({
    String url,
    bool shouldCache = false,
  }) async {
    debugPrint('getting $url');

    try {
      // Fetch the contens of the fiven URL and decode it
      final jsonResponse = await http.get(url);
      final responseMap = jsonDecode(jsonResponse.body);

      if (shouldCache) {
        await CacheManager().downloadFile(url, force: true);
      }

      // debugPrint('HTTP Response :- \n $responseMap');
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
      return handleSocketException(
        url: url,
        shouldCache: shouldCache,
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

  /// Handle [SocketException]. Try and retrieve cached responses
  /// if [shouldCache] is set to true
  static dynamic handleSocketException({
    String url,
    bool shouldCache,
  }) async {
    if (!shouldCache) {
      throw NetworkException(
        message: 'You don’t seem to have an active Internet Connection',
      );
    }
    // debugPrint('URL is $url');
    try {
      final cacheFileIInfo = await CacheManager().getFileFromCache(url);
      debugPrint('${cacheFileIInfo.file}');
      final cacheFile = await cacheFileIInfo.file.readAsString();
      final cache = jsonDecode(cacheFile);
      return cache;
    } catch (e) {
      debugPrint('Cache Request Network Exception $e');
      throw NetworkException(
        message: 'You don’t seem to have an active Internet Connection',
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
    // debugPrint('In Handle Response Error + ${jsonResponse.toString()}');
  }
}
