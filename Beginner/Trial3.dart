import 'package:flutter/material.dart';

void main()
{
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: Newbutton()),
    );
  }
}

class Newbutton extends StatelessWidget {
  const Newbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print("button is Clicked");
      },
      child: Container(
        height: 50.0,
        width: 300,
        // ignore: sort_child_properties_last
        child: const Center(child: Text("Gesture Button",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22))),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.deepPurple,
        ),
        ),
    );
  }
}
