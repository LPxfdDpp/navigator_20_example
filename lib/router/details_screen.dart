import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:navigator_example/kkk/main_kkk.dart';

import 'package:navigator_example/kkk/navigator2/page_manager.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context).settings.arguments;
    print("传输过来的参数为：");
    print(args);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Details ${widget.id}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.id}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Gap(20),
            OutlineButton(
              child: Text('Open Details'),
              onPressed: () {
                PageManager.of(context).openDetails();
              },
            ),
            Gap(20),
            OutlineButton(
              child: Text('Reset to home'),
              onPressed: () {
                PageManager.of(context).resetToHome();
              },
            ),
            Gap(20),
            OutlineButton(
              child: Text('Add new Details below'),
              onPressed: () {
                PageManager.of(context).addDetailsBelow();
              },
            ),
          ],
        ),
      ),
    );
  }
}
