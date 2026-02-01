class ReportEntity {
  final String companyName;
  final String machineName;
  final String serialNumber;
  final String reasonForVisit;
  final String faultType;
  final String serviceType;
  final String workingHours;
  final String materialsUsed;
  final String workPerformed;
  final String pricing;
  final String companyRepresentative;
  final String email;

  ReportEntity({
    required this.companyName,
    required this.machineName,
    required this.serialNumber,
    required this.reasonForVisit,
    required this.faultType,
    required this.serviceType,
    required this.workingHours,
    required this.materialsUsed,
    required this.workPerformed,
    required this.pricing,
    required this.companyRepresentative,
    required this.email,
  });
}
