 import 'dart:developer';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    log("build Screen");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Jaye Milton"),
            subtitle: Text("makes the career in body building"),
            trailing: IconButton(onPressed: (){

            }, icon: LikeButton()),
          )
        ],
      ),
    );
  }
}


class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin{

  AnimationController? _controller;
  Animation? _coloranimation;
   bool isFav = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 400));

    _coloranimation = ColorTween(begin: Colors.grey.shade400,end: Colors.red).animate(_controller!.view);

    _controller!.addStatusListener((status) {
      if(status == AnimationStatus.completed)
      {
        setState(() {
          isFav = true;
        });
      }

       if(status == AnimationStatus.reverse)
      {
        setState(() {
          isFav = false;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    log("build Button");
    return AnimatedBuilder(
      animation: _controller!.view, 
      builder: (context,_){
        return IconButton(onPressed: (){

           isFav? _controller!.reverse(): _controller!.forward();

        }, icon: Icon(Icons.favorite,color: _coloranimation!.value,));
      });
  }
}
