import "../repositories/service_number_repository.dart";
import "../entities/service_number.dart";

class GetServiceNumberForAutocomplate {
  final ServiceNumberRepository serviceNumberRepository;

  GetServiceNumberForAutocomplate(this.serviceNumberRepository);

  Future<ServiceNumber> call(String query) async {
    return serviceNumberRepository.getServiceNumber(query);
  }
}
