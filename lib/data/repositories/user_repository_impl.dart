import 'package:dartz/dartz.dart';
import '../../domain/errors/failures.dart';
import '../../core/errors/error_messages.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    return const Left(CacheFailure(ErrorMessages.userImplemementError));
  }

  @override
  Future<Either<Failure, int>> createUser(User user) async {
    return const Left(CacheFailure(ErrorMessages.userCreateError));
  }
}
