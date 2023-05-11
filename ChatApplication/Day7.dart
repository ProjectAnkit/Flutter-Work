//SearchPage (updated)

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/ChatPage/ChatRoom.dart';
import 'package:mychatapplication/ChatPage/CustomWidget/UsersCard.dart';
import 'package:mychatapplication/Utilities/Models/ChatRoomModel.dart';
import 'package:mychatapplication/Utilities/Models/UserModel.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key, required this.OwnUser});
  final UserModel OwnUser;

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {


  final _searchcontroller = TextEditingController();

  final firestore = FirebaseFirestore.instance;


  Future <ChatRoomModel?> getChatRoomid(UserModel targetUser)async{
    
    ChatRoomModel chatRoom = ChatRoomModel();
    ChatRoomModel finalChatroom;

    QuerySnapshot snapshot = await firestore.collection("Chatroom").where("participants.${widget.OwnUser.uid}",isEqualTo: true).where("participants.${targetUser.uid}",isEqualTo: true).get();


    if(snapshot.docs.isNotEmpty){
      log("already exist");
      Map<String,dynamic> exisChatroom = snapshot.docs[0].data() as Map<String,dynamic>;

      ChatRoomModel existingChatroom = chatRoom.fromMap(exisChatroom);
      finalChatroom = existingChatroom;
      
      return finalChatroom;
    }

    else{

     ChatRoomModel newChatRoom = ChatRoomModel(
      chatRoomid: DateTime.now().millisecondsSinceEpoch.toString(),
      lastmessage: "",
      participants: {
       widget.OwnUser.uid.toString(): true,
        targetUser.uid.toString(): true,
      }
     );
     await firestore.collection("Chatroom").doc(newChatRoom.chatRoomid).set(newChatRoom.toMap());
     finalChatroom = newChatRoom;
     return finalChatroom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text("connecto",style: GoogleFonts.jost(fontSize: 25),),
        centerTitle: true,
        
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
      
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                     height: 60,
                     width: MediaQuery.of(context).size.width*0.8,
                     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(65),border: Border.all(color: Colors.grey)),
                     child: Padding(
                       padding: const EdgeInsets.only(left: 14.0),
                       child: Center(
                         child: TextFormField(
                           controller: _searchcontroller,
                           decoration:  InputDecoration(
                             border: InputBorder.none,
                             hintText: "Search user",
                             hintStyle: GoogleFonts.jost(),
                           ),
                         ),
                       ),
                     ),
                ),

                IconButton(onPressed: (){setState(() {});}, icon: Icon(Icons.search), color: Colors.black,)
              ],
            ),
      
            const SizedBox(
              height: 5,
            ),
      
            const Divider(),
      
            const SizedBox(
              height: 10,
            ),
            
      
            StreamBuilder(
              stream: firestore.collection("User").where("email",isGreaterThanOrEqualTo: _searchcontroller.text.toString(),isLessThan: _searchcontroller.text.toString()+ "z").where("email",isNotEqualTo: widget.OwnUser.email).snapshots(),
              builder: ((context, snapshot){    

                if(snapshot.connectionState == ConnectionState.waiting){
                  
                  return Text("loading...",style: GoogleFonts.jost(),);
                }
                
                else if(snapshot.data!.docs.isEmpty)
                {
                   return Text("no results found",style: GoogleFonts.jost(),);
                }


                else {
                QuerySnapshot<Object> datasnapshot = snapshot.data as QuerySnapshot<Object>;
                UserModel searchedUser = UserModel();
                
                 return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      Map<String,dynamic> userModel = datasnapshot.docs[index].data() as Map<String,dynamic>;
                      searchedUser.fromMap(userModel);
                       return InkWell(
                         onTap: ()async{
                          ChatRoomModel? chatroom = await getChatRoomid(searchedUser);

                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
                            Chatroomid: chatroom!.chatRoomid.toString(), 
                            OwnUserModel: widget.OwnUser, 
                            targetUser: searchedUser, )));
                         },
                         child: UserCard(
                          email: searchedUser.email.toString(),
                          imageurl: searchedUser.imageurl.toString(),
                          name:searchedUser.name.toString(),
                          uid: searchedUser.uid.toString(),
                         ),
                       );
                    }),
                );
                }

              })
              ),
          ],
        ),
      ),
    );
  }
}





//ChatPage

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/ChatPage/Utilities/MyTextSpace.dart';
import 'package:mychatapplication/Utilities/Models/ChatModel.dart';
import 'package:mychatapplication/Utilities/Models/UserModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.Chatroomid, required this.OwnUserModel, required this.targetUser});

  final String Chatroomid;
  final UserModel OwnUserModel;
  final UserModel targetUser;
  

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController _msgcontroller = TextEditingController();
  final firestore = FirebaseFirestore.instance;

   
   
   
   void sendmessage()async{
    
    String msg = _msgcontroller.text.toString();
      
     if(msg.isNotEmpty)
     {
      ChatModel message = ChatModel(
      chatid: DateTime.now().millisecondsSinceEpoch.toString(),
      message: msg,
      seen: false,
      sender: widget.OwnUserModel.uid,
      time: DateTime.now().toString(),
    );

    firestore.collection("Chatroom").doc(widget.Chatroomid).collection("messages").doc(message.chatid).set(message.toMap());
    _msgcontroller.clear();
    log("message sent");
     }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: ListTile(
          onTap: (){

          },
          leading: CircleAvatar(backgroundImage: NetworkImage(widget.targetUser.imageurl.toString()),),
          title: Text(widget.targetUser.name.toString(),style: GoogleFonts.jost(color: Colors.white),),
          subtitle:  Text(widget.targetUser.email.toString(),style: GoogleFonts.jost(color: Colors.white),),
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.more_vert,color: Colors.white,size: 30,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
          child: Column(
            children:  [
                 Expanded(
                   child: StreamBuilder(
                    stream: firestore.collection("Chatroom").doc(widget.Chatroomid).collection("messages").orderBy("time",descending: true).snapshots(),
                    builder: (context,snapshot){
                    
                       if(snapshot.connectionState == ConnectionState.active){
                      ChatModel chatmodel = ChatModel();
                      QuerySnapshot<Object> datasnapshot = snapshot.data as QuerySnapshot<Object>;
                 
                      return ListView.builder(
        
                        reverse: true,
                        itemCount: datasnapshot.docs.length,
                        itemBuilder: (context,index){
                          
                          Map<String,dynamic> message = datasnapshot.docs[index].data() as Map<String,dynamic>;
                          ChatModel msg = chatmodel.fromMap(message);
                          return Row(
                            mainAxisAlignment: msg.sender==widget.targetUser.uid?MainAxisAlignment.start:MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                  decoration: BoxDecoration(color:msg.sender==widget.targetUser.uid? Colors.black54:Colors.grey[400],borderRadius: BorderRadius.circular(35)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(msg.message.toString(),style: GoogleFonts.jost(fontSize: 18,color: Colors.white),),
                                  )),
                              ),
                            ],
                          );
                        });
                 
                    }
                    else{
                      return const Center(child: CircularProgressIndicator(color: Colors.black),);
                    }
                   }),
                 ),
               
                const SizedBox(
                  height: 3,
                ),
        
               Align(
                alignment: Alignment.bottomCenter,
                 child: MyMessageSpace(
                  controller: _msgcontroller,
                  hint: "Type your message",
                  ontap: sendmessage,
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}

