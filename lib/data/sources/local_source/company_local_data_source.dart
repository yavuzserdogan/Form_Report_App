import 'package:dartz/dartz.dart';
import 'package:form_report_app/data/models/company_model.dart';
import '../../../core/errors/failure.dart';

abstract class CompanyLocalDataSource {
  Future<Either<Failure, Unit>> insertCompany(CompanyModel company);

  Future<Either<Failure, List<CompanyModel>>> getCompanies();

  Future<Either<Failure, Unit>> updateCompany(CompanyModel company);

  Future<Either<Failure, Unit>> deleteCompany(int id);
}
