import 'package:form_report_app/data/models/company_model.dart';

abstract class CompanyLocalDataSource {
  Future<void> insertCompany(CompanyModel company);

  Future<List<CompanyModel>> getCompanies();

  Future<void> updateCompany(CompanyModel company);

  Future<void> deleteCompany(int id);
}