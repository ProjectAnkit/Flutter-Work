//Designed HomePage for Game

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
            height: 60,
          ),
          Container(
            child: Center(
              child: Text("TicTacToe",
              style: GoogleFonts.jost(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white),
                ),
                ),
                ),
          AvatarGlow(
             endRadius: 165,
             glowColor: Colors.white,
             repeat: true,
             duration: Duration(seconds: 1),
             child: CircleAvatar(
              radius: 100,
              foregroundImage: AssetImage("assets/GameLogo.png"),
              backgroundColor: Colors.grey[400]),            
             ),
             SizedBox(
              height: 50,
             ),
             Container(
                child: Text("Designed by ProjectAnkit",style: GoogleFonts.jost(color: Colors.grey[300]),),
             ),
           SizedBox(
            height: 150,
           ),
           InkWell(
            onTap: (){
              Navigator.pushNamed(context, MyRoutes.GameRoute);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 80,
              width: 340,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey),
              child: Center(child: Text("PLAY",style: GoogleFonts.jost(color: Colors.white,fontSize: 40),)),
              ),
           )
        ],
      ),
    );
  }
}
