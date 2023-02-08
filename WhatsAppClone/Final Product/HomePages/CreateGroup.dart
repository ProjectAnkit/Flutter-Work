import 'package:classico1/Pages/Homepages/AvatarCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          Stack(
            children: [
              
              ListView.builder(
              itemCount: MyContacts.length+1,
              itemBuilder: (context,index){ 
                if(index==0)
                {
                  return Container(
                    height: CheckBox.length>0?85:6,
                  );
                }
                return InkWell(
                  onTap: () {
                    if(MyContacts[index-1].select==false)
                    {
                        setState(() {
                          MyContacts[index-1].select=true;
                          CheckBox.add(MyContacts[index-1]);
                        });
                    }
                    else
                    {
                      setState(() {
                          MyContacts[index-1].select=false;
                          CheckBox.remove(MyContacts[index-1]);
                        });
                    }
                  },
                  child: ContactCard(contactModel: MyContacts[index-1]));
                }),
                
                CheckBox.length>0?
                  Column(
                  children: [
                    Container(
                    height: 70,
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MyContacts.length,
                      itemBuilder: ((context, index) {

                        if(MyContacts[index].select==true)
                        {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                 MyContacts[index].select=false;
                                 CheckBox.remove(MyContacts[index]);
                              });
                            },
                            child: AvatarCard(contact: MyContacts[index],));
                        }
                        else
                        {
                          return Container();
                        }
                      })),
                    ),
                    const Divider(),
                  ],
                ):Container(
                ),   
            ]
          )
    );     
  }
}
