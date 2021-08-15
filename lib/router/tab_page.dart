import 'package:flutter/material.dart';
import 'package:navigator_example/kkk/navigator2/navigator2.dart';

class MyTabPage extends StatefulWidget {
  final int index;

    MyTabPage({Key? key,

    required this.index,
      this.arguments
    }) : super(key: key);

  final Object? arguments;

  static String appPath = "/my_tab_Page";

  static MaterialPage Function({Map<String,String>? params,Object? arguments}) generatePage = ({Map<String,String>? params,Object? arguments}) {
    // final arguments_ = arguments??<String,Object>{};
    return MaterialPage(
        child: MyTabPage(index: int.parse(params!['index']!),arguments: arguments,),
        key: UniqueKey(),
        name: appPath+"?index=${int.parse(params['index']!)}",
        arguments: arguments
    );
  };



  @override
  MyTabPageState createState() => MyTabPageState();
}

class MyTabPageState extends State<MyTabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: widget.index);
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
          onTap: (index){

          },
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