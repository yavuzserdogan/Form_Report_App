abstract class ReportAnswersLocalDataSource {
  Future<int> insert({
    required String pdfFileName,
    required String answersJson,
    required DateTime createdAt,
  });
}
