import 'package:dartz/dartz.dart';
import '../../domain/errors/failures.dart';
import '../../domain/services/report_send_service.dart';
import '../../core/errors/error_messages.dart';
import '../../domain/entities/report.dart';
import '../../domain/entities/report_document.dart';
import '../../domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportSendService _reportSendService;

  ReportRepositoryImpl(this._reportSendService);

  @override
  Future<Either<Failure, int>> saveReport(
    Report report,
    String pdfFileName,
  ) async {
    return const Left(CacheFailure(ErrorMessages.reportSaveError));
  }

  @override
  Future<Either<Failure, List<ReportDocument>>> getReport(String query) async {
    return const Left(CacheFailure(ErrorMessages.reportFetchError));
  }

  @override
  Future<Either<Failure, Unit>> deleteReport(int reportId) async {
    return const Left(CacheFailure(ErrorMessages.reportDeleteError));
  }

  @override
  Future<Either<Failure, Unit>> sendReport(
    ReportDocument document,
    List<String> emails,
  ) async {
    final online = await _reportSendService.isOnline;
    if (!online) {
      return Left(const ValidationFailure(ValidationFailureCode.noInternetCannotSend));
    }
    try {
      await _reportSendService.sendPdfToEmails(document.filePath, emails);
      return const Right(unit);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
