import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../core/services/network_info.dart';
import '../../domain/errors/failures.dart';
import '../../core/errors/error_messages.dart';
import '../../core/errors/exceptions.dart';
import '../../domain/entities/report_document.dart';
import '../../domain/entities/report_form_answers.dart';
import '../../domain/repositories/report_repository.dart';
import '../models/report_form_answers_model.dart';
import '../sources/local_source/report_answers_local_data_source.dart';

class ReportRepositoryImpl implements ReportRepository {
  final NetworkInfo _networkInfo;
  final ReportRepository _reportRepository;
  final ReportAnswersLocalDataSource _answersLocal;

  ReportRepositoryImpl(
    this._networkInfo,
    this._reportRepository,
    this._answersLocal,
  );

  @override
  Future<Either<Failure, int>> saveReportAnswers(
    ReportFormAnswers answers,
    String pdfFileName,
  ) async {
    try {
      final json = jsonEncode(
        ReportFormAnswersModel.fromEntity(answers).toJson(),
      );
      final id = await _answersLocal.insert(
        pdfFileName: pdfFileName,
        answersJson: json,
        createdAt: answers.createdAt,
      );
      return Right(id);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.reportSaveError));
    }
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
    final online = await _networkInfo.isConnected;
    if (!online) {
      return Left(
        const ValidationFailure(ValidationFailureCode.noInternetCannotSend),
      );
    }
    try {
      await _reportRepository.sendReport(document, emails);
      return const Right(unit);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
