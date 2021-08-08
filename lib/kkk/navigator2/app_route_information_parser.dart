import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/app_path.dart';
import 'package:navigator_example/kkk/navigator2/mixin_parse_route.dart';

class AppRouteInformationParser extends RouteInformationParser<BaseAppPathAndInfo> with ParseRoute{
  @override
  Future<BaseAppPathAndInfo> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    return parseRoute(uri);
  }

  @override
  RouteInformation restoreRouteInformation(BaseAppPathAndInfo path) {
    if (path is UnknownAppPathAndInfo) {
      return RouteInformation(location: '/404');
    }
    if (path is HomeAppPathAndInfo) {
      return RouteInformation(location: '/');
    }
    if (path is DetailAppPathAndInfo) {
      return RouteInformation(location: '/details/${path.id}');
    }
    if(path is TabAppPathAndInfo){
      return RouteInformation(location: '/tabs/${path.index}');
    }
    return null;
  }
}