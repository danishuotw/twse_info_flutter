import 'package:get_it/get_it.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data - Repository
  injector.registerSingleton<CompanyRepository>(CompanyRepository());
}
