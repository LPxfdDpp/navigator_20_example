import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/page_manager.dart';
import 'package:provider/provider.dart';

class AppRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  AppRouterDelegate() {
    pageManager.addListener(notifyListeners);
  }
  final PageManager pageManager = PageManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageManager>.value(
      value: pageManager,
      child: Consumer<PageManager>(
        builder: (context, pageManager, child) {
          return Navigator(
            key: navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(pageManager.pages),
          );
        },
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    pageManager.didPop(route,result);

    return true;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => pageManager.navigatorKey;

  @override
  RouteInformation get currentConfiguration => pageManager.currentPath;

  @override
  Future<void> setNewRoutePath(RouteInformation routeInformation) async {
    await pageManager.setNewRoutePath(routeInformation);
  }
}