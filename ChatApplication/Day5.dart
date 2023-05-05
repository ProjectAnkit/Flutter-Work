//LoadingServies(updated)
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychatapplication/HomeScreen/SearchPage.dart';
import 'package:mychatapplication/HomeScreen/IntroPage.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';

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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SearchPageScreen()));
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




//signin Function(updated)

void signin(String email,String password)async{

    setState(() {
      loading  = true;
    });

    try{
       await auth.signInWithEmailAndPassword(
        email: email, 
        password: password);

        final user = auth.currentUser;
    
       if(user!=null && user.emailVerified)
       {
           
           final userdoc = await firestore.doc(user.uid).get();

           if(userdoc.exists)
           {
               await Future.delayed(Duration(seconds: 3));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  SearchPageScreen()));
           }
           else{
              await Future.delayed(Duration(seconds: 3));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  Intropage()));
           }

            setState(() {
             loading = false;
             _email.clear();
        _password.clear();
           });


       }
       else{
        setState(() {
          loading = false;
          _email.clear();
        _password.clear();
        });
        Displayerror().toastmessage("user id doesn't exist, signup to create an account");
        auth.signOut();

        
       }
    }
    catch(e){
      setState(() {
        loading = false;
         _email.clear;
        _password.clear;

      });
      Displayerror().toastmessage(e.toString());
    }
   }




//SearchPage
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';
import 'package:mychatapplication/ChatPage/CustomWidget/UsersCard.dart';

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
      
      
            MyFieldSpace(
              controller: _searchcontroller,
               encrypt: false, 
               hinttext: "Search connecto user", 
               validator: "enter name/email/phone number "
               ),
      
            const SizedBox(
              height: 5,
            ),
      
            const Divider(),
      
            const SizedBox(
              height: 10,
            ),
            
      
            StreamBuilder(
              stream: firestore.collection("User").snapshots(),
              builder: ((context, snapshot) {

                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context,index){
                       return UserCard();
                    }),
                );
              })
              ),
          ],
        ),
      ),
    );
  }
}




//UserCard
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/ChatPage/ChatRoom.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage()));
      },
      child: ListTile(
        title: Text("User name",style: GoogleFonts.jost(color: Colors.black),),
        subtitle: Text("email or phone number",style: GoogleFonts.jost(color: Colors.black),),
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}


