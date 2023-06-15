//LoginPage (updated)

import 'dart:async';

import 'package:ecommerce_app/Login/CodePage.dart';
import 'package:ecommerce_app/Utils/ToastMessages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController mobcontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();
  bool buttonpressed = false;
  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
      
            Container(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: const Center(
                child: SizedBox(
                  height: 260,
                  width: 260,
                  child: Image(image: AssetImage("assets/shopping-cart.png"))),
              ),
            ),
            
      
            const SizedBox(
              height: 30,
            ),
      
      
            Text("for continue shopping with shopin, please login",style: GoogleFonts.poppins(color: Colors.black,fontSize: 22),softWrap: true,textAlign: TextAlign.center,),
      
            const SizedBox(
              height: 30,
            ),
      
             
            
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple),borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+91",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Center(
                          child: TextFormField(
                            controller: mobcontroller,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            expands: false,
                            cursorColor: Colors.deepPurple,
                            style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),
                            decoration: InputDecoration( 
                              counterText: "",
                              hintText: "Enter your Phone number",
                              hintStyle: GoogleFonts.poppins(fontSize: 18),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               ),
             ),
             

             const SizedBox(
              height: 20,
             ),
             


             InkWell(
              onTap: (){
                 
                   login();

              },
               child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 60,
                width: 130,
                decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(55)
                ,boxShadow: [
                  buttonpressed?
                  const BoxShadow()
                  :
                  const BoxShadow(            
                    offset: Offset(1.5, 1.5),
                    color: Colors.black87,
                    spreadRadius: 2,
                    blurRadius: 1,
                  ), 
                ],),
                child: Center(child: Text("login",style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)),
               ),
             ),

             
             const SizedBox(
              height: 20,
             ),


             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Don't want to login now ?",style: GoogleFonts.poppins(color: Colors.black,fontSize: 16),),
                 InkWell(
                  onTap: (){
                    
                  },
                  child: Text(" Skip",style: GoogleFonts.poppins(color: Colors.deepPurple,fontSize: 16),)),
               ],
             )
          ],
        ),
      ),
    );
  }

  

  Future<void>login()async{
     
     setState(() {
       buttonpressed = true;
     });

     try{
       
       await auth.verifyPhoneNumber(
        phoneNumber: "+91"+mobcontroller.text,
         verificationCompleted: (_){
               setState(() {
                 buttonpressed = false;
               });    
         },
         verificationFailed: (e){
          toastmessage().showerror(e.toString());
         }, 
         codeSent: (verificationId,code){             
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CodePage(verificationId: verificationId,)));
         }, 
         codeAutoRetrievalTimeout: (_){

         });


     }catch(e){
         setState(() {
           buttonpressed = false;
         });
         toastmessage().showerror(e.toString());
     }
  }


  
}
