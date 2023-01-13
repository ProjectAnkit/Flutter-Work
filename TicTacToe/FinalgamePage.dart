import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {

  bool tap = true;

  List<String>display = ["","","","","","","","","",];

  int Oscore = 0;
  int Xscore = 0;
  int filled = 0;

  static var Myfont = GoogleFonts.jost(color: Colors.white,fontSize: 30);

  static var DialogFont =  GoogleFonts.jost(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25);

  static var ButtonFont = GoogleFonts.jost(color: Colors.blue,fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(child: Text("Scoreboard",style: Myfont,),),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal:10.0),
                       child: Column(
                        children: [
                          Text("Player O",style: Myfont,),
                          Text(Oscore.toString(),style: Myfont,)
                        ],
                       ),
                     ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Column(
                        children: [
                          Text("Player X",style: Myfont,),
                          Text(Xscore.toString(),style: Myfont,)
                        ],
                     ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                 itemBuilder: ((context,int index) {
                   return GestureDetector(
                    onTap: (() => tapped(index)),
                     child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(child: Text(display[index],style:Myfont,)),
                     ),
                   );
                 })),
            ),
          ),
        ],
      ),
    );
  }

  
  void tapped(int index){
    setState(() {
      if(tap && display[index]=="")
      {
         display[index] = "O";
         filled++;
      }
      else if(!tap && display[index]=="")
      {
         display[index] = "X";
         filled++;
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
    else if(filled == 9)
    {
      showDraw();
    }
  }




   void showDraw(){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context){
        return AlertDialog(
          title: Text("Draw",style: DialogFont,),
          actions: [
            FloatingActionButton.large(
              backgroundColor: Colors.white,
              child: Text("Play Again",style: ButtonFont,),
              onPressed: (){
                ClearScreen();
               Navigator.of(context).pop();
             }),    
          ],
        );
    }
  ); 
}


  
  void showwinner(String winner){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context){
        return AlertDialog(
          title: Text("Winner is : "+winner,style: DialogFont,),
          actions: [
            FloatingActionButton.large(
              backgroundColor: Colors.white,
              child: Text("Play Again",style: ButtonFont,),
              onPressed: (){
                ClearScreen();
               Navigator.of(context).pop();
             }),    
          ],
        );
    }
  ); 

  setState(() {
  if(winner=="O")
  {
    Oscore++;
  }
  else if(winner=="X")
  {
    Xscore++;
  }
});
}





void ClearScreen()
{
  setState(() {
  for(int i=0;i<9;i++)
  {
    display[i]="";
  }
}
);

filled = 0;
}


}
