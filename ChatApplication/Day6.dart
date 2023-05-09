//SearchPageScreen

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';
import 'package:mychatapplication/ChatPage/CustomWidget/UsersCard.dart';
import 'package:mychatapplication/Utilities/Models/UserModel.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {


  final _searchcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text("connecto",style: GoogleFonts.jost(fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
            auth.signOut();

          }, icon: const Icon(Icons.logout_outlined)),
        ],
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
              stream: firestore.collection("User").where("email",isGreaterThanOrEqualTo: _searchcontroller.text.toString(),isLessThan: _searchcontroller.text.toString()+ "z").snapshots(),
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
                       return UserCard(
                        email: searchedUser.email.toString(),
                        imageurl: searchedUser.imageurl.toString(),
                        name:searchedUser.name.toString(),
                        uid: searchedUser.uid.toString(),
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





//UserModel
class UserModel {

  String? name;
  String? email;
  String? phoneNumber;
  String? uid;
  String? imageurl;
  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.uid,
    this.imageurl,
  });
  

  UserModel fromMap(Map<String,dynamic> map){
    name = map['name'];
    email = map['email'];
    phoneNumber = map['phone number'];
    uid = map['id'];
    imageurl = map['profile url'];

    return UserModel(name: name, email: email, phoneNumber: phoneNumber, uid: uid, imageurl: imageurl);
  }
  

  Map<String,dynamic> toMap(){
    return {
      "uid" : uid,
      "email" : email,
      "phone number" : phoneNumber,
      "name" : name,
      "profile url" : imageurl,

    };
  }
}








//ChatPage
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/ChatPage/CustomWidget/ChatTiles.dart';
import 'package:mychatapplication/ChatPage/Utilities/MyTextSpace.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.Useruid, required this.name, required this.email, required this.image});
  final String Useruid;
  final String name;
  final String email;
  final String image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _msgcontroller = TextEditingController();

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
          leading: CircleAvatar(backgroundImage: NetworkImage(widget.image),),
          title: Text(widget.name,style: GoogleFonts.jost(color: Colors.white),),
          subtitle:  Text(widget.email,style: GoogleFonts.jost(color: Colors.white),),
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.more_vert,color: Colors.white,size: 30,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
             
             MyMessageSpace()
          ],
        ),
      ),
    );
  }
}




//MessageField

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class MyMessageSpace extends StatelessWidget {
  const MyMessageSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: TextFormField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message",
                        ),
                      ),
              ),
            ),
          ),

           InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
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
