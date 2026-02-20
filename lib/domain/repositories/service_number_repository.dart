import '../entities/service_number.dart';

abstract class ServiceNumberRepository {
  Future<ServiceNumber> getServiceNumber(String query);

  Future<int> createServiceNumber(ServiceNumber serviceNumber);

  Future<void> updateServiceNumber(ServiceNumber serviceNumber);

  Future<void> deleteServiceNumber(int serviceNumberId);
}