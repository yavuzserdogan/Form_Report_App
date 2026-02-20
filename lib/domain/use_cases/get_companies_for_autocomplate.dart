import '../repositories/company_repository.dart';
import '../entities/company.dart';

class GetCompaniesForAutocomplate {
  final CompanyRepository companyRepository;

  GetCompaniesForAutocomplate(this.companyRepository);

  Future<List<Company>> call(String query) async {
    return companyRepository.getCompanies(query);
  }
}


