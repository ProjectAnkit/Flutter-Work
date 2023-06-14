//ProfilePage

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
             
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.grey.shade300,shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(Icons.person,color: Colors.black,size: 40,),
                    ),
                  ),
      
                  const SizedBox(
                    width: 30,
                  ),
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Niraj Gupta",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),),
                      Text("999 8888 666",style: GoogleFonts.poppins(color: Colors.grey),),
                      Text("nirajgupta8889@gmail.com",style: GoogleFonts.poppins(color: Colors.grey),),
      
                      const SizedBox(
                        height: 3,
                      ),
      
                      InkWell(
                        onTap: (){
                          
                        },
                        child: Text("change details",style: GoogleFonts.poppins(color: Colors.deepPurple),)),
                    ],
                  )
                ],
               ),
             ),
      
             const SizedBox(
              height: 30,
             ),
      
             MyProfileOption(ontap: (){},settingicon: Icons.person,title: "Personal details",subtitle: "name, phone, email"),
             MyProfileOption(ontap: (){}, settingicon: Icons.work_history_sharp,title: "My Orders",subtitle: "see your all order details",),
             MyProfileOption(title: "Refer your friend", subtitle: "refer and earn upto 10k rewards", settingicon: Icons.handshake, ontap: (){}),
             MyProfileOption(title: "Help Center", subtitle: "get help from our 24x7 customer support", settingicon: Icons.headset_mic, ontap: (){}),
             MyProfileOption(title: "Log out", subtitle: "log out account from this device", settingicon: Icons.logout_outlined, ontap: (){}),

            Divider(thickness: 0.8,color: Colors.grey.shade300,),

          ],
        ),
      ),
    );
  }
}


class MyProfileOption extends StatelessWidget {
  const MyProfileOption({super.key, required this.title, required this.subtitle, required this.settingicon, required this.ontap});

  final String title;
  final String subtitle;
  final IconData settingicon;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [   
            Divider(thickness: 0.8,color: Colors.grey.shade300,),

           Column(
            children: [
              ListTile(
                onTap: ontap,
                leading: CircleAvatar(backgroundColor: Colors.white,child: Center(child: Icon(settingicon,color: Colors.deepPurple,),),),
                title: Text(title,style: GoogleFonts.poppins(color: Colors.black),),
                subtitle: Text(subtitle,style: GoogleFonts.poppins(color: Colors.grey),),
              )
            ],
           ),
      ],
    );
  }
}
