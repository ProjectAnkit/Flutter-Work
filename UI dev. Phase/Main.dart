import 'package:flutter/material.dart';
import 'Pages/homepage.dart';
import 'Pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  // ignore: prefer_const_constructors
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "Login",
      routes: {
        "login":(context) => LoginPage(),
        "home":(context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
