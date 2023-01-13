import 'package:avatar_glow/avatar_glow.dart';
import 'package:classico1/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Center(child: Text("TicTacToe",style: GoogleFonts.jost(fontSize: 55,color: Colors.white),)),
          SizedBox(
            height: 30,
          ),
          Container(
            child: AvatarGlow(
              endRadius: 165,
              duration: Duration(seconds: 3),
              glowColor: Colors.white,
              repeat: true,
              child: Container(
                decoration: BoxDecoration(border: Border.all(style: BorderStyle.none)),
                child: Container(
                  child: CircleAvatar(
                    foregroundImage: AssetImage("assets/GameLogo.png"),
                    backgroundColor: Colors.grey[900],
                    radius: 80,
                  ),
                ),
              ),
              ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Text("@Powered by ProjectAnkit",style: GoogleFonts.jost(color: Colors.grey,fontSize: 15),),
          ),
          SizedBox(
            height: 90,
          ),
          InkWell(
            onTap: MovetoPage,
            splashColor: Colors.grey[800],
            child: AnimatedContainer(
              height: 60,
              width: 340,
              duration: Duration(milliseconds: 3),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25)),
              child: Center(child: Text("Play Game",style: GoogleFonts.jost(color: Colors.white,fontSize: 25),)),
              ),
              
          )
        ],
      ),
    );
  }

  void MovetoPage()
  {
    Navigator.pushNamed(context, MyRoutes.GameRoute);
  }
}
