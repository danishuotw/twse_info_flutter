// IMPORTS OMITTED FOR BREVITY
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';

import 'company_repo_test.mocks.dart';

class CompanyRepoTest extends Mock implements CompanyRepository {}

@GenerateMocks([CompanyRepoTest])
Future<void> main() async {
  late MockCompanyRepoTest companyRepo;

  setUpAll(() {
    companyRepo = MockCompanyRepoTest();
  });

  test('test getCompany DataSuccess', () async {
    const stubId = 'id';
    final data = DataSuccess<CompanyDto>(CompanyDto());

    when(companyRepo.getCompany(stubId)).thenAnswer((_) async {
      return data;
    });

    final res = await companyRepo.getCompany(stubId);
    expect(res, isA<DataSuccess>());
    expect(res.data, isA<CompanyDto>());
    expect(res, data);
  });

  test('test getCompany DataFailed', () async {
    const stubId = 'id';
    const data = DataFailed<CompanyDto>('error');

    when(companyRepo.getCompany(stubId)).thenAnswer((_) async {
      return data;
    });

    final res = await companyRepo.getCompany(stubId);
    expect(res, isA<DataFailed>());
  });
}
