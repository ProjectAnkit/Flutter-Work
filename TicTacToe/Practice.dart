import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {

  List<String>Display = ["","","","","","","","","",];
  var symbolfont = GoogleFonts.jost(fontSize: 35,color: Colors.white);
  var DialogFont = GoogleFonts.jost(fontSize: 35,color: Colors.black);
  var Buttonfont = GoogleFonts.jost(fontSize: 15,color: Colors.white);

  bool tap = true;
  int fill = 0;
  int ExScore = 0;
  int OhScore = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:13.0),
                      child: Column(
                        children: [
                          Text("Player X",style: symbolfont,),
                          Text(ExScore.toString(),style: symbolfont,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:13.0),
                      child: Column(
                        children: [
                          Text("Player O",style: symbolfont,),
                          Text(OhScore.toString(),style: symbolfont,)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                   itemBuilder: ((context,int index) {
                     return GestureDetector(
                      onTap: (() => tapped(index)),
                       child: Container(
                         decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                         ),
                         child: Center(
                          child: Text(Display[index],style: symbolfont,)),
                       ),
                     );
                   })
                   ),
              ))
        ],
      ),
    );
  }

  tapped(int index){
    setState(() {
      if(tap && Display[index]=="")
      {
        Display[index] = "O";   
        fill++;
      }
      else if(!tap && Display[index]=="")
      {
        Display[index] = "X";
        fill++;
      }
      tap = !tap;
      checkWinner();
  });
  }

  checkWinner(){

    if(Display[0]==Display[1] && Display[0]==Display[2] && Display[0]!="")
    {
      showDialogBox(Display[0]);
    }

     if(Display[0]==Display[3] && Display[0]==Display[6] && Display[0]!="")
    {
      showDialogBox(Display[0]);
    }

     if(Display[0]==Display[4] && Display[0]==Display[8] && Display[0]!="")
    {
      showDialogBox(Display[0]);
    }

     if(Display[2]==Display[5] && Display[2]==Display[8] && Display[2]!="")
    {
      showDialogBox(Display[2]);
    }

     if(Display[6]==Display[7] && Display[6]==Display[8] && Display[6]!="")
    {
      showDialogBox(Display[6]);
    }

     if(Display[2]==Display[4] && Display[2]==Display[6] && Display[2]!="")
    {
      showDialogBox(Display[2]);
    }

     if(Display[3]==Display[4] && Display[3]==Display[5] && Display[3]!="")
    {
      showDialogBox(Display[3]);
    }

     if(Display[1]==Display[4] && Display[1]==Display[7] && Display[1]!="")
    {
      showDialogBox(Display[1]);
    }

    else if(fill==9)
    {
      showDrawBox();
    }
  }

  void showDialogBox(String Dialog){
    showDialog(
      context: context,
       builder: ((context) {
         return AlertDialog(
            title: Text("Winner is : $Dialog",style: DialogFont,),
            actions: [
               FloatingActionButton.large(
                onPressed: (){
                  Navigator.of(context).pop();
                  ClearScreen();
                },
                child: Center(child: Text("Play Again",style: Buttonfont,)))
            ],
         );
       }
       )
       );

       if(Dialog=="X")
       {
          ExScore++;
       }
       else if(Dialog=="O")
       {
          OhScore++;  
       }
  }
  

  void showDrawBox()
  {
    showDialog(
      context: context,
       builder: ((context) {
         return AlertDialog(
           title: Text("Draw",style: DialogFont,),
          actions: [
               FloatingActionButton.large(
                onPressed: (){
                  Navigator.of(context).pop();
                  ClearScreen();
                },
                child: Center(child: Text("Play Again",style: Buttonfont,)))
            ],
         );
       }));
  }

  // ignore: non_constant_identifier_names
  void ClearScreen()
  {
      setState(() {
      for(int i=0;i<9;i++)
  {
    Display[i] = "";
  }

  fill= 0;
  });
  }


}
