/// Rapor PDF gönderimi için domain port'u.
/// Implementasyonu data veya presentation katmanında yapılır.
abstract class ReportSendService {
  Future<bool> get isOnline;

  Future<void> sendPdfToEmails(String filePath, List<String> emails);
}
