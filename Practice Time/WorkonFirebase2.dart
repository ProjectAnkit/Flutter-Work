//loginpage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practiceapp/PostScreen.dart';
import 'package:practiceapp/Utils/FormSpace.dart';
import 'package:practiceapp/Utils/MyButton.dart';
import 'package:practiceapp/Utils/Toastmessage.dart';
import 'package:practiceapp/VerifyPhoneScreen.dart';
import 'package:practiceapp/signpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _passsword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _passsword.dispose();
  }

  final _formkey = GlobalKey<FormFieldState>();
  bool loading = false;
  final auth = FirebaseAuth.instance;


  void login()async{
     setState(() {
       loading = true;
     });
     try{
     
      await auth.signInWithEmailAndPassword(
        email: _email.text.toString(), 
        password: _passsword.text.toString()
        );
         setState(() {
        loading = false;
      });
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostScreen()));

     }catch(e){
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
        title: const Center(child: Text("login"),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.lock,color: Colors.black,size: 35,),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                 FormSpace(
                  controller: _email, 
                  encrypt: false, 
                  hint: "enter email",
                  fieldicon: const Icon(Icons.email_outlined),
                  ),
      
      
                  const SizedBox(
                    height: 10,
                  ),
      
                  FormSpace(
                    controller: _passsword, 
                    encrypt: true, 
                    hint: "enter password",
                    fieldicon: const Icon(Icons.lock_outline),
                    )  
                ],
              ),
              ),


              const SizedBox(
                height: 15,
              ),

              
              MyButton(
                loading: loading, 
                Buttontext: "login", 
                ontap: (){
                  login();
                }),

               
              const SizedBox(
                height: 3,
              ),


              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account ?",style: TextStyle(color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                      },
                      child: const Text(" Sign up",style: TextStyle(color: Colors.blue,),))
                  ],
                ),
              ),

              
              const SizedBox(
                height: 15,
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyPhone()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(45)),
                  child: const Center(child: Text("Using phone number",style: TextStyle(fontSize: 16),),),
                ),
              )
          ],
        ),
      ),
    );
  }
}



//SignupPage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practiceapp/LoginScreen.dart';
import 'package:practiceapp/PostScreen.dart';
import 'package:practiceapp/Utils/FormSpace.dart';
import 'package:practiceapp/Utils/MyButton.dart';
import 'package:practiceapp/Utils/Toastmessage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _email = TextEditingController();
  final _passsword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _passsword.dispose();
  }

  final _formkey = GlobalKey<FormFieldState>();
  bool loading = false;
  final auth = FirebaseAuth.instance;



  void signup()async{
    loading = true;
        
        try{
           setState(() {
           loading = false;
          });
        await auth.createUserWithEmailAndPassword(
        email: _email.text.toString(), 
        password: _passsword.text.toString());
     
        Displaysuccess().toastmessage();
        
    }catch(e){
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
        title: const Center(child: Text("Signup"),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.lock,color: Colors.black,size: 35,),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                 FormSpace(
                  controller: _email, 
                  encrypt: false, 
                  hint: "enter email",
                  fieldicon: const Icon(Icons.email_outlined),
                  ),
      
      
                  const SizedBox(
                    height: 10,
                  ),
      
                  FormSpace(
                    controller: _passsword, 
                    encrypt: true, 
                    hint: "enter password",
                    fieldicon: const Icon(Icons.lock_outline),
                    )  
                ],
              ),
              ),


              const SizedBox(
                height: 15,
              ),

              
              MyButton(
                loading: loading, 
                Buttontext: "sign up", 
                ontap: (){
                  signup();
                }),

               
              const SizedBox(
                height: 3,
              ),


              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account ?",style: TextStyle(color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                      child: const Text(" login",style: TextStyle(color: Colors.blue,),))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
