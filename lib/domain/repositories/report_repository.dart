import '../entities/report.dart';
import '../entities/report_document.dart';

abstract class ReportRepository {
  Future<String> generateAndSavePDF(Report report);

  Future<void> saveReportFilePath(ReportFileEntity reportFile);

  Future<List<ReportFileEntity>> getAllReportFiles();
}
