import '../repositories/company_repository.dart';
import '../entities/company.dart';
import '../errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetCompaniesForAutocomplate {
  final CompanyRepository companyRepository;

  GetCompaniesForAutocomplate(this.companyRepository);

  Future<Either<Failure, List<Company>>> call(String query) async {
    return companyRepository.getCompanies(query);
  }
}
