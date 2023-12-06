import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));

    _animation = Tween<double>(begin: 0, end: 2*pi).animate(_controller);

    _controller.repeat();
  } 

  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(_animation.value),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.shade600
              )
            ]),
          ),
        );
          },
        )
      ),
    );
  }
}
