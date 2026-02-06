import '../entities/report.dart';
import '../entities/report_document.dart';

abstract class ReportRepository {
  Future<void> saveReport(Report report);

  Future<List<ReportFile>> getReports(String fileName);

  Future<void> deleteReport(int reportId);
}
