import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ChatPage/Chat&ContactModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contactModel});
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 51,
        child: Stack(
          children: [
            CircleAvatar(foregroundImage: contactModel.iimage,radius: 24,),
          contactModel.select? 
          const Positioned(
              bottom: 4,
              right: 3,
              child: CircleAvatar(backgroundColor: Colors.teal,radius: 11,child: Icon(Icons.check,color: Colors.white,size: 15,),
              )
              ):Container(),
              ]
            ),
      ),
      title: Text(contactModel.Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
      subtitle: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          Text(contactModel.Status,style: GoogleFonts.roboto(fontSize: 15),),
        ],
      ),
    );
  }
}
