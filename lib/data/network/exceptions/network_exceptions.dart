import 'package:flutter/material.dart';

/// Handle's exceptions occured during Network Calls (`API Requests`)
/// Implements the Exception class to throw various exceptions during
/// tests and development.
///
/// Can be extended to add more parameters if and when required to extend
/// the functionality and increase calrity of [Exception]
class NetworkException implements Exception {
  String message;

  NetworkException({
    @required this.message,
  });
}

/// Network Exception when the API Request Fails
class APIResponseException extends NetworkException {
  APIResponseException({
    @required message,
  }) : super(message: message);
}
