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
      arguments: {AppPath.APAT:DateTime.now().millisecondsSinceEpoch}
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
      if(routeInformation.state == null){//web改变浏览器地址的方式进来的

        _pages.add(AppPath.appPagePath[uri.path]!.call(params:uri.queryParameters,arguments:routeInformation.state));
      }
      //app通过[pushPage]进来的
      else{
        //根据时间戳判断当前是 添加 还是 移除 page
        if(_pages.indexWhere((element) => (element.arguments! as Map)[AppPath.APAT] == (routeInformation.state! as Map)[AppPath.APAT]) == -1){
          _pages.add(AppPath.appPagePath[uri.path]!.call(params:uri.queryParameters,arguments:routeInformation.state));
        }else{
          _pages.removeLast();
        }
      }

    }else{
      _pages.removeRange(1, _pages.length);
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

  ///app添加page的方法
  pushPage(String appPath,{Map<String,String>? params,Map<String,Object>? arguments}){
    if(params != null){
      appPath += "?";
      params.entries.forEach((element) {
        appPath += element.key+"="+element.value+"&";
      });
      appPath = appPath.substring(0,appPath.length-1);

    }

    //页面添加的时间戳
    if(arguments == null){
      arguments = {
        AppPath.APAT:DateTime.now().millisecondsSinceEpoch
      };
    }else{
      arguments[AppPath.APAT] = DateTime.now().millisecondsSinceEpoch;
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