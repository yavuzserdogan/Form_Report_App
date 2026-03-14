import '../entities/report_document.dart';
import '../repositories/report_repository.dart';
import '../errors/failures.dart';
import 'package:dartz/dartz.dart';

class SendReportPdf {
  final ReportRepository reportRepository;

  SendReportPdf(this.reportRepository);

  Future<Either<Failure, Unit>> call({
    required ReportDocument document,
    required List<String> emails,
  }) async {
    return reportRepository.sendReport(document, emails);
  }
}
