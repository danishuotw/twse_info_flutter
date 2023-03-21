import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto_ext.dart';

class AddFavouriteParams {
  final CompanyDto company;

  AddFavouriteParams({required this.company});
}

class AddFavourite implements UseCase<int, AddFavouriteParams> {
  final FavouriteLocalDataSource _favouriteLocalDataSource;

  AddFavourite(this._favouriteLocalDataSource);

  @override
  Future<int> call({required AddFavouriteParams params}) {
    return _favouriteLocalDataSource.insertCompany(params.company.toCompanyEntity());
  }
}
