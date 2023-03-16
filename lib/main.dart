import 'package:flutter/material.dart';
import 'package:twse_info_flutter/navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: AppRoute.goRouter,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );
}
