import 'package:flutter/material.dart';
import 'package:navigator_example/main_kkk.dart';
import 'package:navigator_example/kkk/navigator2/app_path.dart';

import 'package:navigator_example/kkk/navigator2/page_manager.dart';
import 'package:navigator_example/router/tab_page.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen({Key? key,

    required this.id,
     this.arguments
   }) : super(key: key);
  final int id;

  final Map<String,dynamic>? arguments;

  static String appPath = "/details_screen";

   static MaterialPage Function({Map<String,String>? params,Map<String,dynamic>? arguments}) generatePage = ({Map<String,String>? params,Map<String,dynamic>? arguments}) {
    final arguments_ = arguments??<String,dynamic>{};
    return MaterialPage(
          child: DetailsScreen(id: int.parse(params!['id']!),arguments: arguments_,),
          key: UniqueKey(),
          name: appPath+"?id=${int.parse(params['id']!)}",
          arguments: arguments_
      );
  };

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
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
        child: OutlineButton(
        child: Text('tttttttt'),
      onPressed: () {
        PageManager.of(context).pushPage(MyTabPage.appPath,params: {"index":"0"},);
      },
    ),
      ),
    );
  }
}
