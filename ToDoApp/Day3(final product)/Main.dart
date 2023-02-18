import 'package:flutter/material.dart';
import 'package:todo/Pages/HomePage.dart';

void main(){
  runApp(Material(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomePage(),
    ),
  ));
}
