import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto_ext.dart';

class GetFavouriteParams {
  final String id;

  GetFavouriteParams({required this.id});
}

class GetFavourite implements UseCase<CompanyDto?, GetFavouriteParams> {
  final FavouriteLocalDataSource _favouriteLocalDataSource;

  GetFavourite(this._favouriteLocalDataSource);

  @override
  Future<CompanyDto?> call({required GetFavouriteParams params}) async {
    final companyEntity = await _favouriteLocalDataSource.getById(params.id);
    if (companyEntity == null) return null;
    return companyEntity.toCompanyDto();
  }
}
