import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const MyImage(),
            const MyDetails(),
            const MyOptions(),
            const MyDesc(),
          ],
        ),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/2201318.jpg"),fit: BoxFit.cover),),
    );
  }
}

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
      child: Row(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("Hanogi Bridge ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              const Text("Manali , India",style: TextStyle(color: Colors.black45),),
            ],
          ),
          const SizedBox(width: 140,),
          const Icon(Icons.star,color: Colors.red,),
          const SizedBox(width: 2,),
          const Text("45",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}

class MyOptions extends StatelessWidget {
  const MyOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.call,color: Colors.blue,),
              const Text("Contact",style: TextStyle(color: Colors.blue),),
            ],
          ),
         Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.directions,color: Colors.blue,),
              const Text("Direction",style: TextStyle(color: Colors.blue),),
            ],
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.share,color: Colors.blue,),
              const Text("Share",style: TextStyle(color: Colors.blue),),
            ],
          ),
        ],
      ),
    );
  }
}

class MyDesc extends StatelessWidget {
  const MyDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
      child: const Text("Shri Hanogi (Saraswati) Mata Temple located in NH 21 on the way from Mandi to Kullu.  Hanogi mata temple is a scenic temple perched on a mountain cliff on the back of river Beas with beautiful view. The temple is very famous and all the drivers stop over for few minutes. The belief is that the goddess Durga fulfills all the wishes of its devotees who pray here.  Foot Bridge on the river close to the temple is an additional attraction. Rope way is available for those who would like to visit another temple on the other side of the river.\n\nThe story goes that a road engineer was brought in to consult on how to change the road in this area to reduce the danger. The engineer suggested instead to build a temple and indeed: since then, many of the cars that drive by either stop to pay their respects or at the very least, significantly slow down. The result is that indeed, the number of accidents has gone way down. Incidentally, the temple is on a fairly narrow part of the valley and the views are stunning. Aside from paying respects to the goddess inside, it’s well worth a few minutes’ stop to take in the vista..",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
    );
  }
}
