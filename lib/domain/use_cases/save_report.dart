import '../entities/report.dart';
import '../entities/report_form_answers.dart';
import '../repositories/report_repository.dart';
import '../errors/failures.dart';
import 'package:dartz/dartz.dart';

class SaveReport {
  final ReportRepository reportRepository;

  SaveReport(this.reportRepository);

  Future<Either<Failure, int>> call(Report report) async {
    if (report.customerSignaturePath == null) {
      return Left(const ValidationFailure(ValidationFailureCode.reportWithoutSignature));
    }

    final serialCode = report.serviceNumber.serialCode;
    final date = report.createdAt;
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    final pdfFileName = '${serialCode}_${day}_${month}_$year.pdf';

    final answers = ReportFormAnswers.fromReport(report);
    return reportRepository.saveReportAnswers(answers, pdfFileName);
  }
}
