import 'package:form_report_app/domain/entities/report_document.dart';

class ReportDocumentModel extends ReportDocument {
  ReportDocumentModel({
    super.id,
    required super.serialNumber,
    required super.filePath,
    required super.createdAt,
  });

  factory ReportDocumentModel.fromJson(Map<String, dynamic> json) {
    return ReportDocumentModel(
      id: json['id'],
      serialNumber: json['serial_number'],
      filePath: json['file_path'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  factory ReportDocumentModel.fromEntity(ReportDocument entity) {
    return ReportDocumentModel(
      id: entity.id,
      serialNumber: entity.serialNumber,
      filePath: entity.filePath,
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serial_number': serialNumber,
      'file_path': filePath,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
