import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twse_info_flutter/navigation/app_navigator.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_screen.dart';
import 'package:twse_info_flutter/presentation/company/list/companies_screen.dart';
import 'package:twse_info_flutter/presentation/home/home_screen.dart';
import 'package:twse_info_flutter/presentation/launch/launch_screen.dart';

String makePath(String path, String subPath) => '$path/$subPath'.replaceAll('//', '/');

class AppRoute {
  static final navigator = AppNavigator();
  static final root = RootRoute(LaunchScreen.route);
  static final home = HomeRoute(HomeScreen.route);
  static final companies = CompaniesRoute(CompaniesScreen.route);
  static final companyDetail = CompanyDetailRoute(CompanyDetailScreen.route);

  static final goRouter = GoRouter(
    initialLocation: root.path,
    routes: <RouteBase>[
      AppRoute.root.goRoute,
      AppRoute.home.goRoute,
      AppRoute.companies.goRoute,
      AppRoute.companyDetail.goRoute,
    ],
  );
}

class RootRoute {
  final String path;

  final GoRoute goRoute;

  RootRoute(this.path)
      : goRoute = GoRoute(
          path: path,
          name: path,
          builder: (BuildContext context, GoRouterState state) => const LaunchScreen(),
        );
}

class HomeRoute {
  final String path;
  final GoRoute goRoute;

  HomeRoute(this.path)
      : goRoute = GoRoute(
          path: path,
          name: path,
          builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
        );
}

class CompaniesRoute {
  final String path;
  final GoRoute goRoute;

  CompaniesRoute(this.path)
      : goRoute = GoRoute(
          path: path,
          name: path,
          builder: (BuildContext context, GoRouterState state) =>
              CompaniesScreen(industryId: state.pathParameters['industryId'] ?? ''),
        );
}

class CompanyDetailRoute {
  final String path;
  final GoRoute goRoute;

  CompanyDetailRoute(this.path)
      : goRoute = GoRoute(
          path: path,
          name: path,
          builder: (BuildContext context, GoRouterState state) =>
              CompanyDetailScreen(companyId: state.pathParameters['companyId'] ?? ''),
        );
}
