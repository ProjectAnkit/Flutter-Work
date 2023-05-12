//HomePage

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/ChatPage/ChatRoom.dart';
import 'package:mychatapplication/ChatPage/CustomWidget/UsersCard.dart';
import 'package:mychatapplication/HomeScreen/SearchPage.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';
import 'package:mychatapplication/Utilities/Models/ChatRoomModel.dart';
import 'package:mychatapplication/Utilities/Models/UserModel.dart';
import 'package:mychatapplication/Utilities/Services/GetUserModelfromid.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});


  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  getUserModel _getUserModel = getUserModel();
 
  @override
  Widget build(BuildContext context) {
     final user = auth.currentUser;
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPageScreen(OwnUser: UserModel(
            email: user!.email,
            imageurl: user.photoURL,
            name: user.displayName,
            phoneNumber: user.phoneNumber,
            uid: user.uid
           ),
           ),
           ),
           );
          }
        ,backgroundColor: Colors.black,child: const Icon(Icons.person_add_alt_sharp,color: Colors.white,),
      ),

      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("connecto",style: GoogleFonts.jost(fontSize: 25)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
            auth.signOut();

          }, icon: const Icon(Icons.logout_outlined)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children:  [
              Expanded(
                child: StreamBuilder(
                  stream: firestore.collection("Chatroom").where("participants.${user!.uid}",isEqualTo: true).snapshots(),
                  builder: (context,snapshot){
                    ChatRoomModel RoomModel = ChatRoomModel();
              
                   if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    );
                   }
              
                   else{
                      QuerySnapshot<Object> dataSnapshot = snapshot.data as QuerySnapshot<Object>;
      
                     
                     return ListView.builder(
                      itemCount: dataSnapshot.docs.length,
                      itemBuilder: (context,index){
                        
                        Map<String,dynamic> roommodel = dataSnapshot.docs[index].data() as Map<String,dynamic>;
                        ChatRoomModel chatRoomModel = RoomModel.fromMap(roommodel);
      
                        Map<String,dynamic> participants = chatRoomModel.participants as Map<String,dynamic>;
                        List<String> participantskeys = participants.keys.toList();
      
                        participantskeys.remove(user.uid);
                        
                        
                        return FutureBuilder(
                        
                        future: _getUserModel.getUserModelfromuid(participantskeys[0].toString()),
                        builder: (context,snapshot){
                          
                          
                          if(snapshot.connectionState == ConnectionState.done)
                          {
                            UserModel targetUser = snapshot.data as UserModel;
                             if(snapshot.hasData)
                             {
                               return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                                    OwnUserModel: UserModel(
                                      email: user.email,
                                      imageurl: user.email,
                                      name: user.displayName,
                                      uid: user.uid
                                    ), 
                                    targetUser: targetUser, 
                                    Chatroom: chatRoomModel)));
                                },
                                 child: Column(
                                  children: [
                                    UserCard(
                                      name: targetUser.name.toString(), 
                                      subtitle: chatRoomModel.lastmessage.toString(), 
                                      imageurl: targetUser.imageurl.toString()),
                                      Divider(color: Colors.grey,thickness: 0.2),
                                  ],
                                 ),
                               );
                             }
                             else{
                              return Container();
                             }
                          }
      
                          else{
                            return Container();
                          }
                        });
                      });
                   }
                  }),
              )
          ],
        ),
      ),
    );
  }
}




//Function to convert uid to UserModel

class getUserModel{
 
    Future<UserModel?> getUserModelfromuid(String uid)async{
    UserModel targetModel = UserModel();
    QuerySnapshot document = await FirebaseFirestore.instance.collection("User").where("id",isEqualTo: uid).get();

    if(document.docs.isNotEmpty)
    {
    Map<String,dynamic> targetUserMap = document.docs[0].data() as Map<String,dynamic>;
    UserModel targetUser = targetModel.fromMap(targetUserMap);
    return targetUser;
    }    
  }
}
