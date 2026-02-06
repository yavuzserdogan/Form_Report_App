class ReportFile {
  final int? id;
  final String serialNumber;
  final String filePath;
  final DateTime createdAt;

  ReportFile({
    this.id,
    required this.serialNumber,
    required this.filePath,
    required this.createdAt,
  });
}
