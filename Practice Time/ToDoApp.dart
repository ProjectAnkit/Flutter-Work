//HomePage

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Pages/ToDoCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _controller = TextEditingController();

  List ToDo = [
   
  ];

  void _tapped(bool? value,int index){
    setState(() {
      ToDo[index][1] = ! ToDo[index][1];
    });
  }

  void _delete(int index){
     setState(() {
       ToDo.removeAt(index);
     });
  }

  var AppColor = const Color.fromARGB(236, 226, 229, 233);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor,
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: AppColor,
        actions: [
          IconButton(onPressed: (){}, icon: const CircleAvatar(child: Icon(Icons.person,color: Colors.white,),backgroundColor: Colors.grey,))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 340,
              height: 60,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal : 16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search"
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal : 30.0),
              child: Text("All ToDo's",style: GoogleFonts.jost(fontSize: 35,fontWeight: FontWeight.w400,color: Colors.black),),
            )),
            Expanded(
              child: ListView.builder(
                itemCount: ToDo.length,
                itemBuilder: ((context, index) => ToDoCard(
                  onChanged: (value) =>  _tapped(value,index),
                  Deletetodo: () =>   _delete(index),
                  Name: ToDo[index][0],
                  onTap: ToDo[index][1],
                )))),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 14.0,vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 65,
                        width: 280,
                        // ignore: prefer_const_literals_to_create_immutables
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [
                          const BoxShadow(
                            offset: Offset(1.0,1.0),
                            color: Colors.black,
                            blurRadius: 2
                          ),
                           const BoxShadow(
                            offset: Offset(-1.0,-1.0),
                            color: Colors.black,
                            blurRadius: 2
                          )
                        ]),
                        child: Center(child: Padding(
                          padding:  const EdgeInsets.symmetric(horizontal : 12.0),
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add ToDo Item"
                              ),
                          ),
                        )),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            ToDo.add([_controller.text,false]);
                            _controller.clear();
                          });
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                          child: Center(child: Icon(Icons.add,color: Colors.white,size: 35,)),
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}


//ToDoCard

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoCard extends StatelessWidget {
  ToDoCard({super.key,this.onChanged, required this.onTap, required this.Name,this.Deletetodo});
  final bool onTap;
  final String Name;

  Function(bool?)?onChanged;
  Function()?Deletetodo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 6),
      child: Container(
        height: 75,
        width: 360,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Checkbox(value: onTap, onChanged: onChanged,fillColor: MaterialStateProperty.all(Colors.black),),
            ),
            Text(Name,style: GoogleFonts.jost(fontSize: 20,color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(right :8.0),
              child: IconButton(onPressed: Deletetodo, icon: Icon(Icons.delete,color: Colors.red,size: 30),),
            )
          ],
        ),
      ),
    );
  }
}


