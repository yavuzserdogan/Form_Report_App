import 'material_item.dart';
import 'pricing.dart';
import 'work_session.dart';
import '../enums/fault_type.dart';
import '../enums/service_type.dart';
import '../enums/visit_reason.dart';
import 'report.dart';

/// Formda seçilen / girilen cevaplar (PDF veya imza / e-posta içermez).
class ReportFormAnswers {
  final String companyName;
  final String machineName;
  final String serialCode;

  final VisitReason visitReason;
  final FaultType faultType;
  final ServiceType serviceType;

  final List<WorkSession> workSessions;
  final List<MaterialItem> materials;

  final String jobDescription;
  final Pricing pricing;
  final String companyRepresentative;

  final DateTime createdAt;

  const ReportFormAnswers({
    required this.companyName,
    required this.machineName,
    required this.serialCode,
    required this.visitReason,
    required this.faultType,
    required this.serviceType,
    required this.workSessions,
    required this.materials,
    required this.jobDescription,
    required this.pricing,
    required this.companyRepresentative,
    required this.createdAt,
  });

  factory ReportFormAnswers.fromReport(Report report) {
    return ReportFormAnswers(
      companyName: report.company.name,
      machineName: report.machine.name,
      serialCode: report.serviceNumber.serialCode,
      visitReason: report.visitReason,
      faultType: report.faultType,
      serviceType: report.serviceType,
      workSessions: report.workSessions,
      materials: report.materials,
      jobDescription: report.jobDescription,
      pricing: report.pricing,
      companyRepresentative: report.companyRepresentative,
      createdAt: report.createdAt,
    );
  }
}
