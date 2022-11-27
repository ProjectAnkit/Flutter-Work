import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    home: Mybar(),
  ));
}

class Mybar extends StatelessWidget {
  const Mybar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {},tooltip: "Options",),
        title: Title(color: Colors.white, child: Text("APPI",style: Theme.of(context).primaryTextTheme.headline5),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search),tooltip: "Search",)
        ],
       ),
       body: const Center(
        child: Text("Hello WOrld !"),
       ),
       floatingActionButton: FloatingActionButton(onPressed: () {print("Button is clicked");},child: const Icon(Icons.add),),
      );
  }
}
