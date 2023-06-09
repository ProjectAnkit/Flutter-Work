//Loading Page

import 'package:ecommerce_app/Loading/LoadingServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingServices().movetoScreen(context);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: Icon(Icons.shopping_bag,color: Colors.white,size: 56,)),
              ],
            ),  
          ),


          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: Center(child: Text("by ProjectAnkit",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),)),
                ),
              ],
            ), 
          )
        ],
      ),
    );
  }
}


//Loading Services

import 'dart:async';

import 'package:ecommerce_app/Login/LoginPage.dart';
import 'package:flutter/material.dart';

class LoadingServices{

  void movetoScreen(BuildContext context){
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
     });
  }
}



//LoginPage

import 'dart:async';

import 'package:ecommerce_app/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool buttonpressed = false;

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
                 setState(() {
                   buttonpressed = true;
                 });
                 Timer(Duration(seconds: 2), () { 
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                 });
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
}
