import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const String _dbName = 'form_report.db';
  static Database? _database;

  static const String tableCompanies = 'companies';
  static const String tableMachines = 'machines';
  static const String tableServiceNumbers = 'service_numbers';
  static const String tableReportFormAnswers = 'report_form_answers';

  static const int _dbVersion = 2;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }

  static Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = dbPath.endsWith('/') ? '$dbPath$_dbName' : '$dbPath/$_dbName';
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  static Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _createReportFormAnswersTable(db);
    }
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCompanies (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE $tableMachines (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        companyId INTEGER NOT NULL,
        name TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE $tableServiceNumbers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        machineId INTEGER NOT NULL,
        serialCode TEXT NOT NULL
      )
    ''');
    await _createReportFormAnswersTable(db);
  }

  static Future<void> _createReportFormAnswersTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableReportFormAnswers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pdf_file_name TEXT NOT NULL,
        answers_json TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }
}
