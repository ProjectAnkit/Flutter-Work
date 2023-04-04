import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/NewModel.dart';
import 'package:http/http.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

   late final AnimationController _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat();

  @override
  void dispose(){
   super.dispose();

   _animationController.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const Nextpage()))));
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             AnimatedBuilder(
              animation: _animationController,
              builder: ((context, child) {
                return Transform.rotate(
                  angle: _animationController.value * 2.0 * pi,
                  child: child,
                  );
                  
              } ),
              child: const Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: Image(image: AssetImage("images/coronavirus.png")),)),
              ))
          ],
        ),
      ),
    );
  }
}
