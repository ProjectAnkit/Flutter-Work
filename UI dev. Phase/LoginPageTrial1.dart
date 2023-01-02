import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/LoginImage1.jpeg"),fit: BoxFit.fill)),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
             height: 180,
            ),
            Center(child: Text("FIRE",style:GoogleFonts.langar(color: Colors.red,fontSize: 50)
            )
            ),
            Text("Welcome User",style: GoogleFonts.jost(fontSize: 23,color: Color.fromARGB(255, 247, 129, 19),fontWeight: FontWeight.w500),),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
              child: TextField(
                cursorColor: Colors.black,
                cursorHeight:20,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
              child: TextField(
                cursorColor: Colors.black,
                cursorHeight: 20,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(45)),
              child: Center(child: Text("Sign in")),
            )
          ],
        ),
      ),
    );
  }
}
