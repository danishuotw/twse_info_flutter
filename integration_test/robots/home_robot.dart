import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twse_info_flutter/presentation/company/list/strings/companies_strings.dart';
import 'package:twse_info_flutter/presentation/home/strings/home_strings.dart';
import 'package:twse_info_flutter/presentation/launch/strings/launch_strings.dart';

class HomeRobot {
  const HomeRobot(this.tester);

  final WidgetTester tester;

  Future<void> clickEnterButton() async {
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 3));
    final btnFinder = find.byKey(const Key(LaunchStrings.enterBtn));
    await tester.ensureVisible(btnFinder);
    await tester.tap(btnFinder);
    await tester.pumpAndSettle();
  }

  Future<void> findTitle() async {
    await tester.pumpAndSettle();
    expect(find.text(HomeStrings.title), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> scrollThePage({bool scrollUp = false}) async {
    final listFinder = find.byKey(const Key(CompaniesStrings.listView_key));

    if (scrollUp) {
      await tester.fling(listFinder, const Offset(0, 500), 10000);
      await tester.pumpAndSettle();

      expect(find.text(HomeStrings.title), findsOneWidget);
    } else {
      await tester.fling(listFinder, const Offset(0, -500), 10000);
      await tester.pumpAndSettle();
    }
  }

  Future<void> findBottomNavBar() async {
    final bottomNavBarFinder = find.byKey(const Key(HomeStrings.bottomNaviBar_key));
    await tester.ensureVisible(bottomNavBarFinder);
    await tester.pumpAndSettle();
  }

  Future<void> clickFirstBarItem() async {
    final btnFinder = find.text(HomeStrings.barItem_industries);
    await tester.tap(btnFinder);
    await tester.pumpAndSettle();
  }

  Future<void> clickSecondBarItem() async {
    final bottomNavBarFinder = find.byKey(const Key(HomeStrings.bottomNaviBar_key));
    await tester.ensureVisible(bottomNavBarFinder);
    final btnFinder = find.text(HomeStrings.barItem_favourites);
    await tester.tap(btnFinder);
    await tester.pumpAndSettle();
  }
}

class FinderType extends Finder {
  FinderType(this.finder, this.key);

  final Finder finder;
  final Key key;

  @override
  Iterable<Element> apply(Iterable<Element> candidates) {
    return finder.apply(candidates);
  }

  @override
  String get description => finder.description;

  Finder get title => find.descendant(of: this, matching: find.byKey(key));
}
