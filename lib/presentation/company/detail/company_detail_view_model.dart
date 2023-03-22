import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';
import 'package:twse_info_flutter/domain/favourite/add_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/delete_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/get_favourite.dart';
import 'package:twse_info_flutter/utils/string_ext.dart';

class CompanyDetailViewModel extends ChangeNotifier {
  final CompanyRepository? _companyRepository;

  final UseCase<int, AddFavouriteParams>? _addFavourite;
  final UseCase<int, DeleteFavouriteParams>? _deleteFavourite;
  final UseCase<CompanyDto?, GetFavouriteParams>? _getFavourite;

  final String id;
  final ValueNotifier<bool> isFollowed = ValueNotifier<bool>(false);

  CompanyDto? dto;
  ViewState<CompanyDto> viewState = ViewState(state: ResponseState.EMPTY);

  CompanyDetailViewModel({
    required this.id,
    CompanyRepository? companyRepository,
    UseCase<CompanyDto?, GetFavouriteParams>? getFavourite,
    UseCase<int, AddFavouriteParams>? addFavourite,
    UseCase<int, DeleteFavouriteParams>? deleteFavourite,
  })  : _companyRepository = (companyRepository == null) ? injector<CompanyRepository>() : companyRepository,
        _getFavourite = (getFavourite == null) ? injector<GetFavourite>() : getFavourite,
        _addFavourite = (addFavourite == null) ? injector<AddFavourite>() : addFavourite,
        _deleteFavourite = (deleteFavourite == null) ? injector<DeleteFavourite>() : deleteFavourite;

  late Map<String, String> basicInfo = {
    '總經理': dto?.chairman ?? '',
    '董事長': dto?.generalManager ?? '',
    '產業類別': dto?.industry ?? '',
    '公司成立時間': (dto?.establishmentDate ?? '').dataFormat(),
    '上市日期': (dto?.listedDate ?? '').dataFormat(),
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
    '特別股': '${dto?.specialStock ?? ''} 股',
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

  Future<void> fetchData() async {
    _setViewState(ViewState.loading());
    final company = await _companyRepository?.getCompany(id);
    if (company is DataSuccess) {
      dto = company?.data;
      _setViewState(ViewState.complete(dto!));
    }
    if (company is DataFailed) {
      final error = company?.error;
      if (kDebugMode) print(error);
      _setViewState(ViewState.error(error.toString()));
    }
  }

  void getFavourite() async {
    if (id.isEmpty) throw Exception('CompanyDetailViewModel got empty id');
    final favourite = await _getFavourite?.call(params: GetFavouriteParams(id: id));
    isFollowed.value = (favourite != null);
  }

  void onPressStarButton() async {
    if (dto == null) return;
    if (!isFollowed.value) {
      await _addFavourite?.call(params: AddFavouriteParams(company: dto!));
      isFollowed.value = true;
    } else {
      await _deleteFavourite?.call(params: DeleteFavouriteParams(id: dto!.id!));
      isFollowed.value = false;
    }
  }
}
