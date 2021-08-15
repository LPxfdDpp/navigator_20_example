import 'package:flutter/material.dart';
import 'package:navigator_example/router/details_screen.dart';
import 'package:navigator_example/router/tab_page.dart';

class AppPath {
  static const String APAT = "appPathAddTime";

  static Map<String,MaterialPage Function({Map<String,String>? params,Object? arguments})> appPagePath = {
    DetailsScreen.appPath:DetailsScreen.generatePage,
    MyTabPage.appPath:MyTabPage.generatePage
  };


}