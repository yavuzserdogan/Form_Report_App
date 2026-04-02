import 'package:form_report_app/domain/entities/report_form_answers.dart';

class ReportFormAnswersModel extends ReportFormAnswers {
  const ReportFormAnswersModel({
    required super.companyName,
    required super.machineName,
    required super.serialCode,
    required super.visitReason,
    required super.faultType,
    required super.serviceType,
    required super.workSessions,
    required super.materials,
    required super.jobDescription,
    required super.pricing,
    required super.companyRepresentative,
    required super.createdAt,
  });

  factory ReportFormAnswersModel.fromEntity(ReportFormAnswers answers) {
    return ReportFormAnswersModel(
      companyName: answers.companyName,
      machineName: answers.machineName,
      serialCode: answers.serialCode,
      visitReason: answers.visitReason,
      faultType: answers.faultType,
      serviceType: answers.serviceType,
      workSessions: answers.workSessions,
      materials: answers.materials,
      jobDescription: answers.jobDescription,
      pricing: answers.pricing,
      companyRepresentative: answers.companyRepresentative,
      createdAt: answers.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'machineName': machineName,
      'serialCode': serialCode,
      'visitReason': visitReason.name,
      'faultType': faultType.name,
      'serviceType': serviceType.name,
      'workSessions': workSessions
          .map(
            (w) => {
              'date': w.date.toIso8601String(),
              'startTime': w.startTime.toIso8601String(),
              'endTime': w.endTime.toIso8601String(),
              'travelDurationSeconds': w.travelDuration.inSeconds,
            },
          )
          .toList(),
      'materials': materials
          .map(
            (m) => {
              'partName': m.partName,
              'partNumber': m.partNumber,
              'partQuantity': m.partQuantity,
              'partPrice': m.partPrice,
              'currency': m.currency.name,
            },
          )
          .toList(),
      'jobDescription': jobDescription,
      'pricing': {
        'laborUnitPrice': pricing.laborUnitPrice,
        'laborCurrency': pricing.laborCurrency.name,
        'transportUnitPrice': pricing.transportUnitPrice,
        'transportCurrency': pricing.transportCurrency.name,
      },
      'companyRepresentative': companyRepresentative,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
