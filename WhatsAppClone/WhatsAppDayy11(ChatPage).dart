import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ChatModel.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {

  List<ContactModel>MyContacts = [
    ContactModel(Name: "Nikki", Status: "currently Active", iimage: const AssetImage("assets/Profile1.png")),
    ContactModel(Name: "Shera", Status: "currently Active", iimage: const AssetImage("assets/Profile2.jpg")),
    ContactModel(Name: "Neetu", Status: "currently Active", iimage: const AssetImage("assets/Profile3.jpg")),
    ContactModel(Name: "Ashima", Status: "currently Active", iimage: const AssetImage("assets/Profile4.jpg")),
    ContactModel(Name: "Pikachu", Status: "currently Active", iimage: const AssetImage("assets/Profile5.png")),
    ContactModel(Name: "Ronnie", Status: "currently Active", iimage: const AssetImage("assets/Profile6.jpg")),
    ContactModel(Name: "Siera", Status: "currently Active", iimage: const AssetImage("assets/Profile7.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(178, 2, 133, 89),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title(color: Colors.white, child: const Text("Select Contact")),
            Title(color: Colors.white, child: Text("179 Contacts",style: GoogleFonts.roboto(fontSize: 13),))
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              PopupMenuButton(itemBuilder: ((context) {
                return [
                   const PopupMenuItem(child: Text("Invite a friend"),value: "Invite a friend"),
                   const PopupMenuItem(child: Text("Contacts"),value: "Contacts",),
                   const PopupMenuItem(child: Text("Refresh") ,value: "Refresh",),
                   const PopupMenuItem(child: Text("Help"),value: "Help",),
                ];
              }))
            ],
          )
        ],
      ),


      body:
          ListView.builder(
            itemCount: MyContacts.length+3,
            itemBuilder: (context,index){
             if(index==0)
             {
              return ButtonCard(icon: Icon(Icons.group,color: Colors.white,), text: 'New group',);
             }
             else if(index==1)
             {
              return ButtonCard(icon: Icon(Icons.person_add,color: Colors.white), text: 'New contact',);
             }
             else if(index==2)
             {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonCard(icon: Icon(Icons.groups,color: Colors.white), text: 'New community',),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                    child: Text("Contacts on WhatsApp",style: GoogleFonts.roboto(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w700),),
                  )
                ],
              );
             }
             else{
              return CustomCard(contactModel: MyContacts[index-3]);
             }
      })
    );     
  }
}


class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.contactModel});
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(foregroundImage: contactModel.iimage,),
            title: Text(contactModel.Name,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
            subtitle: Row(
              children: [
                const SizedBox(
                  width: 2,
                ),
                Text(contactModel.Status,style: GoogleFonts.roboto(fontSize: 15),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
    ButtonCard({super.key, required this.icon, required this.text});

    final Icon icon;
    final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor:  Color.fromARGB(178, 2, 133, 89),child: Center(child: icon,),),
            title: Text(text,style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),),
          ),
        ],
      ),
    );
  }
}
