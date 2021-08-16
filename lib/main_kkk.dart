import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/navigator2.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';



void main() {
  configureApp();

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
      // routeInformationProvider: appRouteInformationProvider,
      routeInformationParser: appRouteInformationParser,
      // backButtonDispatcher: rootBackButtonDispatcher,
    );
  }
}








