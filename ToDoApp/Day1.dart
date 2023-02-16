//HomePage

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Pages/ToDoCard.dart';
import 'package:todo/Theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu),color: Colors.black,),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){}, icon: const CircleAvatar(child: Icon(Icons.person,color: Colors.white,),backgroundColor: Colors.grey,)))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 320,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
              child: Center(child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    
                    hintText: "Search",
                    border: InputBorder.none
                  ),
                ),
              ))),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Text("All ToDo's",style: GoogleFonts.jost(fontSize: 30,color: Colors.black),),
            )),
            Expanded(child: ListView.builder(itemBuilder: ((context, index) => TodoCard())))
        ],
      ),
    );
  }
}


//ToDoCard

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoCard  extends StatelessWidget {
  const TodoCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal: 10.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.check_box)),
              Text("This is Bad",style: GoogleFonts.jost(fontSize: 20,color: Colors.black),),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Icon(Icons.delete,color: Colors.white,)),
                ),
              )
            ],
           ),
         ),
      ),
    );
  }
}
