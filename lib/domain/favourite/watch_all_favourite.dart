import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto_ext.dart';

class WatchAllFavouriteParams {}

class WatchAllFavourite implements UseCaseWatcher<List<CompanyDto>, WatchAllFavouriteParams> {
  final FavouriteLocalDataSource _favouriteLocalDataSource;

  WatchAllFavourite(this._favouriteLocalDataSource);

  @override
  Stream<List<CompanyDto>> call({required WatchAllFavouriteParams? params}) {
    final companiesStream = _favouriteLocalDataSource.watchAllCompany().map(
          (event) => event.map((e) => e.toCompanyDto()).toList(),
        );
    return companiesStream;
  }
}
