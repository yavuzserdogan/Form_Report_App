import 'package:sqflite/sqflite.dart';
import 'package:form_report_app/core/errors/exceptions.dart';
import 'package:form_report_app/data/sources/local_source/app_database.dart';
import 'report_answers_local_data_source.dart';

class ReportAnswersLocalDataSourceImpl implements ReportAnswersLocalDataSource {
  final Database database;

  ReportAnswersLocalDataSourceImpl({required this.database});

  @override
  Future<int> insert({
    required String pdfFileName,
    required String answersJson,
    required DateTime createdAt,
  }) async {
    try {
      return await database.insert(
        AppDatabase.tableReportFormAnswers,
        {
          'pdf_file_name': pdfFileName,
          'answers_json': answersJson,
          'created_at': createdAt.toIso8601String(),
        },
      );
    } on DatabaseException {
      throw CacheException();
    }
  }
}
