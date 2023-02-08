import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ChatPage/Chat&ContactModel.dart';
import 'StatusModel.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status});
  final statusModel status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 51,
        child: Stack(
          children: [
            CircleAvatar(foregroundImage: status.statusimage,radius: 24,),
              ]
            ),
      ),
      title: Text(status.Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          Text(status.time,style: GoogleFonts.roboto(fontSize: 15),),
        ],
      ),
    );
  }
}


class OwnCard extends StatelessWidget {
  const OwnCard({super.key, required this.statusimage, required this.Name, required this.Desc});
  
  final AssetImage statusimage;
  final String Name;
  final String Desc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 51,
        child: Stack(
          children: [
            CircleAvatar(foregroundImage: statusimage,radius: 24,),
            const Positioned(
              bottom: 4,
              right: 3,
              child: CircleAvatar(backgroundColor: Colors.white,radius: 11,child: Icon(Icons.add_circle,color: Color.fromARGB(255, 2, 133, 89),size: 24,),
              ),
              ),
              ]
            ),
      ),
      title: Text(Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          Text(Desc,style: GoogleFonts.roboto(fontSize: 15),),
        ],
      ),
    );
  }
}
