import 'package:form_report_app/domain/entities/company.dart';

import '../repositories/inventory_repository.dart';

class GetCompaniesUseCase {
  final InventoryRepository repository;

  GetCompaniesUseCase(this.repository);

  Future<List<Company>> execute(int companyId) async {
    return await repository.getCompanies(companyId);
  }
}
