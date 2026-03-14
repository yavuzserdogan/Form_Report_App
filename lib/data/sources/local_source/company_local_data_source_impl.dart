import 'package:sqflite/sqflite.dart';
import 'package:form_report_app/data/models/company_model.dart';
import 'company_local_data_source.dart';
import '../../../core/errors/exceptions.dart';

const String tableCompanies = 'companies';

class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final Database database;

  CompanyLocalDataSourceImpl({required this.database});

  @override
  Future<int> insertCompany(CompanyModel company) async {
    try {
      return await database.insert(
        tableCompanies,
        company.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query(
        tableCompanies,
      );

      return List.generate(maps.length, (i) => CompanyModel.fromJson(maps[i]));
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<void> updateCompany(CompanyModel company) async {
    try {
      await database.update(
        tableCompanies,
        company.toJson(),
        where: 'id = ?',
        whereArgs: [company.id],
      );
    } on DatabaseException {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteCompany(int id) async {
    try {
      await database.delete(tableCompanies, where: 'id = ?', whereArgs: [id]);
    } on DatabaseException {
      throw CacheException();
    }
  }
}
