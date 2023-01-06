import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var Input = "";
  var Output = "";
  var operator = "";
  
  onButtonClicked(value)
  {
    if(value=="AC")
    {
      Input = "";
      Output = "";
    }
    else if(value=="<")
    {
      if(Input.isNotEmpty)
      {
        Input = Input.substring(0,Input.length-1);
      }
    }
    else if(value=="=")
    {
      if(Input.isNotEmpty)
      {
        var UserInput = Input;
        Input = Input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(Input);
        ContextModel cm = ContextModel();
        var Finalval = expression.evaluate(EvaluationType.REAL, cm);
        Output = Finalval.toString();
      }
    }
    else{
      Input = Input+value;
    }
    setState(() {
      
    });
  }

  Widget Button({required String text,required Color colour}){
  return InkWell(
    onTap: () => onButtonClicked(text),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              height: 80,
              width: 80,
              decoration: BoxDecoration(color: colour,borderRadius: BorderRadius.circular(40)),
              child: Center(child: Text(text,style: GoogleFonts.lato(fontSize: 24),)),
            ),
          );
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              height: 360,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        Text(Input,style: GoogleFonts.jost(fontSize: 50,color: Colors.white),),  
                    ],
                  ),
                  const SizedBox(
                     height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        Text(Output,style: GoogleFonts.jost(fontSize: 30,color: Colors.white38),)
                    ],
                  )
                ],
                
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Button(text: "AC", colour: Colors.orange,),
                      Button(text: "/", colour: Colors.grey,),
                      Button(text: "x", colour: Colors.grey,),
                      Button(text: "<", colour: Colors.orange,),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Button(text: "9", colour: Colors.white,),
                      Button(text: "8", colour: Colors.white,),
                      Button(text: "7", colour: Colors.white,),
                      Button(text: "+", colour: Colors.grey,),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Button(text: "6" ,colour: Colors.white,),
                      Button(text: "5", colour: Colors.white,),
                      Button(text: "4", colour: Colors.white,),
                      Button(text: "-", colour: Colors.grey,),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Button(text: "3",colour: Colors.white,),
                      Button(text: "2", colour: Colors.white,),
                      Button(text: "1", colour: Colors.white,),
                      Button(text: ".", colour: Colors.grey,),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        width: 90,
                      ),
                      Button(text: "0", colour: Colors.white,),
                      const SizedBox(
                        width: 90,
                      ),
                      Button(text: "=", colour: Colors.orange,),
                    ],
                  ),
                ],
              ),
              
            )
          ],
        )
    );
  }
}








  
  
