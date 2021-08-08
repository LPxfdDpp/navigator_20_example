import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/app_path.dart';
import 'package:navigator_example/kkk/navigator2/mixin_parse_route.dart';
import 'package:navigator_example/router/tab_page.dart';
import 'package:provider/provider.dart';

import 'package:navigator_example/router/details_screen.dart';
import 'package:navigator_example/router/main_screen.dart';
import 'package:navigator_example/router/unknown_screen.dart';


class PageManager extends ChangeNotifier with ParseRoute{
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  List<Page> get pages => List.unmodifiable(_pages);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<Page> _pages = [
    MaterialPage(
      child: MainScreen(),
      key: const Key('MainScreen'),
      name: '/',
    ),
  ];

  BaseAppPathAndInfo get currentPath {
    return parseRoute(Uri.parse(_pages.last.name));
  }

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  Future<void> setNewRoutePath(BaseAppPathAndInfo configuration) async {
    if (configuration is UnknownAppPathAndInfo) {
      // Handling 404
      _pages.add(
        MaterialPage(
          child: UnknownScreen(),
          key: UniqueKey(),
          name: '/404',
        ),
      );
    } else if (configuration is DetailAppPathAndInfo) {
      // Handling details screens
      _pages.add(
        MaterialPage(
          child: DetailsScreen(id: configuration.id),
          key: UniqueKey(),
          name: '/details/${configuration.id}',
          arguments: [1,2,3]//试试传输数据
        ),
      );
    } else if (configuration is HomeAppPathAndInfo) {
      // Restoring to MainScreen
      _pages.removeWhere(
            (element) => element.key != const Key('MainScreen'),
      );
    }
    else if (configuration is TabAppPathAndInfo) {
      // Handling details screens
      _pages.add(
        MaterialPage(
          child: MyTabPage(configuration.index),
          key: UniqueKey(),
          name: '/tabs/${configuration.index}',
        ),
      );
    }
    notifyListeners();
    return;
  }

  void openDetails() {
    setNewRoutePath(DetailAppPathAndInfo(_pages.length));
  }
  void openTabs() {
    setNewRoutePath(TabAppPathAndInfo(0));
  }
  void resetToHome() {
    setNewRoutePath(HomeAppPathAndInfo());
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