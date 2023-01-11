import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TicTacToe(),
  ));
}


class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {

 List<String> display = ["","","","","","","","",""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
           itemBuilder: (context,int index){
            return GestureDetector(
              onTap: (() {
                tapped(index);
              }),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(child: Text(display[index],style: GoogleFonts.jost(fontSize: 40,color: Colors.white),)),
              ),
            );
           } ),
      ),
    );
  }

  void tapped(int index){
  setState(() {
    display[index] = "o";
  });
}


}

