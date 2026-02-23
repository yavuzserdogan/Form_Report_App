import '../../core/errors/error_messages.dart';
import '../entities/report.dart';
import '../repositories/report_repository.dart';
import '../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class SaveReport {
  final ReportRepository reportRepository;

  SaveReport(this.reportRepository);

  Future<Either<Failure, int>> call(Report report) async {
    if (report.customerSignaturePath == null) {
      return Left(ValidationFailure(ErrorMessages.reportWithoutSignature));
    }

    final serialCode = report.serviceNumber.serialCode;
    final date = report.createdAt;
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    final pdfFileName = '${serialCode}_${day}_${month}_$year.pdf';

    return reportRepository.saveReport(report, pdfFileName);
  }
}
