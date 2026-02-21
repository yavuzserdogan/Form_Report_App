import "package:form_report_app/domain/entities/machine.dart";

class MachineModel extends Machine {
  MachineModel({super.id, required super.companyId, required super.name});

  factory MachineModel.fromJson(Map<String, dynamic> json) {
    return MachineModel(
      id: json['id'],
      companyId: json['companyId'],
      name: json['name'],
    );
  }

  factory MachineModel.fromEntity(Machine machine) {
    return MachineModel(
      id: machine.id,
      companyId: machine.companyId,
      name: machine.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'companyId': companyId, 'name': name};
  }
}
