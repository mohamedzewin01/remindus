
import 'package:flutter/material.dart';
import 'package:remindus/features/Auth/presentation/pages/Auth_page.dart';
import 'package:remindus/features/Home/presentation/pages/Home_page.dart';
import 'package:remindus/features/layout/presentation/pages/layout_view.dart';

import '../../splash.dart';

class RoutesManager {
  static const String splashScreen = '/';
  static const String layoutScreen = '/LayoutScreen';
  static const String authPage = '/AuthPage';

  static const String homeScreen = '/home';


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
        case RoutesManager.layoutScreen:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case RoutesManager.authPage:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case RoutesManager.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());





      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("No Route Found")),
        body: const Center(child: Text("No Route Found")),
      ),
    );
  }
}
