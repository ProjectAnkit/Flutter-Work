import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("Box ${index}"),
                  subtitle: Text("Playing with flutter"),
                );
              }),
      
              Container(
                height: 400,
                width: 260,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.purpleAccent.shade400),
              )
          ],
        ),
      ),
    );
  }
}
