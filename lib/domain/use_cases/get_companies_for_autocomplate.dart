import '../repositories/company_repository.dart';
import '../entities/company.dart';

class GetCompaniesForAutocomplate {
  final CompanyRepository companyRepository;

  GetCompaniesForAutocomplate({required this.companyRepository});

  Future<List<Company>> call(String query) async {
    final companies = await companyRepository.getCompanies(query);

    if (query.isEmpty) {
      return companies;
    }

    final lowerCaseQuery = query.toLowerCase();

    return companies.where((company) {
      return company.name.toLowerCase().contains(lowerCaseQuery);
    }).toList();
  }
}
