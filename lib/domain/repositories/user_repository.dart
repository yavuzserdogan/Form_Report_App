import '../entities/user.dart';
import '../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, int>> createUser(User user);
}
