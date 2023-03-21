import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/presentation/favourite/list/favourites_screen.dart';
import 'package:twse_info_flutter/presentation/industry/list/industries_screen.dart';

class HomeViewModel extends BaseViewModel {
  final List<Widget> pages = [
    const IndustriesScreen(),
    const FavouritesScreen(),
  ];

  int selectedIndex = 0;

  Widget getPages() => pages.elementAt(selectedIndex);

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
