import '../entities/report.dart';
import '../entities/report_document.dart';

abstract class ReportRepository {
  Future<int> saveReport(Report report, String pdfFileName);

  Future<List<ReportDocument>> getReport(String query);

  Future<void> deleteReport(int reportId);
}
