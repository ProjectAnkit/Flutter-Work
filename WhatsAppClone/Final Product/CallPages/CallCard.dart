import 'package:classico1/Pages/ChatPage/Chat&ContactModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CallModel.dart';

class CallCard extends StatelessWidget {
  const CallCard({super.key, required this.calls});

  final CallModel calls; 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        child: CircleAvatar(
          backgroundImage: calls.callimage,radius: 24,),
      ),
      title: Text(calls.Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Row(
        children: [
          calls.increcicon,
          Text(calls.Datetime,style: GoogleFonts.roboto(fontSize: 15),),
        ],
      ),
      trailing: IconButton(onPressed: (){}, icon: calls.Callicon,iconSize: 25),
    );
  }
}

class OwnCallCard extends StatelessWidget {
  const OwnCallCard({super.key, required this.cardicon, required this.intro, required this.Cardtitle});
 
  final Icon cardicon;
  final String intro;
  final String Cardtitle;
   

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(178, 2, 133, 89),
          radius: 24,
          child: cardicon,),
      ),
      title: Text(Cardtitle,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Text(intro,style: GoogleFonts.roboto(fontSize: 15),),
    );
  }
}
