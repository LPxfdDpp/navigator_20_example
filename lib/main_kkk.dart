import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/navigator2.dart';



void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  TheApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Router KKK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: appRouterDelegate,
      routeInformationParser: appRouteInformationParser,
      backButtonDispatcher: rootBackButtonDispatcher,
    );
  }
}








