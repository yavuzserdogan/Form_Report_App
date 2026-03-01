import 'package:form_report_app/data/models/service_number_model.dart';

abstract class ServiceNumberLocalDataSource {
  Future<void> insertServiceNumber(ServiceNumberModel serviceNumber);

  Future<List<ServiceNumberModel>> getServiceNumbers();

  Future<void> updateServiceNumber(ServiceNumberModel serviceNumber);

  Future<void> deleteServiceNumber(int id);
}
