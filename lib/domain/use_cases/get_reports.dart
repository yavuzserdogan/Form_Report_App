import "../entities/report_document.dart";
import "../repositories/report_repository.dart";

class GetReports {
  final ReportRepository reportRepository;

  GetReports(this.reportRepository);

  Future<List<ReportDocument>> call(String query) async {
    return await reportRepository.getReport(query);
  }
}
