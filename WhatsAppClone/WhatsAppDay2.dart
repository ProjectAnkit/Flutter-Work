import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin
{
  late TabController mycontroller ;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mycontroller = TabController(length: 4, vsync: this,initialIndex: 1);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(178, 2, 133, 89),
        title: Text("WhastApp",style: GoogleFonts.roboto(),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
        ],
        // ignore: prefer_const_constructors
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: mycontroller,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(
              icon: Icon(Icons.group),
            ),
            const Tab(
              text: "Chats",
            ),
            const Tab(
              text: "Status",
            ),
            // ignore: prefer_const_constructors
            Tab(
              text: "Calls",
            )
          ],
        ),
      ), 
      body: TabBarView(
        controller: mycontroller,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
         const Center(child: Text("Community")),
         const Center(child: Text("Chats")),
         const Center(child: Text("Status")),
         const Center(child: Text("Calls")),
        ]), 
    );
  }
}
