import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const MyAppBar(), 
        ],
      )
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(color: Color.fromARGB(255, 57, 128, 105)),
       height: 160,
       child: Column(
        children: [
          const SizedBox(
            height: 60
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text("Whatsapp",style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
                const SizedBox(
                  width: 135,
                ),
                const IconButton(
                  onPressed: null,
                  color: Colors.white,
                  icon: Icon(Icons.search),iconSize: 25,),
                 const IconButton(
                  highlightColor: Colors.white,
                  onPressed: null,
                   icon: Icon(Icons.more_vert),iconSize: 25,),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: Center()),
                ),
                InkWell(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: Center(child: Text("Chats",style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.w400,color: Colors.white),))),
                ),
                 InkWell(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: Center(child: Text("Status",style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.w400,color: Colors.white),))),
                ),
                InkWell(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: Center(child: Text("Calls",style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.w400,color: Colors.white),))),
                ),
              ],
            ),
          )
        ],
       ),
    );
  }
}
