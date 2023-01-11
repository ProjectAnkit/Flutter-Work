import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  // ignore: prefer_const_constructors
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

  bool tap = true;

  List<String>display = ["","","","","","","","","",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
           itemBuilder: ((context,int index) {
             return GestureDetector(
              onTap: (() => tapped(index)),
               child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(child: Text(display[index],style: GoogleFonts.jost(color: Colors.white,fontSize: 30),)),
               ),
             );
           })),
      ),
    );
  }

  
  void tapped(int index){
    setState(() {
      if(tap==true)
      {
         display[index] = "0";
      }
      else
      {
         display[index] = "X";
      }

      tap = !tap;
      checkwinner();
    });
  }

  void checkwinner()
  {
    if(display[0]==display[1] && display[0]==display[2] && display[0]!="")
    {
      showwinner(display[0]);
    }

    if(display[0]==display[3] && display[0]==display[6] && display[0]!="")
    {
      showwinner(display[0]);
    }

    if(display[6]==display[7] && display[6]==display[8] && display[6]!="")
    {
      showwinner(display[7]);
    }

    if(display[2]==display[5] && display[2]==display[8] && display[5]!="")
    {
      showwinner(display[5]);
    }

    if(display[1]==display[4] && display[1]==display[7] && display[1]!="")
    {
      showwinner(display[4]);
    }

    if(display[3]==display[4] && display[3]==display[5] && display[3]!="")
    {
      showwinner(display[4]);
    }

    if(display[0]==display[4] && display[0]==display[8] && display[0]!="")
    {
      showwinner(display[0]);
    }

    if(display[2]==display[4] && display[2]==display[6] && display[2]!="")
    {
      showwinner(display[4]);
    }
  }

  
  void showwinner(String winner){
  showDialog(
    context: context,
    builder: (BuildContext context){
        return AlertDialog(
          title: Text("Winner is : "+winner),
        );
    }
  ); 
}
}
