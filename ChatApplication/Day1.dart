//LoadingPage
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/Utilities/Services/LoadingServices.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingservice().movescreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             const Center(
              child: Icon(Icons.wifi_channel_outlined,color: Colors.white,size: 85),
             ),
          
             Text("connecto",style: GoogleFonts.jost(color: Colors.white,fontSize: 35),)
        ],
      ),
    );
  }
}



//LoginPage

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/HomeScreen/HomePage.dart';
import 'package:mychatapplication/LoginPages/MobileVerification.dart';
import 'package:mychatapplication/SignUpPages/SignUpPage.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void login(String email,String password){

    setState(() {
      loading =true;
    });

  auth.signInWithEmailAndPassword(
    email: email, 
    password: password).then((value){ 
      setState(() {
        loading = false;
      });
       
     Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));

    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Displayerror().toastmessage(error.toString());
    });    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("connecto",style: GoogleFonts.jost(fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 
                 Text("Hey there , welcome back !",style: GoogleFonts.jost(color: Colors.black,fontSize: 25),),


                 const SizedBox(height: 20,),

                 MyFieldSpace(
                  controller: _email, 
                  encrypt: false, 
                  hinttext: "email", 
                  validator: "eg. xyz@gmail.com"
                  ),
               
               const SizedBox(
                height: 10,
               ),
      
               MyFieldSpace(
                  controller: _password, 
                  encrypt: true, 
                  hinttext: "password", 
                  validator: "eg .4e@4F799_t^"
                  ),


                  const SizedBox(
                    height: 5,
                  ),


              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
              
                  },
                  child: Text("Forgot Password?",style: GoogleFonts.jost(color: Colors.deepPurple),),
                ),
              ),

       
               const SizedBox(
                height: 20,
              ),


              MyButton(
                buttontxt: "login", 
                loading: loading, 
                ontap: (){
                     login(_email.text.toString(), _password.text.toString());
                }),

                
              
              const SizedBox(
                height: 5,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account ?",style: GoogleFonts.jost(color: Colors.black),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpPage()));
                    },
                    child: Text(" sign up",style: GoogleFonts.jost(color: Colors.deepPurple),))
                ],
              ),

               
              
              const SizedBox(
                height: 15,
              ),


              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MobileVerifyScreen()));
                            
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child: Text("Using phone number",style: GoogleFonts.jost(color: Colors.black,fontSize: 16),),
                  ),
                ),
              )
              
          ],
        ),
      ),
    );
  }
}


//Mobile Verification

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class MobileVerifyScreen extends StatefulWidget {
  const MobileVerifyScreen({super.key});

  @override
  State<MobileVerifyScreen> createState() => _MobileVerifyScreenState();
}

class _MobileVerifyScreenState extends State<MobileVerifyScreen> {

  final _mobcontroller = TextEditingController();
  bool loading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mobcontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("connecto",style: GoogleFonts.jost(fontSize: 25)),
        centerTitle: true,
      ),

    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Wrap(
            children:
               [
              Text("Please enter your phone number starting with country code eg. +91,then a 6-digit code sent to your number via sms",style: GoogleFonts.jost(color: Colors.black,fontSize: 17),)
               ]
              ),


           
          const SizedBox(
            height: 10,
          ),



          MyFieldSpace(
            controller: _mobcontroller, 
            encrypt: false, 
            hinttext: "enter Mobile number", 
            validator: "+91 888 9999 777"
            ),
    
    
            const SizedBox(
              height: 15,
            ),
            
    
            MyButton(
              buttontxt: "verify", 
              loading: loading, 
              ontap: (){
    
              })
        ],
      ),
    ),
    );
  }
}



//Code Verification Page

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class CodeVerifyScreen extends StatefulWidget {
  const CodeVerifyScreen({super.key});

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();
}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {

  final _codecontroller = TextEditingController();
  bool loading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _codecontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("connecto",style: GoogleFonts.jost(fontSize: 25)),
        centerTitle: true,
      ),

    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Wrap(
            children:
               [
              Text("Verify via 6-digit code that come to your number via sms",style: GoogleFonts.jost(color: Colors.black,fontSize: 17),)
               ]
              ),


           
          const SizedBox(
            height: 10,
          ),



          MyFieldSpace(
            controller: _codecontroller, 
            encrypt: false, 
            hinttext: "6-digit code", 
            validator: "eg .998877"
            ),
    
    
            const SizedBox(
              height: 15,
            ),
            
    
            MyButton(
              buttontxt: "Submit", 
              loading: loading, 
              ontap: (){
    
              })
        ],
      ),
    ),
    );
  }
}




//SignUpPage

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.ref("Users");

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

 void signup(String email,String password)async{
  setState(() {
    loading = true;
  });

   try{
    await auth.createUserWithEmailAndPassword(
    email: email, 
    password: password);

    setState(() {
      loading = false;
    });

   }
   catch(e){
    setState(() {
      loading = false;
    });
    Displayerror().toastmessage(e.toString());
   }
  
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("connecto",style: GoogleFonts.jost(fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 
                 Text("Hey there , connect with us !",style: GoogleFonts.jost(color: Colors.black,fontSize: 25),),


                 const SizedBox(height: 20,),

                 MyFieldSpace(
                  controller: _email, 
                  encrypt: false, 
                  hinttext: "email", 
                  validator: "eg. xyz@gmail.com"
                  ),
               
               const SizedBox(
                height: 10,
               ),
      
               MyFieldSpace(
                  controller: _password, 
                  encrypt: true, 
                  hinttext: "password", 
                  validator: "eg .4e@4F799_t^"
                  ),


               const SizedBox(
                height: 20,
              ),


              MyButton(
                buttontxt: "signup", 
                loading: loading, 
                ontap: (){
                    signup(_email.text.toString(),_password.text.toString());
                }),

                
              
              const SizedBox(
                height: 5,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?",style: GoogleFonts.jost(color: Colors.black),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    child: Text(" sign in",style: GoogleFonts.jost(color: Colors.deepPurple),))
                ],
              ),

               
          ],
        ),
      ),
    );
  }
}


//CustomButton

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttontxt, required this.loading, required this.ontap});

  final String buttontxt;
  final bool loading;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
        child: Center(
          child:loading?CircularProgressIndicator(color: Colors.white,) :Text(buttontxt,style: GoogleFonts.jost(color: Colors.white,fontSize: 16),),
        ),
      ),
    );
  }
}



//CustomField

import 'package:flutter/material.dart';

class MyFieldSpace extends StatelessWidget {
  const MyFieldSpace({super.key, required this.controller, required this.encrypt, required this.hinttext, required this.validator});

  final TextEditingController controller;
  final bool encrypt;
  final String hinttext;
  final String validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            controller: controller,
            obscureText: encrypt,
            validator: (value) {
              if(controller.text.isEmpty){
                  return validator;
              }
              else{
                  return null;
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              ),
          ),
        ),
      ),
    );
  }
}



//ToastMessages

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Displayerror{

  void toastmessage(String error){
     Fluttertoast.showToast(
      msg: error,
      backgroundColor: Color.fromARGB(255, 249, 161, 161),
      gravity: ToastGravity.BOTTOM,
      textColor: Color.fromARGB(255, 254, 254, 254),
      toastLength: Toast.LENGTH_SHORT
      );
  }
}

class Displaysuccess{

  void toastmessage(String success){
     Fluttertoast.showToast(
      msg: success,
      backgroundColor: Color.fromARGB(255, 161, 249, 165),
      gravity: ToastGravity.BOTTOM,
      textColor: Color.fromARGB(255, 254, 254, 254),
      toastLength: Toast.LENGTH_SHORT
      );
  }
}



//LoadingServices

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mychatapplication/LoginPages/Loginpage.dart';

class loadingservice{

   void movescreen(BuildContext context){

    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
     });
   }
}



//HomePageScreen

import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("homePage"),
        centerTitle: true,
      ),
    );
  }
}
