import '../../core/errors/error_messages.dart';
import '../entities/report_document.dart';
import '../../core/services/report_send_service.dart';
import '../../core/errors/network_exception.dart';

class SendReportPdf {
  final ReportSendService reportSendService;

  SendReportPdf(this.reportSendService);

  Future<void> call({
    required ReportDocument document,
    required List<String> emails,
  }) async {
    final online = await reportSendService.isOnline;

    if (online) {
      await reportSendService.sendPdfToEmails(document.filePath, emails);
    } else {
      throw const NetworkException(ErrorMessages.noInternetCannotSend);
    }
  }
}
