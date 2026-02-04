import 'company.dart';
import 'machine.dart';
import 'service_number.dart';
import 'material_item.dart';
import 'work_session.dart';
import 'pricing.dart';
import 'user.dart';
import '../enums/visit_reason.dart';
import '../enums/fault_type.dart';
import '../enums/service_type.dart';

class Report {
  final int? id;

  final User technician;

  final Company company;
  final Machine machine;
  final ServiceNumber serviceNumber;

  final VisitReason visitReason;
  final FaultType faultType;
  final ServiceType serviceType;

  final List<WorkSession> workSessions;
  final List<MaterialItem> materials;

  final String jobDescription;

  final Pricing pricing;

  final String companyRepresentative;
  final List<String> emails;

  final DateTime createdAt;

  const Report({
    this.id,
    required this.technician,
    required this.company,
    required this.machine,
    required this.serviceNumber,
    required this.visitReason,
    required this.faultType,
    required this.serviceType,
    required this.workSessions,
    required this.materials,
    required this.pricing,
    required this.jobDescription,
    required this.companyRepresentative,
    required this.emails,
    required this.createdAt,
  });
}
