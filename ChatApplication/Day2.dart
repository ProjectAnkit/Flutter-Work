//Updated (LoginPageScreen)
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

   void signin(String email,String password)async{

    setState(() {
      loading  = true;
    });

    try{
       auth.signInWithEmailAndPassword(
        email: email, 
        password: password);

        final user = auth.currentUser;
    
       if(user!=null && user.emailVerified)
       {
           setState(() {
             loading = false;
             _email.clear();
        _password.clear();
           });

           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));

           Displaysuccess().toastmessage("successfully sign in");

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                     signin(_email.text.toString(), _password.text.toString());
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



//Updated (SignUpPageScreen)

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
          password: password,
          );

        final user = auth.currentUser;
        
        Displaysuccess().toastmessage("verification link is sent to your email id");
        await user!.sendEmailVerification();

       setState(() {
          loading = false;
           _email.clear();
        _password.clear();

        });
    }

    catch(e){
          setState(() {
            loading = false;
             _email.clear;
        _password.clear;

          });

          Displaysuccess().toastmessage(e.toString());
    }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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


//Mobile verification Screen

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/LoginPages/CodeVerification.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
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
  final auth = FirebaseAuth.instance;


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
                 
                  setState(() {
                    loading = true;
                  });
                    
                   try{
                     auth.verifyPhoneNumber(
                      phoneNumber: _mobcontroller.text,
                      verificationCompleted: (_){
                          setState(() {
                            loading = false;
                          });
                      }, 
                      verificationFailed: (e){
                        setState(() {
                          loading = false;
                        });
                        Displayerror().toastmessage(e.toString());
                      }, 
                      codeSent: (verificationId, forceResendingToken) {
                        setState(() {
                          loading = false;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CodeVerifyScreen(verificationId: verificationId,)));
                      }, 
                      codeAutoRetrievalTimeout: (verificationId){
                        setState(() {
                          loading = false;
                        });

                      });
                   }


                   catch(e){
                    setState(() {
                      loading = false;
                    });
                        Displayerror().toastmessage(e.toString());
                   }
              })
        ],
      ),
    ),
    );
  }
}


//Code Verification Screen

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/HomeScreen/HomePage.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class CodeVerifyScreen extends StatefulWidget {
  const CodeVerifyScreen({super.key, required this.verificationId});
  
  final String verificationId;

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();
}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {

  final _codecontroller = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;


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
              ontap: ()async{

                setState(() {
                  loading = true;
                });

                final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId, 
                  smsCode: _codecontroller.text.toString());

                await auth.signInWithCredential(credential).then((value) {

                  setState(() {
                    loading = false;
                  });

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));

                }).onError((error, stackTrace) {

                  setState(() {
                    loading = false;
                  });

                  Displayerror().toastmessage(error.toString());
                });
    
              })
        ],
      ),
    ),
    );
  }
}
