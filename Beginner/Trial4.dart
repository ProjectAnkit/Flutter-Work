import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(child: Counterinc()),
    )
  ));
}

class Counterinc extends StatefulWidget {
  const Counterinc({super.key});

  @override
  State<Counterinc> createState() => _CounterincState();
}

class _CounterincState extends State<Counterinc> {

  int Counter = 0;

  void Increment(){
    setState(() {
      Counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
      ElevatedButton(onPressed: (){Increment();}, child: Text("Increment")),
      SizedBox(child: Text("  Counter : $Counter")),
     ],
    );
  }
}
