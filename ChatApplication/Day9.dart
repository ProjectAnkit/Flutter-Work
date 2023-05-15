//Minor Changes and Bug fixes

//Changes in Chatpage
 AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  HomePageScreen(OwnUser: widget.OwnUserModel,)));
        }, icon: const Icon(Icons.arrow_back)),
        title: ListTile(
          onTap: (){

          },
          leading: CircleAvatar(backgroundImage: NetworkImage(widget.targetUser.imageurl.toString()),),
          title: Text(widget.targetUser.name.toString(),style: GoogleFonts.jost(color: Colors.white),),
          subtitle:  Text(widget.targetUser.email.toString(),style: GoogleFonts.jost(color: Colors.white),),
        ),
        actions: [
          PopupMenuButton(       
              itemBuilder: (context){
                return[
                     PopupMenuItem(
                      onTap: (){
                        firestore.collection("Chatroom").doc(widget.Chatroom!.chatRoomid).set({
                          "unblocked.${widget.targetUser.uid}": false,
                        });
                      },
                      child: Text("block",style: GoogleFonts.jost(),)),


                       PopupMenuItem(
                      onTap: (){
                        firestore.collection("Chatroom").doc(widget.Chatroom!.chatRoomid).set({
                          "unblocked.${widget.targetUser.uid}": true,
                        });
                      },
                      child: Text("Unblock",style: GoogleFonts.jost(),))
                ];
              }),
        ],
      ),



//Loading Services Updated

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychatapplication/HomeScreen/HomePageScreen.dart';
import 'package:mychatapplication/HomeScreen/IntroPage.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';
import 'package:mychatapplication/Utilities/Models/UserModel.dart';

class loadingservice{

   void movescreen(BuildContext context)async{

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final firestore = FirebaseFirestore.instance;
    final userdoc  = await firestore.collection("User").doc(user?.uid).get();

    if(user==null)
    {
       Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
     });
    }
    
    else if(user.emailVerified && user!=null){
      if(userdoc.exists)
      {
        Timer(Duration(seconds: 3), () {
          Map<String,dynamic>? userdata = userdoc.data() as Map<String,dynamic>;
          String profilepic = userdata["profile url"].toString();
          String name = userdata["name"].toString();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen(
          OwnUser: UserModel(
            email: user.email,
            imageurl: profilepic,
            name: name,
            uid: user.uid,
          ),
        )));
       });
      }

      else{
        Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Intropage()));
     });
      }
      
    }
   }  
}




//MessageTextInputField Updated

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class MyMessageSpace extends StatelessWidget {
  const MyMessageSpace({super.key, required this.controller, required this.hint, this.ontap});

  final TextEditingController controller;
  final String hint;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(35),border: Border.all(color: Color.fromARGB(255, 209, 209, 209))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                    child: TextFormField(
                      maxLength: null,
                      maxLines: 4,
                      minLines: 1,
                            controller: controller,
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: hint,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),

           InkWell(
                  onTap: ontap,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(45)),
                    child: const Center(
                      child: Icon(Icons.send,color: Colors.white),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
