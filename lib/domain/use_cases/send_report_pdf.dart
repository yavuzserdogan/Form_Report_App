import '../../core/errors/error_messages.dart';
import '../entities/report_document.dart';
import '../../core/services/report_send_service.dart';
import '../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class SendReportPdf {
  final ReportSendService reportSendService;

  SendReportPdf(this.reportSendService);

  Future<Either<Failure, Unit>> call({
    required ReportDocument document,
    required List<String> emails,
  }) async {
    final online = await reportSendService.isOnline;

    if (!online) {
      return Left(NetworkFailure(ErrorMessages.noInternetCannotSend));
    }

    try {
      await reportSendService.sendPdfToEmails(document.filePath, emails);

      return const Right(unit);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
