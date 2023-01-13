import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GamePage.dart';
import 'HomePage.dart';

void main()
{
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(context) => HomePage(),
        'Game':(context) => TicTacToe(),
      },
  ));
}

class MyRoutes{
  static String HomeRoute = 'home';
  static String GameRoute = 'Game';
}
