import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';
import 'package:twse_info_flutter/domain/favourite/add_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/delete_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/get_favourite.dart';
import 'package:twse_info_flutter/util/string_ext.dart';

class CompanyDetailViewModel extends ChangeNotifier {
  final CompanyRepository _companyRepository = injector<CompanyRepository>();
  final GetFavourite _getFavourite = injector<GetFavourite>();
  final AddFavourite _addFavourite = injector<AddFavourite>();
  final DeleteFavourite _deleteFavourite = injector<DeleteFavourite>();

  final String id;
  final ValueNotifier<bool> isFollowed = ValueNotifier<bool>(false);

  CompanyDto? dto;

  ViewState<CompanyDto> viewState = ViewState(state: ResponseState.EMPTY);

  CompanyDetailViewModel({required this.id});

  late Map<String, String> basicInfo = {
    '總經理': dto?.chairman ?? '',
    '董事長': dto?.generalManager ?? '',
    '產業類別': dto?.industryText ?? '',
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
    '實收資本額(元)': '${dto?.paidInCapital?.numberFormat() ?? ''} 元',
    '已發行普通股數或 TDR 原股發行股數': '$issuedShares 股 (含私募 ${dto?.privateShares ?? ''})',
    '普通股每股面額': dto?.parValue?.replaceAll(' ', '') ?? '',
    '特別股': dto?.specialStock ?? '',
  };

  String get issuedShares {
    final stParValue = dto?.parValue?.replaceAll(RegExp(r'[^0-9]'), '');
    final capital = double.tryParse(dto?.paidInCapital ?? '');
    final parValue = double.tryParse(stParValue ?? '');
    final specialStock = double.tryParse(dto?.specialStock ?? '');
    if (parValue == null || capital == null || specialStock == null) return 'error';
    final trd = (capital * 10000 / parValue) - specialStock;
    return trd.toString().numberFormat();
  }

  @override
  void dispose() {
    isFollowed.dispose();
    super.dispose();
  }

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

  void getFavourite() async {
    if (id.isEmpty) throw Exception('CompanyDetailViewModel got empty id');
    final favourite = await _getFavourite.call(params: GetFavouriteParams(id: id));
    isFollowed.value = (favourite != null);
  }

  void onPressStarButton() async {
    if (dto == null) return;
    if (!isFollowed.value) {
      await _addFavourite.call(params: AddFavouriteParams(company: dto!));
      isFollowed.value = true;
    } else {
      await _deleteFavourite.call(params: DeleteFavouriteParams(id: dto!.id!));
      isFollowed.value = false;
    }
  }
}
