class ReportDocument {
  final int? id;
  final String serialNumber;
  final String filePath;
  final DateTime createdAt;

  ReportDocument({
    this.id,
    required this.serialNumber,
    required this.filePath,
    required this.createdAt,
  });
}
