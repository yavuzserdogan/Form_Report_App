abstract class ReportSendService {
  Future<bool> get isOnline;

  Future<void> sendPdfToEmails(String filePath, List<String> emails);
}