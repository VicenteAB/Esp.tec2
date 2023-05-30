import 'package:flutter/material.dart';
import 'package:plantilla_ca/app/pages.dart';
import 'package:plantilla_ca/app/pages/example/example_view.dart';
import 'package:plantilla_ca/app/pages/hero_page/hero_page_view.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;

  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    final Map args = settings.arguments as Map;

    switch (settings.name) {
      case Pages.examplePage:
        return _buildRoute(settings, ExamplePage());
      case Pages.heroesPage:
        return _buildRoute(settings, HeroPagePage());
      default:
        return _buildRoute(settings, ExamplePage());
    }
  }

  MaterialPageRoute<dynamic> _buildRoute(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (BuildContext ctx) => builder,
    );
  }
}
