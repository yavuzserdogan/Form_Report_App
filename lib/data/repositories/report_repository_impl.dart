import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/error_messages.dart';
import '../../domain/entities/report.dart';
import '../../domain/entities/report_document.dart';
import '../../domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
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
}
