import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<RouteInformation>{
  @override
  Future<RouteInformation> parseRouteInformation(
      RouteInformation routeInformation) async {
    return routeInformation;
  }

  @override
  RouteInformation restoreRouteInformation(RouteInformation routeInformation) {
    return routeInformation;
  }
}