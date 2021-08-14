import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/app_path.dart';
import 'package:provider/provider.dart';
import 'package:navigator_example/router/details_screen.dart';
import 'package:navigator_example/router/main_screen.dart';


class PageManager extends ChangeNotifier {
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  List<Page> get pages => List.unmodifiable(_pages);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<Page> _pages = [
    MaterialPage(
      child: MainScreen(),
      key: const ValueKey('MainScreen'),
      name: '/',
    ),
  ];

  RouteInformation get currentPath {
    return RouteInformation(
      location: pages.last.name,
      state: pages.last.arguments
    );
  }

  void didPop(Route<dynamic> route, dynamic result) {

    // print(route.settings.name);
    // _pages.forEach((element) {
    //   print(element.name);
    // });
    //
    // _pages.remove(_pages.lastWhere((element) => element.name==route.settings.name));

    _pages.removeLast();

    notifyListeners();
  }

  Future<void> setNewRoutePath(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if(uri.path != '/'){
      _pages.add(AppPath.appPagePath[uri.path]!.call(params:uri.queryParameters,arguments:(routeInformation.state == null)?null:(routeInformation.state as Map<String,dynamic>)));
    }

    notifyListeners();
    return;
  }

  // void openDetails() {
  //   setNewRoutePath(DetailAppPathAndInfo(_pages.length));
  // }
  // void openTabs() {
  //   setNewRoutePath(TabAppPathAndInfo(0));
  // }
  // void resetToHome() {
  //   setNewRoutePath(HomeAppPathAndInfo());
  // }

  pushPage(String appPath,{Map<String,String>? params,Map<String,dynamic>? arguments}){
    if(params != null){
      appPath += "?";
      params.entries.forEach((element) {
        appPath += element.key+"="+element.value+"&";
      });
      appPath = appPath.substring(0,appPath.length-1);

    }
    setNewRoutePath(RouteInformation(location: appPath,state: arguments));
  }

  void addDetailsBelow() {
    _pages.insert(
      _pages.length - 1,
      MaterialPage(
        child: DetailsScreen(id: _pages.length),
        key: UniqueKey(),
        name: '/details/${_pages.length}',
      ),
    );
    notifyListeners();
  }
}