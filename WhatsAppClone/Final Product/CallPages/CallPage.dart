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
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add_call,color: Colors.white,),backgroundColor: Color.fromARGB(255, 2, 133, 89),),
      body: ListView.builder(
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
        }),
    );
  }
}
