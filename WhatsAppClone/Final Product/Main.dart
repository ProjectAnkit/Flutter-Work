import 'package:classico1/Pages/ChatPage/Chat&ContactModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/Homepages/HomePage.dart';
import 'Pages/ChatPage/NewPage.dart';

void main()
{
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home':(context) => HomePage(),
    },
  ));
}
