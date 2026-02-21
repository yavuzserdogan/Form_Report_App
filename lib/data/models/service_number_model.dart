import 'package:form_report_app/domain/entities/service_number.dart';

class ServiceNumberModel extends ServiceNumber {
  ServiceNumberModel({
    super.id,
    required super.machineId,
    required super.serialCode,
  });

  factory ServiceNumberModel.fromJson(Map<String, dynamic> json) {
    return ServiceNumberModel(
      id: json['id'],
      machineId: json['machineId'],
      serialCode: json['serialCode'],
    );
  }

  factory ServiceNumberModel.fromEntity(ServiceNumber serviceNumber) {
    return ServiceNumberModel(
      id: serviceNumber.id,
      machineId: serviceNumber.machineId,
      serialCode: serviceNumber.serialCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'machineId': machineId, 'serialCode': serialCode};
  }
}
