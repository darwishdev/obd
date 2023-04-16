import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  BadRequestException({required super.requestOptions, super.error});

  @override
  String toString() {
    return error?.toString() ?? 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException({required super.requestOptions, super.error});

  @override
  String toString() {
    return error?.toString() ??
        'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException({required super.requestOptions, super.error});
  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException({required super.requestOptions, super.error});
  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException({required super.requestOptions, super.error});
  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class OtherException extends DioError {
  OtherException({required super.requestOptions, super.error});

  @override
  String toString() {
    return error?.toString() ??
        'No internet connection detected, please try again...';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException({required super.requestOptions, super.error});

  @override
  String toString() {
    return error?.toString() ??
        'The connection has timed out, please try again.';
  }
}
