//Community Page

import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 5,),
          Center(child: Image.asset("assets/Community.png",height: 230,width: 280,)),
          const Center(child: Text("Introducing communities",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)),
          const SizedBox(
            height: 7,
          ),
          const Center(child: Text("Easily organise your related groups and send",style: TextStyle(fontSize: 18,color: Colors.grey),)),
          const SizedBox(
            height: 3,
          ),
          const Center(child: Text("announcements. Now,your communities, like",style: TextStyle(fontSize: 18,color: Colors.grey),)),
          const SizedBox(
            height: 3,
          ),
          const Center(child: Text("neighbourhoods or schools, can have their",style: TextStyle(fontSize: 18,color: Colors.grey),)),
          const SizedBox(
            height: 3,
          ),
          const Center(child: Text("own space.",style: TextStyle(fontSize: 18,color: Colors.grey),)),
          SizedBox(
            height: 28,
          ),
          InkWell(
            onTap: (){},
            child: Center(
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(color: Color.fromARGB(178, 2, 133, 89),borderRadius: BorderRadius.circular(25)),
                child: Center(child: Text("Start your community",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
