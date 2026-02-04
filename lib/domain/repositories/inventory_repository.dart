import '../entities/company.dart';

abstract class InventoryRepository {
  Future<List<Company>> getCompanies(int companyId);

  Future<void> addCompany(Company company);
}
