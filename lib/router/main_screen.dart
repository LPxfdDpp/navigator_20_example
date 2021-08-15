import 'package:flutter/material.dart';

import 'package:navigator_example/main_kkk.dart';
import 'package:navigator_example/kkk/navigator2/page_manager.dart';
import 'package:navigator_example/router/details_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Router Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Main Router Screen'),
            OutlineButton(
              child: Text('Open Details'),
              onPressed: () {
                PageManager.of(context).pushPage(DetailsScreen.appPath,params: {"id":"100"},arguments:{"a":100,"b":"sss","c":90.99,"d":true});
              },
            ),
            OutlineButton(
              child: Text('Open Tabs'),
              onPressed: () {
                // PageManager.of(context).openTabs();
              },
            ),
          ],
        ),
      ),
    );
  }
}
