abstract class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

enum ValidationFailureCode {
  reportWithoutSignature,
  noInternetCannotSend,
}

class ValidationFailure extends Failure {
  final ValidationFailureCode? code;
  const ValidationFailure(this.code) : super('');
  const ValidationFailure.withMessage(super.message) : code = null;
}
