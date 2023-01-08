// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main()
{
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

 
  var Input = "";
  var Output = "";

  ButtonClicked(value)
  {
    if(value=="AC")
    {
      if(Input.isNotEmpty)
      {
      Input = "";
      Output = "";
      }
    }
    else if(value=="<")
    {
      if(Input.isNotEmpty) {
        Input = Input.substring(0,Input.length-1);
      }
    }
    else if(value=="=")
    {
      if(Input.isNotEmpty)
      {
      Input  = Input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(Input);
      ContextModel cm = ContextModel();
      var FinalOutput = expression.evaluate(EvaluationType.REAL, cm);
      Output  = FinalOutput.toString();
    }
    }
    else{
      Input = Input + value;
    }
    setState(() {
      
    });
  }

   Widget MyButton(ButtonColor,Buttontext,TextColor){
    return InkWell(
      onTap: () => ButtonClicked(Buttontext),
       child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 80,
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(45),color: ButtonColor),
        child: Center(
          child: Text(Buttontext,style: GoogleFonts.lato(fontSize: 30,color: TextColor),
           ),
          ),
       ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
       body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            height: 360,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(Input,style: GoogleFonts.lato(fontSize: 45,color: Colors.white),)
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(Output,style: GoogleFonts.lato(fontSize: 30,color: Colors.white38),)
                ],
              ),
            ],
           ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(Colors.orange, "AC", Colors.white),
                    MyButton(Colors.grey,"/", Colors.white),
                    MyButton(Colors.grey, "x", Colors.white),
                    MyButton(Colors.orange, "<", Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(Colors.blueGrey, "9", Colors.white),
                    MyButton(Colors.blueGrey,"8", Colors.white),
                    MyButton(Colors.blueGrey, "7", Colors.white),
                    MyButton(Colors.grey, "+", Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(Colors.blueGrey, "6", Colors.white),
                    MyButton(Colors.blueGrey,"5", Colors.white),
                    MyButton(Colors.blueGrey, "4", Colors.white),
                    MyButton(Colors.grey, "-", Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(Colors.blueGrey, "3", Colors.white),
                    MyButton(Colors.blueGrey,"2", Colors.white),
                    MyButton(Colors.blueGrey, "1", Colors.white),
                    MyButton(Colors.grey, ".", Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 90,
                    ),
                    MyButton(Colors.blueGrey,"0", Colors.white),
                    const SizedBox(
                      width: 90,
                    ),
                    MyButton(Colors.orange, "=", Colors.white)
                  ],
                ),
              ],
            ),
          )
        ],
       ),
    );
  }
}
