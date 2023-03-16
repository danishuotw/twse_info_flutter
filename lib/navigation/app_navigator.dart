import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  Route<T> routeFor<T>(Widget page) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoPageRoute<T>(builder: (BuildContext context) => page);
      default:
        return MaterialPageRoute<T>(builder: (BuildContext context) => page);
    }
  }
}
