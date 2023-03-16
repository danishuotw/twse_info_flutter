import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twse_info_flutter/navigation/app_navigator.dart';
import 'package:twse_info_flutter/presentation/launch/launch_screen.dart';

String makePath(String path, String subPath) => '$path/$subPath'.replaceAll('//', '/');

class AppRoute {
  static final navigator = AppNavigator();
  static final root = RootRoute('/');

  static final goRouter = GoRouter(
    initialLocation: root.path,
    routes: <RouteBase>[
      AppRoute.root.goRoute,
    ],
  );
}

class RootRoute {
  final String path;
  final GoRoute goRoute;

  RootRoute(this.path)
      : goRoute = GoRoute(
          path: path,
          builder: (BuildContext context, GoRouterState state) => const LaunchScreen(),
        );
}
