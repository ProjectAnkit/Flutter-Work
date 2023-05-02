//Updated (LoginPage) Function
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
         
         final id = DateTime.now().millisecondsSinceEpoch.toString();

          await firestore.doc(id).set({
            "email": user.email,
            "id": id
          });

           setState(() {
             loading = false;
             _email.clear();
        _password.clear();
           });

           // ignore: use_build_context_synchronously
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePageScreen()));

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

//ForgotPasswordScreen

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final auth = FirebaseAuth.instance;
  final _emailcontroller = TextEditingController();
  bool loading = false;
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: true,
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
              children: [
                Text("Enter the email id which is linked to the connecto account",style: GoogleFonts.jost(color: Colors.black,fontSize: 17),),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            MyFieldSpace(
              controller: _emailcontroller, 
              encrypt: false, 
              hinttext: "enter email", 
              validator: "eg. xyz@gmail.com"
              ),
      
            const SizedBox(
              height: 10,
            ),
      
            
            MyButton(
              buttontxt: "submit", 
              loading: loading, 
              ontap: ()async{
                setState(() {
                  loading = true;
                });
                 
               try{
                auth.sendPasswordResetEmail(email: _emailcontroller.text.toString());

                Displaysuccess().toastmessage("password reset mail is sent to your email account which is linked to connecto");

                setState(() {
                  loading = false;
                  _emailcontroller.clear();
                });
               }

               catch(e){
                setState(() {
                  loading = false;
                  _emailcontroller.clear();
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
