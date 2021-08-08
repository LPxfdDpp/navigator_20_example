import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:navigator_example/kkk/main_kkk.dart';
import 'package:navigator_example/kkk/navigator2/page_manager.dart';

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
            Gap(20),
            OutlineButton(
              child: Text('Open Details'),
              onPressed: () {
                PageManager.of(context).openDetails();
              },
            ),
            OutlineButton(
              child: Text('Open Tabs'),
              onPressed: () {
                PageManager.of(context).openTabs();
              },
            ),
          ],
        ),
      ),
    );
  }
}
