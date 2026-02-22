import 'package:sqflite/sqflite.dart';
import 'package:form_report_app/data/models/company_model.dart';
import 'company_local_data_source.dart';

const String tableCompanies = 'companies';

class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final Database database;

  CompanyLocalDataSourceImpl({required this.database});

  @override
  Future<void> insertCompany(CompanyModel company) async {
    try {
      await database.insert(
        tableCompanies,
        company.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace, 
      );
    } catch (e) {
      throw Exception('Şirket eklenirken bir hata oluştu: $e');
    }
  }

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query(tableCompanies);
      return List.generate(maps.length, (i) {
        return CompanyModel.fromJson(maps[i]);
      });
    } catch (e) {
      throw Exception('Şirketler listelenirken bir hata oluştu: $e');
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
    } catch (e) {
      throw Exception('Şirket güncellenirken bir hata oluştu: $e');
    }
  }

  @override
  Future<void> deleteCompany(int id) async {
    try {
      await database.delete(
        tableCompanies,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Şirket silinirken bir hata oluştu: $e');
    }
  }
}