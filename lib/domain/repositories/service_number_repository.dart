import '../entities/service_number.dart';
import '../errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ServiceNumberRepository {
  Future<Either<Failure, ServiceNumber>> getServiceNumber(String query);

  Future<Either<Failure, int>> createServiceNumber(ServiceNumber serviceNumber);

  Future<Either<Failure, Unit>> updateServiceNumber(
    ServiceNumber serviceNumber,
  );

  Future<Either<Failure, Unit>> deleteServiceNumber(int serviceNumberId);
}
