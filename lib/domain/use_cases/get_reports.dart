import "../entities/report_document.dart";
import "../repositories/report_repository.dart";
import "../../core/errors/failures.dart";
import "package:dartz/dartz.dart";

class GetReports {
  final ReportRepository reportRepository;

  GetReports(this.reportRepository);

  Future<Either<Failure, List<ReportDocument>>> call(String query) async {
    return await reportRepository.getReport(query);
  }
}
