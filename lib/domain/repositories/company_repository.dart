import '../entities/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies();

  Future<void> createCompany(Company company);

  Future<void> updateCompany(Company company);

  Future<void> deleteCompany(int companyId);
}
