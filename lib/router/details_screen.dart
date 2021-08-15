import 'dart:convert';

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

  final Object? arguments;

  static String appPath = "/details_screen";

   static MaterialPage Function({Map<String,String>? params,Object? arguments}) generatePage = ({Map<String,String>? params,Object? arguments}) {
    // final arguments_ = arguments??<String,Object>{};
    return MaterialPage(
          child: DetailsScreen(id: int.parse(params!['id']!),arguments: arguments,),
          key: UniqueKey(),
          name: appPath+"?id=${int.parse(params['id']!)}",
          arguments: arguments
      );
  };

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  late Map<String,dynamic> args;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();


    // args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    // print("---------- 传输过来的参数为");
    // print(args.hashCode);
    //
    //
    // print("传输过来的参数为：");
    // print(args);
  }

  @override
  Widget build(BuildContext context) {
    print("--------");

    return Scaffold(
      appBar: AppBar(
        title: Text('Details ${widget.id}'),
      ),
      body:
      Column(
        children: [
          // Text('${args["b"]!}'),
          Center(
            child: OutlineButton(
              child: Text('tttttttt'),
              onPressed: () {


                args["b"] = "hahahahahahahhah";

                print("---------- bbbbbbbbb");
                print(args.hashCode);

                PageManager.of(context).pushPage(MyTabPage.appPath,params: {"index":"0"},);
              },
            ),
          ),
        ],
      )

    );
  }
}
