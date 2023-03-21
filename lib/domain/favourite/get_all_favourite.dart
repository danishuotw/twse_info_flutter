import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto_ext.dart';

class GetAllFavouriteParams {}

class GetAllFavourite implements UseCase<List<CompanyDto>, GetAllFavouriteParams> {
  final FavouriteLocalDataSource _favouriteLocalDataSource;

  GetAllFavourite(this._favouriteLocalDataSource);

  @override
  Future<List<CompanyDto>> call({required GetAllFavouriteParams params}) async {
    final companies = (await _favouriteLocalDataSource.getAllCompany()).map((e) => e.toCompanyDto()).toList();
    return Future.value(companies);
  }
}
