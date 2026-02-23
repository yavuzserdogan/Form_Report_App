import "../repositories/service_number_repository.dart";
import "../entities/service_number.dart";
import "../../core/errors/failure.dart";
import "package:dartz/dartz.dart";

class GetServiceNumberForAutocomplate {
  final ServiceNumberRepository serviceNumberRepository;

  GetServiceNumberForAutocomplate(this.serviceNumberRepository);

  Future<Either<Failure, ServiceNumber>> call(String query) async {
    return serviceNumberRepository.getServiceNumber(query);
  }
}
