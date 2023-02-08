import 'package:classico1/Pages/StatusPage/StatusCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'StatusModel.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  List<statusModel>MyStatus = [
    statusModel(Name: "Nikki", time: "Today,11.45 am", statusimage: const AssetImage("assets/Profile1.png")),
    statusModel(Name: "Shera", time: "Today,9.05 am", statusimage: const AssetImage("assets/Profile2.jpg")),
    statusModel(Name: "Neetu", time: "Today,4:21 am", statusimage: const AssetImage("assets/Profile3.jpg")),
    statusModel(Name: "Ashima", time: "Yesterday,8:21 pm", statusimage: const AssetImage("assets/Profile4.jpg")),
    statusModel(Name: "Pikachu", time: "Yesterday,6:54 pm", statusimage: const AssetImage("assets/Profile5.png")),
    statusModel(Name: "Ronnie", time: "Yesterday,4:34 pm", statusimage: const AssetImage("assets/Profile6.jpg")),
    statusModel(Name: "Siera", time: "Yesterday,11:04 am", statusimage: const AssetImage("assets/Profile7.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(onPressed: () {},backgroundColor: Color.fromARGB(255, 236, 234, 234),child: const Icon(Icons.edit,color: Color.fromARGB(255, 103, 101, 101),),)),
            SizedBox(
              height: 15,
            ),
          FloatingActionButton(onPressed: () {},backgroundColor: const Color.fromARGB(255, 2, 133, 89),child: const Icon(Icons.camera_alt,color: Colors.white,),),
        ],
      ),
      body: ListView.builder(
        itemCount: MyStatus.length+1,
        itemBuilder: ((context, index) {
          if(index==0)
          {
            return Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const InkWell(
                  child: OwnCard(Name: "My status", Desc: "Tap to add status update", statusimage: AssetImage("assets/Profile.jpg"))),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0,vertical: 3),
                      child: Text("Recent updates",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500),),
                    ))
              ],
            );
          }
          else{
            return InkWell(child: StatusCard(status: MyStatus[index-1]));
          }
        }),
      ),
    );
  }
}
