import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myhomescreen(),
  ));
}

class Myhomescreen extends StatelessWidget {
  const Myhomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const MyAppbar(title: Center(child: Text("PORTFOLIO",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),),),
          const SizedBox(
            height: 40,
          ),
           const MyProfile(),
        ],
      ),
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: const BoxDecoration(color: Colors.purple),
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu),tooltip: "Options",color: Colors.white,),
          Expanded(child: title),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search),tooltip: "Search",color: Colors.white,)
        ],
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.8,0.9),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const CircleAvatar(
          maxRadius: 70,
          backgroundImage: AssetImage("assets/PorifleAvatar.png"),
          backgroundColor: Colors.purple,
        ),
       Container(
        width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black26),
          child: Center(child: Text("Violet",style: TextStyle(color: Colors.white,fontSize: 20),)),
         ),
      ],
    );
  }
}
