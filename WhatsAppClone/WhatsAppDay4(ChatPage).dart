import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (() {}),backgroundColor: Color.fromARGB(178, 2, 133, 89),child: Icon(Icons.chat)),
          body:ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CustomCard(text: "Sanjay",subtext: "hey",timing: "4:30pm",),
               const CustomCard(text: "Pranay",subtext: "Whats up",timing: "yesterday",),
                const CustomCard(text: "Sunaina",subtext: "Ajj aajana milne",timing: "1:00pm",),
                 const CustomCard(text: "Kanchana",subtext: "subeh de dungi",timing: "12-oct",),
                  const CustomCard(text: "Avish",subtext: "Chal nikal",timing: "10:00am",),
                   const CustomCard(text: "Dhruv",subtext: "Ajj nahi ho payga bro",timing: "8:09am",),
                    const CustomCard(text: "Kruti",subtext: "Hi",timing: "3:01am",),
            ],)
           
        );
      }
  }



class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text, required this.subtext, required this.timing});

  final String text;
  final String subtext;
  final String timing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(radius:25,backgroundColor: Colors.grey, child: Center(child: Icon(Icons.person,color: Colors.white,))),
      title: Text(text,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Row(
        children: [
          const Icon(Icons.done_all,color: Colors.blue,size: 17,),
          const SizedBox(
            width: 2,
          ),
          Text(subtext,style: GoogleFonts.roboto(fontSize: 15),),
        ],
      ),
      trailing: Text(timing),

    );
  }
}


class ChatModel{

}
