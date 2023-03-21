import 'package:flutter/cupertino.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/domain/favourite/watch_all_favourite.dart';

class FavouritesViewModel extends ChangeNotifier {
  final WatchAllFavourite _watchFavourites;

  FavouritesViewModel() : _watchFavourites = injector<WatchAllFavourite>();

  void fetchData() async {}
}
