import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          e.response?.statusCode,
          e.response,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.transformTimeout:
        return ServerFailure('There was an error processing the request');
      case DioExceptionType.unknown:
        return ServerFailure('Oops, there was an error. Please try again');
    }
  }

  factory ServerFailure.fromBadResponse(int? statusCode, Response? response) {
    try {
      if (statusCode == 404) {
        return ServerFailure('Your request was not found, please try later');
      } else if (statusCode == 500) {
        return ServerFailure(
          'There is a problem with the server, please try later',
        );
      } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        final message = response?.data?['error']?['message'] ?? 'Unknown error';
        return ServerFailure(message);
      } else {
        return ServerFailure('There was an error, please try again');
      }
    } catch (e) {
      return ServerFailure('Unexpected error format');
    }
  }
}

abstract class Failure {
  final String message;
  Failure(this.message);
}
