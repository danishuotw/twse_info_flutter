import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/domain/favourite/add_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/delete_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/get_favourite.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_view_model.dart';

import '../repo/company_repo_test.mocks.dart';
import 'company_detail_view_model_test.mocks.dart';

class GetFavouriteTest extends Mock implements UseCase<CompanyDto?, GetFavouriteParams> {}

class AddFavouriteTest extends Mock implements UseCase<int, AddFavouriteParams> {}

class DeleteFavouriteTest extends Mock implements UseCase<int, DeleteFavouriteParams> {}

@GenerateMocks([GetFavouriteTest])
@GenerateMocks([AddFavouriteTest])
@GenerateMocks([DeleteFavouriteTest])
Future<void> main() async {
  late String stubId;
  late MockCompanyRepoTest companyRepo;
  late CompanyDetailViewModel viewModel;
  late MockGetFavouriteTest? getFavourite;
  late MockAddFavouriteTest? addFavourite;
  late MockDeleteFavouriteTest? deleteFavourite;

  setUpAll(() {
    stubId = 'id';
    companyRepo = MockCompanyRepoTest();
    getFavourite = MockGetFavouriteTest();
    addFavourite = MockAddFavouriteTest();
    deleteFavourite = MockDeleteFavouriteTest();

    viewModel = CompanyDetailViewModel(
      id: stubId,
      companyRepository: companyRepo,
      getFavourite: getFavourite,
      addFavourite: addFavourite,
      deleteFavourite: deleteFavourite,
    );
  });

  test('test getCompany', () async {
    final stubData = DataSuccess<CompanyDto>(CompanyDto());
    when(companyRepo.getCompany(stubId)).thenAnswer((_) async {
      return stubData;
    });
    await viewModel.fetchData();
    expect(viewModel.dto, stubData.data);
  });

  test('test getCompany for repository', () async {
    final stubData = DataSuccess<CompanyDto>(CompanyDto());
    when(companyRepo.getCompany(stubId)).thenAnswer((_) async {
      return stubData;
    });

    final res = await companyRepo.getCompany(stubId);
    viewModel.dto = res.data;
    expect(viewModel.dto, stubData.data);
  });
}
