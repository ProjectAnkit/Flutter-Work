// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    title: "My APP",
    home: SafeArea(child: MyScaffold()),
  ));
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          myAPPbar(title: Center(child: Text("Project",style: Theme.of(context).primaryTextTheme.headline5)),),
          Expanded(child: Center(child: Text("Hello world !")))
        ],
      ) ,
    );
  }
}

// ignore: camel_case_types
class myAPPbar extends StatelessWidget {
  const myAPPbar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          IconButton(onPressed: null, icon: Icon(Icons.menu),hoverColor: Colors.white, tooltip: "Options", ),
          Expanded(child: title),
          IconButton(onPressed: null, icon: Icon(Icons.search),hoverColor: Colors.white, tooltip: "Search",),
        ],
      ),
    );
  }
}
