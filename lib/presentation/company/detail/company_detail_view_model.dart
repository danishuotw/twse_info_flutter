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

  late Map<String, String> basicInfo = {
    '總經理': dto?.chairman ?? '',
    '董事長': dto?.generalManager ?? '',
    '產業類別': dto?.industry ?? '',
    '公司成立時間': dto?.establishmentDate ?? '',
    '上市日期': dto?.listedDate ?? '',
  };

  late Map<String, String> contactInfo = {
    '總機': dto?.switchboardPhone ?? '',
    '統一編號': dto?.unifiedNumber ?? '',
    '': '',
    '地址': dto?.address ?? '',
  };

  late Map<String, String> capitalInfo = {
    '實收資本額(元)': dto?.paidInCapital ?? '',
    '已發行普通股數或 TDR 原股發行股數': dto?.paidInCapital ?? '',
    '普通股每股面額': dto?.parValue ?? '',
    '特別股': dto?.specialStock ?? '',
  };

  void _setViewState(ViewState<CompanyDto> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  void fetchData() async {
    _setViewState(ViewState.loading());
    final company = await _companyRepository.getCompany(id);
    if (company is DataSuccess) {
      dto = company.data;
      _setViewState(ViewState.complete(dto!));
    }
    if (company is DataFailed) {
      final error = company.error;
      if (kDebugMode) print(error);
      _setViewState(ViewState.error(error.toString()));
    }
  }

  void onPressFollowingButton() {}
}
