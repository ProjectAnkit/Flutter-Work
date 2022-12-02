import 'package:flutter/material.dart';

void main()
{
   runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myhome(),
   ));
}

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.kitchen),
                  const Text("PREP :"),
                  const Text("25 min",style: TextStyle(color: Colors.grey),),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.timer),
                  const Text("COOK :"),
                  const Text("1 hr",style: TextStyle(color: Colors.grey),),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.dining),
                  const Text("DINING :"),
                  const Text("4-5 Ọ",style: TextStyle(color: Colors.grey),),
                ],
              ),
            ],
          ),
        )
      ],
    ),
    );
  }
}
