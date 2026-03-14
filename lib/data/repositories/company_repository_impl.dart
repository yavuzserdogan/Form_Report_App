import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/error_messages.dart';
import '../../domain/errors/failures.dart';
import '../../data/models/company_model.dart';
import '../../data/sources/local_source/company_local_data_source.dart';
import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyLocalDataSource _localDataSource;

  CompanyRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Company>>> getCompanies(String query) async {
    try {
      final models = await _localDataSource.getCompanies();
      final filtered = query.trim().isEmpty
          ? models
          : models
                .where(
                  (c) =>
                      c.name.toLowerCase().contains(query.trim().toLowerCase()),
                )
                .toList();
      return Right(filtered);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.companyFetchError));
    }
  }

  @override
  Future<Either<Failure, int>> createCompany(Company company) async {
    try {
      final model = CompanyModel.fromEntity(company);
      final id = await _localDataSource.insertCompany(model);
      return Right(id);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.companyInsertError));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCompany(Company company) async {
    try {
      final model = CompanyModel.fromEntity(company);
      if (model.id == null) {
        return const Left(ValidationFailure.withMessage(ErrorMessages.companyUpdateError));
      }
      await _localDataSource.updateCompany(model);
      return const Right(unit);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.companyUpdateError));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCompany(int companyId) async {
    try {
      await _localDataSource.deleteCompany(companyId);
      return const Right(unit);
    } on CacheException {
      return const Left(CacheFailure(ErrorMessages.companyDeleteError));
    }
  }
}
