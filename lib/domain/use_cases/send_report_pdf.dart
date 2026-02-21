import '../../core/errors/error_messages.dart';
import '../entities/report_document.dart';
import '../../core/services/report_send_service.dart';

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
      throw Exception(ErrorMessages.noInternetCannotSend);
    }
  }
}
