import 'package:flutter/material.dart';
import 'package:navigator_example/router/details_screen.dart';
import 'package:navigator_example/router/tab_page.dart';

class AppPath {

  static Map<String,MaterialPage Function({Map<String,String>? params,Map<String,dynamic>? arguments})> appPagePath = {
    DetailsScreen.appPath:DetailsScreen.generatePage,
    MyTabPage.appPath:MyTabPage.generatePage
  };


}