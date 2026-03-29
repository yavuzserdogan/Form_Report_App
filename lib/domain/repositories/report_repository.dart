import '../entities/report_document.dart';
import '../entities/report_form_answers.dart';
import '../errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ReportRepository {
  Future<Either<Failure, int>> saveReportAnswers(
    ReportFormAnswers answers,
    String pdfFileName,
  );

  Future<Either<Failure, List<ReportDocument>>> getReport(String query);

  Future<Either<Failure, Unit>> deleteReport(int reportId);

  Future<Either<Failure, Unit>> sendReport(ReportDocument document, List<String> emails);
}
