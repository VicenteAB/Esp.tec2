import 'package:flutter/material.dart';
import 'package:plantilla_ca/app/pages/example/example_view.dart';
import 'package:plantilla_ca/app/pages/example/example_logrosPom.dart';
import 'package:plantilla_ca/app/pages/example/example_slider.dart';
import 'package:plantilla_ca/app/router_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final RouterApp _router = RouterApp();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:
          AchievementsView(), //const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
}
