import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isbuttonpressed = false;

  void buttonpressed(){
    setState((){
      if(isbuttonpressed==false)
      {
        isbuttonpressed=true;
      }
      else if(isbuttonpressed==true)
      {
        isbuttonpressed=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
       body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/LoginImage1.jpg"),fit: BoxFit.fill)),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    // ignore: sort_child_properties_last
                    child: Icon(Icons.person,
                    color: Colors.black,size: 60),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  const SizedBox(
                    height:30,
                  ),
                  Text("Hello User",
                  style: GoogleFonts.jost(
                    textStyle: const TextStyle(
                      fontSize: 30,color: Colors.black,
                      fontWeight: FontWeight.w500),
                      ),
                      ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text("Welcome back, we miss you",style: GoogleFonts.jost(textStyle: const TextStyle(fontSize: 25,color: Colors.black,))),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 245, 245),
                      border: Border.all(color: const Color.fromARGB(255, 159, 155, 155),
                      ),
                      borderRadius: BorderRadius.circular(25)
                      ),
                    child: const TextField(
                      decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 245, 245),
                      border: Border.all(color: const Color.fromARGB(255, 159, 155, 136),
                      ),
                      borderRadius: BorderRadius.circular(25)
                      ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NewButton( 
                    onTap:  buttonpressed,
                     isbuttonpressed: isbuttonpressed,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Not a member?",style: GoogleFonts.jost(textStyle: const TextStyle(color: Colors.black,),
                          ),
                          ),
                          Text("Register now",style: GoogleFonts.jost(textStyle: const TextStyle(color: Colors.blue,),
                          ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ),
         ),
       ),
    );
  }
}


class NewButton extends StatelessWidget {
   NewButton({super.key, this.onTap,required this.isbuttonpressed});

  final onTap;
  bool isbuttonpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 202, 167),
                    borderRadius: BorderRadius.circular(25),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow:isbuttonpressed?[
                      //no shadow
                    ]: [
                      // ignore: prefer_const_constructors
                      BoxShadow(
                        offset:  Offset(-2,-2),
                        blurRadius: 2.0,
                        spreadRadius: 1,
                        color: Colors.black
                      ),
                      // ignore: prefer_const_constructors
                      BoxShadow(
                        offset:  Offset(1,1),
                        blurRadius: 2.0,
                        spreadRadius: 1,
                        color: Color.fromARGB(255, 192, 187, 187)
                      ),
                    ]
                    ),
                  child: Center(child:
                  Text("Sign in",
                  style: GoogleFonts.jost(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  ),
                  ),
                  ),
      ),
    );
  }
  }
