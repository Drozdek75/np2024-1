import 'package:flutter/material.dart';
import 'package:np2024_01/prcf/init.dart';
import 'package:np2024_01/screens/orari.dart';
import 'package:np2024_01/screens/splash.dart';

class Generaterouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case orari.path:
        return buildRoute(orari(), settings: settings);
      case init.path:
        return buildRoute(init(), settings: settings);
      case splash.path:
        return buildRoute(splash(), settings: settings);
      default:
        return buildRoute(init(), settings: settings);
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => child, settings: settings);
  }
}
