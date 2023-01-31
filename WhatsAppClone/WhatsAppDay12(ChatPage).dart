//CONTACT CARD

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


//CREATE GROUP
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ChatPage/Chat&ContactModel.dart';
import 'ContactCard.dart';
import 'SelectContact.dart';

class GroupContact extends StatefulWidget {
  const GroupContact({super.key});

  @override
  State<GroupContact>  createState() => _GroupContactState();
}
class _GroupContactState extends State<GroupContact> {
 
 
  List<ContactModel>MyContacts = [
    ContactModel(Name: "Nikki", Status: "currently Active", iimage: const AssetImage("assets/Profile1.png")),
    ContactModel(Name: "Shera", Status: "currently Active", iimage: const AssetImage("assets/Profile2.jpg")),
    ContactModel(Name: "Neetu", Status: "currently Active", iimage: const AssetImage("assets/Profile3.jpg")),
    ContactModel(Name: "Ashima", Status: "currently Active", iimage: const AssetImage("assets/Profile4.jpg")),
    ContactModel(Name: "Pikachu", Status: "currently Active", iimage: const AssetImage("assets/Profile5.png")),
    ContactModel(Name: "Ronnie", Status: "currently Active", iimage: const AssetImage("assets/Profile6.jpg")),
    ContactModel(Name: "Siera", Status: "currently Active", iimage: const AssetImage("assets/Profile7.jpg")),
  ];

  List<ContactModel>CheckBox = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(178, 2, 133, 89),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title(color: Colors.white, child: const Text("New group")),
             const SizedBox(
              height: 3,
            ),
            Title(color: Colors.white, child: Text("Add participants",style: GoogleFonts.roboto(fontSize: 13),))
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
            ],
          )
        ],
      ),


      body:
          ListView.builder(
            itemCount: MyContacts.length,
            itemBuilder: (context,index){ 
              return InkWell(
                onTap: () {
                  if(MyContacts[index].select==false)
                  {
                      setState(() {
                        MyContacts[index].select=true;
                        CheckBox.add(MyContacts[index]);
                      });
                  }
                  else
                  {
                    setState(() {
                        MyContacts[index].select=false;
                        CheckBox.remove(MyContacts[index]);
                      });
                  }
                },
                child: ContactCard(contactModel: MyContacts[index]));
      })
    );     
  }
}
