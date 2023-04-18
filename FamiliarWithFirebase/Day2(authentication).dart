//loginPage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/PostScreen.dart';
import 'package:flutter_application_1/SignupPage.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool loading = false;

  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
 
  final _auth = FirebaseAuth.instance;
  
  void login()async{
     
     setState(() {
       loading = true;
     });

     try{
         await _auth.signInWithEmailAndPassword(
          email: _email.text.toString(), 
          password: _password.text.toString()
          ).then((value) {
            setState(() {
              loading = false;
            });
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const PostScreen())));
          });
     }catch(e){
      displayerror().toastmessage(e.toString());
        setState(() {
          loading = false;
        });
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.w400),))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Icon(Icons.lock,color: Colors.black,size: 45,)),


            const SizedBox(
              height: 15,
            ),





            Form(
              key: _formkey,
              child: Column(
                children: [
                  Center(
                 child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 232, 232, 232),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(border: InputBorder.none,hintText: "Email",prefixIcon: Icon(Icons.mail)),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                             return "enter email id";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ),
               ),



                const SizedBox(
                  height: 15,
                ),



               Center(
                 child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 232, 232, 232),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(border: InputBorder.none,hintText: "Password",prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                             return "enter email id";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ),
               ),
                ],
              ) 
            ),
               

              


                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: InkWell(
                      onTap: (){

                      },
                      // ignore: avoid_unnecessary_containers
                      child: Container(child: const Text("Forgot password ?",style: TextStyle(color: Colors.blue),))),
                  )),
               



                const SizedBox(
                height: 20,
               ),
               



               Center(
                 child: InkWell(
                  onTap: (){
                      if(_formkey.currentState!.validate())
                      {
                         login();
                      }
                  },
                   child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(25)),
                    child:  Center(child: loading?
                    const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(color: Colors.white,)
                      ): 
                    const Text("login",style: TextStyle(color: Colors.white,fontSize: 17),)),
                   ),
                 ),
               ),




               Center(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ? "),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignupPage())));
                      },
                      child: const Text("Sign up",style: TextStyle(color: Colors.blue),))
                  ],
                 ),
               ),

               const SizedBox(
                height: 10,
               ),
  
               

               Center(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 90.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/Google.png",height: 40,width: 40,),
                      Image.asset("assets/Apple.png",height: 40,width: 40,),
                      Image.asset("assets/facebook.png",height: 40,width: 40,),
                    ],
                   ),
                 ),
               )
          ],
        ),
      ),
    );
  }
}






//SignUpPage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';

class SignupPage extends StatefulWidget {
    const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => __SignupPageState();
}

class __SignupPageState extends State<SignupPage> {

  bool loading = false;

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
 

  void signup() async {
  setState(() {
    loading = true;
  });

  try {
    await _auth.createUserWithEmailAndPassword(
      email: _email.text.toString(),
      password: _password.text.toString(),
    );

    setState(() {
      loading = false;
    });

    displayapprove().toastmessage();
  } catch (error) {
    setState(() {
      loading = false;
    });

    displayerror().toastmessage(error.toString());
  }
}


  @override

  void dispose() {
   
    super.dispose();
    _email.dispose();
    _password.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: const Center(child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.w400),))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Icon(Icons.lock,color: Colors.black,size: 45,)),


            const SizedBox(
              height: 15,
            ),





            Form(
              key: _formkey,
              child: Column(
                children: [


                  //email field
                  Center(
                 child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 232, 232, 232),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(border: InputBorder.none,hintText: "Email",prefixIcon: Icon(Icons.mail)),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                             return "enter email id";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ),
               ),



                const SizedBox(
                  height: 15,
                ),


                  //Password Field
               Center(
                 child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 232, 232, 232),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(border: InputBorder.none,hintText: "Password",prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                             return "enter password";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ),
               ),
                ],
              ) 
            ),
               

              


                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: InkWell(
                      onTap: (){

                      },
                      child: const Text("Forgot password ?",style: TextStyle(color: Colors.blue),)),
                  )),
               



                const SizedBox(
                height: 20,
               ),
               


               //Button

               Center(
                 child: InkWell(
                  onTap: (){
                      if(_formkey.currentState!.validate())
                      {
                         signup();
                      }
                  },
                   child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(25)),
                    child: Center(child: loading? 
                    const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(color: Colors.white,)
                      ):
                       const Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 17),)),
                   ),
                 ),
               ),




               Center(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ? "),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage())));
                      },
                      child: const Text("Sign in",style: TextStyle(color: Colors.blue),))
                  ],
                 ),
               ),

               const SizedBox(
                height: 10,
               ),
  
               

               Center(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 90.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/Google.png",height: 40,width: 40,),
                      Image.asset("assets/Apple.png",height: 40,width: 40,),
                      Image.asset("assets/facebook.png",height: 40,width: 40,),
                    ],
                   ),
                 ),
               )
          ],
        ),
      ),
    );
  }
}





//ToastMessage
import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class displayerror{

  void toastmessage(String error)
  {
      Fluttertoast.showToast(
        msg: error.toString(),
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        textColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 210, 64, 64),
        );
  }
}


class displayapprove{

  void toastmessage()
  {
      Fluttertoast.showToast(
        msg: "Created Successfully",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 187, 230, 187),
        );
  }
}




//PostScreen

import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
    );
  }
}






