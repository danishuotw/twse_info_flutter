import 'package:twse_info_flutter/data/model/company_model.dart';

abstract class CompanyRepository {
  Future<List<CompanyModel>> fetchData();

  factory CompanyRepository() => _CompanyRepository();
}

class _CompanyRepository implements CompanyRepository {
  @override
  Future<List<CompanyModel>> fetchData() {
    throw Error();
  }
}
