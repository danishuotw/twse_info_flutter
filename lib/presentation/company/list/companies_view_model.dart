import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';

class CompaniesViewModel extends ChangeNotifier {
  final CompanyRepository _companyRepository = injector<CompanyRepository>();

  final String id;

  ViewState<List<CompanyModel>> viewState = ViewState(state: ResponseState.EMPTY);

  CompaniesViewModel({required this.id});

  void _setViewState(ViewState<List<CompanyModel>> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  void fetchData() async {
    _setViewState(ViewState.loading());
    final companies = await _companyRepository.fetchData();
    if (companies is DataSuccess) {
      final list = companies.data?[id] ?? List.empty();
      _setViewState(ViewState.complete(list));
    }
    if (companies is DataFailed) {
      final error = companies.error;
      if (kDebugMode) print(error);
      _setViewState(ViewState.error(error.toString()));
    }
  }
}
