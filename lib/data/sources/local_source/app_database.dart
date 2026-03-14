import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const String _dbName = 'form_report.db';
  static Database? _database;

  static const String tableCompanies = 'companies';
  static const String tableMachines = 'machines';
  static const String tableServiceNumbers = 'service_numbers';

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
      version: 1,
      onCreate: _onCreate,
    );
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
  }
}
