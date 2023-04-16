import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  @override
  List<Object> get props => [message];
}

// General failures

class BadRequestFailure extends Failure {
  const BadRequestFailure({String? message}) : super(message ?? 'Bad request');
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure({String? message})
      : super(message ?? 'Internal Server Error, please try again later.');
}

class ConflictFailure extends Failure {
  const ConflictFailure({String? message})
      : super(message ?? 'Conflict occurred');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({String? message})
      : super(message ?? 'Access denied');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({String? message})
      : super(message ?? 'The requested information could not be found');
}

class OtherFailure extends Failure {
  const OtherFailure({String? message})
      : super(message ?? 'No internet connection detected, please try again.');
}

class NoBalanceFailure extends Failure {
  const NoBalanceFailure({String? message}) : super(message ?? 'No Balance');
}

class DeadlineExceededFailure extends Failure {
  const DeadlineExceededFailure({String? message})
      : super(message ?? 'The connection has timed out, please try again.');
}
