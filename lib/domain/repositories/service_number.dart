import '../entities/service_number.dart';

abstract class ServiceNumberRepository {
  Future<List<ServiceNumber>> getServiceNumber(int machineId);

  Future<void> createServiceNumber(ServiceNumber serviceNumber);

  Future<void> updateServiceNumber(ServiceNumber serviceNumber);

  Future<void> deleteServiceNumber(int serviceNumberId);
}