import 'package:classico1/Pages/ChatPage/Chat&ContactModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contact});
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
      child: contact.select? Column(
        children: [
          // ignore: prefer_const_constructors
          Stack(
            children: [
              CircleAvatar(foregroundImage: contact.iimage,radius: 24,),

            const Positioned(
                bottom: 3,
                right: 0,
                child: CircleAvatar(backgroundColor: Colors.grey,radius: 10,child: Icon(Icons.clear,color: Colors.white,size: 12,),
                )
                )
                ]
              ),
          const SizedBox(
            height: 2,
          ),
          Text(contact.Name,style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w600),)
        ],
      ):Container(),
    );
  }
}
