import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';

class IndustriesViewModel extends ChangeNotifier {
  final CompanyRepository _companyRepository = injector<CompanyRepository>();

  ViewState viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  void fetchData() async {
    _setViewState(ViewState.loading());
    final companies = await _companyRepository.fetchData();
    if (companies is DataSuccess) {
      final list = companies.data?.entries.toList();
      _setViewState(ViewState.complete(list));
    }
    if (companies is DataFailed) {
      final error = companies.error;
      if (kDebugMode) print(error);
      _setViewState(ViewState.error(error.toString()));
    }
  }
}
