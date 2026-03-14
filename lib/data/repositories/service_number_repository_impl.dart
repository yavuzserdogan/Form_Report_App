import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/error_messages.dart';
import '../../data/models/service_number_model.dart';
import '../../data/sources/local_source/service_number_local_data_source.dart';
import '../../domain/entities/service_number.dart';
import '../../domain/repositories/service_number_repository.dart';

class ServiceNumberRepositoryImpl implements ServiceNumberRepository {
  final ServiceNumberLocalDataSource _localDataSource;

  ServiceNumberRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, ServiceNumber>> getServiceNumber(String query) async {
    try {
      final models = await _localDataSource.getServiceNumbers();
      final q = query.trim().toLowerCase();
      final match = q.isEmpty
          ? (models.isNotEmpty ? models.first : null)
          : models
                .where((s) => s.serialCode.toLowerCase().contains(q))
                .firstOrNull;
      if (match == null) {
        return const Left(CacheFailure(ErrorMessages.serviceNumberMatchError));
      }
      return Right(match);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.serviceNumberFetchError));
    }
  }

  @override
  Future<Either<Failure, int>> createServiceNumber(
    ServiceNumber serviceNumber,
  ) async {
    try {
      final model = ServiceNumberModel.fromEntity(serviceNumber);
      final id = await _localDataSource.insertServiceNumber(model);
      return Right(id);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.serviceNumberInsertError));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateServiceNumber(
    ServiceNumber serviceNumber,
  ) async {
    try {
      final model = ServiceNumberModel.fromEntity(serviceNumber);
      if (model.id == null) {
        return const Left(ValidationFailure('Güncelleme için id gerekli.'));
      }
      await _localDataSource.updateServiceNumber(model);
      return const Right(unit);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.serviceNumberUpdateError));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteServiceNumber(int serviceNumberId) async {
    try {
      await _localDataSource.deleteServiceNumber(serviceNumberId);
      return const Right(unit);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.serviceNumberDeleteError));
    }
  }
}
