//CallCard

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


//CallPage

import 'package:classico1/Pages/CallPage/CallCard.dart';
import 'package:flutter/material.dart';

import 'CallModel.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {

  List<CallModel>Calls = [
    CallModel(Name: "Nikki", Datetime: "Today,11.45 am", callimage: const AssetImage("assets/Profile1.png"),Callicon: const Icon(Icons.call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_made,size: 15,color: Colors.green,)),
    CallModel(Name: "Shera", Datetime: "Today,9.05 am", callimage: const AssetImage("assets/Profile2.jpg"),Callicon: const Icon(Icons.video_call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_received,size: 15,color: Colors.red,)),
    CallModel(Name: "Nikki", Datetime: "Today,11.45 am", callimage: const AssetImage("assets/Profile1.png"),Callicon: const Icon(Icons.call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_made,size: 15,color: Colors.green,)),
    CallModel(Name: "Shera", Datetime: "Today,9.05 am", callimage: const AssetImage("assets/Profile2.jpg"),Callicon: const Icon(Icons.video_call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_received,size: 15,color: Colors.red,)),
    CallModel(Name: "Nikki", Datetime: "Today,11.45 am", callimage: const AssetImage("assets/Profile1.png"),Callicon: const Icon(Icons.call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_made,size: 15,color: Colors.green,)),
    CallModel(Name: "Shera", Datetime: "Today,9.05 am", callimage: const AssetImage("assets/Profile2.jpg"),Callicon: const Icon(Icons.video_call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_received,size: 15,color: Colors.red,)),
    CallModel(Name: "Nikki", Datetime: "Today,11.45 am", callimage: const AssetImage("assets/Profile1.png"),Callicon: const Icon(Icons.call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_made,size: 15,color: Colors.green,)),
    CallModel(Name: "Shera", Datetime: "Today,9.05 am", callimage: const AssetImage("assets/Profile2.jpg"),Callicon: const Icon(Icons.video_call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_received,size: 15,color: Colors.red,)),
    CallModel(Name: "Nikki", Datetime: "Today,11.45 am", callimage: const AssetImage("assets/Profile1.png"),Callicon: const Icon(Icons.call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_made,size: 15,color: Colors.green,)),
    CallModel(Name: "Shera", Datetime: "Today,9.05 am", callimage: const AssetImage("assets/Profile2.jpg"),Callicon: const Icon(Icons.video_call,color: Color.fromARGB(178, 2, 133, 89),),increcicon: const Icon(Icons.call_received,size: 15,color: Colors.red,)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Calls.length+1,
      itemBuilder: (context, index){
        if(index==0)
        {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const OwnCallCard(cardicon: Icon(Icons.add_link_outlined,size: 25,color: Colors.white,), intro: "Share a link for your WhatsApp call", Cardtitle: "Create a call link"),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 3),
                  child: Text("Recent",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                )),
            ],
          );
        }
        else
        {
          return  CallCard(calls: Calls[index-1]);
        }
      });
  }
}
