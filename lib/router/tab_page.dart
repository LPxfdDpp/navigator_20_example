import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/navigator2.dart';

class MyTabPage extends StatefulWidget {
  final int index;

  const MyTabPage(this.index,{Key key, }) : super(key: key);
  @override
  MyTabPageState createState() => MyTabPageState();
}

class MyTabPageState extends State<MyTabPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  ChildBackButtonDispatcher _childBackButtonDispatcher;
  Function callback = () async{
    print("klkklklkl");

    return false;
  };
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: widget.index);


    _childBackButtonDispatcher = rootBackButtonDispatcher.createChildBackButtonDispatcher()..addCallback(callback);
    _childBackButtonDispatcher.takePriority();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
        title: Text('Tab'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
        ],
      ),
    );
  }
}