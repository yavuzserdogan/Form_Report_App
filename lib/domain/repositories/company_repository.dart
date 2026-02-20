import '../entities/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies(String query);

  Future<int> createCompany(Company company);

  Future<void> updateCompany(Company company);

  Future<void> deleteCompany(int companyId);
}
