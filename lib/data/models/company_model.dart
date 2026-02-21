import 'package:form_report_app/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({super.id, required super.name});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(id: json['id'], name: json['name']);
  }

  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(id: company.id, name: company.name);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
