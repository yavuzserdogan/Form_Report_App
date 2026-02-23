import '../entities/company.dart';
import '../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<Company>>> getCompanies(String query);

  Future<Either<Failure, int>> createCompany(Company company);

  Future<Either<Failure, Unit>> updateCompany(Company company);

  Future<Either<Failure, Unit>> deleteCompany(int companyId);
}
