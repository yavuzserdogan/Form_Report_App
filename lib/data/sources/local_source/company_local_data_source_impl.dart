import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:form_report_app/data/models/company_model.dart';
import 'company_local_data_source.dart';
import '../../../core/errors/error_messages.dart';
import '../../../core/errors/failure.dart';

const String tableCompanies = 'companies';

class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final Database database;

  CompanyLocalDataSourceImpl({required this.database});

  @override
  Future<Either<Failure, Unit>> insertCompany(CompanyModel company) async {
    try {
      await database.insert(
        tableCompanies,
        company.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(ErrorMessages.companyInsertError));
    }
  }

  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query(
        tableCompanies,
      );
      return Right(
        List.generate(maps.length, (i) {
          return CompanyModel.fromJson(maps[i]);
        }),
      );
    } catch (e) {
      return Left(CacheFailure(ErrorMessages.companyFetchError));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCompany(CompanyModel company) async {
    try {
      await database.update(
        tableCompanies,
        company.toJson(),
        where: 'id = ?',
        whereArgs: [company.id],
      );
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(ErrorMessages.companyUpdateError));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCompany(int id) async {
    try {
      await database.delete(tableCompanies, where: 'id = ?', whereArgs: [id]);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(ErrorMessages.companyDeleteError));
    }
  }
}
