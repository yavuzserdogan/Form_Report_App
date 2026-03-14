import 'package:dartz/dartz.dart';
import 'package:form_report_app/core/errors/failures.dart';
import 'package:form_report_app/domain/entities/user.dart';
import 'package:form_report_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    return const Left(
      CacheFailure('Mevcut kullanıcı henüz implemente edilmedi.'),
    );
  }

  @override
  Future<Either<Failure, int>> createUser(User user) async {
    return const Left(
      CacheFailure('Kullanıcı oluşturma henüz implemente edilmedi.'),
    );
  }
}
