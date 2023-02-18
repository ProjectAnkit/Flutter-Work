import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoCard extends StatelessWidget {
   ToDoCard({super.key,required this.onchanged, required this.todotext, required this.isdone,required this.deleteItem});
   final String todotext;
   final bool isdone;
   Function ()? deleteItem;
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
                child: IconButton(onPressed: deleteItem, icon: Icon(Icons.delete,color: Colors.red,size: 30,)),
              )
            ],
           ),
         ),
      ),
    );
  }
}
