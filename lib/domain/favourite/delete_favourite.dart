import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';

class DeleteFavouriteParams {
  final String id;

  DeleteFavouriteParams({required this.id});
}

class DeleteFavourite implements UseCase<int, DeleteFavouriteParams> {
  final FavouriteLocalDataSource _favouriteLocalDataSource;

  DeleteFavourite(this._favouriteLocalDataSource);

  @override
  Future<int> call({required DeleteFavouriteParams params}) {
    return _favouriteLocalDataSource.deleteCompany(params.id);
  }
}
