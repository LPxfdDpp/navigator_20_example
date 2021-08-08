import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/navigator2.dart';

// 全局的路由监听者，可在需要的widget中添加，应该放到一个全局定义的文件中
//需要监听的Widget中 需要 extends State<xxx> with RouteAware {
// final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final RouteObserver<Route> routeObserver = RouteObserver<Route>();


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








