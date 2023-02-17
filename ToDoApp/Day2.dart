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

  List TodoItem = [
    ["Grocery",false],
     ["Fruits",false],
      ["Vegetables",false],
       ["Stationary",false],
        ["Clothes",false],
         ["Paint",false],
          ["Fast Food",false],

  ];

  void OnTapcheck(int index,bool? value)
  {
    setState(() {
      TodoItem[index][1] = ! TodoItem[index][1];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: AppColor,
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){}, icon: const CircleAvatar(child: Icon(Icons.person,color: Colors.white,),backgroundColor: Colors.grey,)))
        ],
      ),
      drawer: const Drawer(),
      body: Stack(
        children: [
          Column(
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
                      
                      hintText: "Search Item",
                      border: InputBorder.none
                    ),
                  ),
                ))),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Text("All ToDo's",style: GoogleFonts.jost(fontSize: 30,color: Colors.black),),
              )),
              Expanded(child: ListView.builder(
                itemCount: TodoItem.length,
                itemBuilder: ((context, index) {
                  return ToDoCard(
                    todotext:  TodoItem[index][0],
                    isdone: TodoItem[index][1],
                    onchanged: (value) => OnTapcheck(index, value)
                    );
                })))
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  const EdgeInsets.only(bottom: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(1.5,1.5),
                            color: Colors.grey,
                            blurRadius: 1
                          ),
                          const BoxShadow(
                            offset: Offset(-1.5,-1.5),
                            color: Colors.grey,
                            blurRadius: 1
                          )
                        ]),
                        child: Center(
                          child: Padding(
                            padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                             decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add a new ToDo item"
                               ),
                            ),
                          ),
                        ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(12),),
                          child: Icon(Icons.add,color: Colors.white,size: 35),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
}


//TodoCard
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoCard extends StatelessWidget {
   ToDoCard({super.key,required this.onchanged, required this.todotext, required this.isdone});
   final String todotext;
   final bool isdone;
   Function(bool?)?onchanged;

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
             Checkbox(value: isdone, onChanged: onchanged,fillColor: MaterialStateProperty.all(Colors.black)),
              Text(todotext,style: GoogleFonts.jost(fontSize: 20,color: Colors.black,decoration: isdone?TextDecoration.lineThrough:null)),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Icon(Icons.delete,color: Colors.white,)),
                  ),
                ),
              )
            ],
           ),
         ),
      ),
    );
  }
}
