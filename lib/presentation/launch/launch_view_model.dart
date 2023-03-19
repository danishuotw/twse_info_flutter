import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';

class LaunchViewModel extends ChangeNotifier {
  final CompanyRepository _companyRepository = CompanyRepository();

  ViewState viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState viewState) {
    this.viewState = viewState;
  }

  void fetchData() async {
    final data = await _companyRepository.fetchData();
    if (data is DataSuccess) {
      _setViewState(ViewState.complete(data.data));
    }
    if (data is DataFailed) {
      final error = data.error;
      if (kDebugMode) print(error);
      _setViewState(ViewState.error(error.toString()));
    }
  }
}
