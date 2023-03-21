import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/domain/favourite/delete_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/watch_all_favourite.dart';

class FavouritesViewModel extends ChangeNotifier {
  final WatchAllFavourite _watchFavourites;
  final DeleteFavourite _deleteFavourite;

  FavouritesViewModel()
      : _watchFavourites = injector<WatchAllFavourite>(),
        _deleteFavourite = injector<DeleteFavourite>();

  ViewState<List<CompanyDto>> viewState = ViewState(state: ResponseState.EMPTY);

  StreamSubscription? _favouritesSubscription;

  void _setViewState(ViewState<List<CompanyDto>> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    _favouritesSubscription?.cancel();
    super.dispose();
  }

  void subscribeAllFavourite() {
    _setViewState(ViewState.loading());
    final streamFavourites = _watchFavourites.call(params: WatchAllFavouriteParams());
    _favouritesSubscription = streamFavourites.listen((favourites) {
      if (favourites.isEmpty) {
        _setViewState(ViewState.empty());
      } else {
        _setViewState(ViewState.complete(favourites));
      }
    });
  }

  void removeFavourite(String? id) async {
    if (id == null) throw Exception('removeFavourite by null id');
    await _deleteFavourite.call(params: DeleteFavouriteParams(id: id));
  }
}
