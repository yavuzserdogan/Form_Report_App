import '../entities/report.dart';
import '../entities/report_document.dart';

abstract class ReportRepository {
  Future<int> saveReport(Report report);

  Future<List<ReportDocument>> getReportById(String id);

  Future<void> deleteReport(int reportId);
}
