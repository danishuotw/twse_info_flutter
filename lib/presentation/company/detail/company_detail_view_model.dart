import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';

class CompanyDetailViewModel extends ChangeNotifier {
  final CompanyRepository _companyRepository = injector<CompanyRepository>();

  final String id;

  CompanyDto? dto;

  ViewState<CompanyDto> viewState = ViewState(state: ResponseState.EMPTY);

  CompanyDetailViewModel({required this.id});

  void _setViewState(ViewState<CompanyDto> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  void fetchData() async {
    _setViewState(ViewState.loading());
    final company = await _companyRepository.getCompany(id);
    if (company is DataSuccess) {
      final data = company.data;
      _setViewState(ViewState.complete(data!));
    }
    if (company is DataFailed) {
      final error = company.error;
      if (kDebugMode) print(error);
      _setViewState(ViewState.error(error.toString()));
    }
  }
}
