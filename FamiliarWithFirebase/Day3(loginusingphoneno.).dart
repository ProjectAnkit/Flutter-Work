//loginPage (updated)
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/PostScreen.dart';
import 'package:flutter_application_1/SignUpPages/SignupPage.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/CommonWidget/TextFormField.dart';
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
                 child: FormFieldSpace(
                  controller: _email,
                  Formicon: Icon(Icons.lock),
                  Hint: "Password",
                  keyboardType: TextInputType.text,
                  validatetext: "enter password",
                 )
               ),



                const SizedBox(
                  height: 15,
                ),



               Center(
                 child: FormFieldSpace(
                  controller: _password,
                  Formicon: Icon(Icons.lock),
                  Hint: "Password",
                  keyboardType: TextInputType.text,
                  validatetext: "enter password",
                 )
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
                 child: CommonButton(
                  ontap: () {
                     if(_formkey.currentState!.validate())
                      {
                         login();
                      }
                  },
                  Buttontext: "login",
                  loading: loading,
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



//SignUpPage (updated)
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPages/LoginPage.dart';
import 'package:flutter_application_1/SignUpPages/Mob_verify.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/CommonWidget/TextFormField.dart';
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
                 child: FormFieldSpace(
                  controller: _email,
                  Formicon: Icon(Icons.mail_outline_sharp),
                  Hint: "Email",
                  keyboardType: TextInputType.text,
                  validatetext: "enter email",
                 )
               ),



                const SizedBox(
                  height: 15,
                ),


                  //Password Field
               Center(
                 child: FormFieldSpace(
                  controller: _password,
                  Formicon: Icon(Icons.lock),
                  Hint: "Password",
                  keyboardType: TextInputType.text,
                  validatetext: "enter password",
                 )
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
                 child: CommonButton(
                  ontap: () {
                    if(_formkey.currentState!.validate())
                      {
                         signup();
                      }
                  },
                  Buttontext: "sign up",
                  loading: loading,
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




               InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => MobVerification())));
                },
                 child: Container(
                   height: 60,
                   width: 320,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),
                   child: const Center(
                    child: Text("Sign up with Mobile number",style: TextStyle(fontSize: 15),),
                   ),
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



//Mobile verification Page
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/SignUpPages/VerifyCode.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/CommonWidget/TextFormField.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';


class MobVerification extends StatefulWidget {
  const MobVerification({super.key});

  @override
  State<MobVerification> createState() => _MobVerificationState();
}

class _MobVerificationState extends State<MobVerification> {

  final auth = FirebaseAuth.instance;
  bool loading = false;
  final _mobcontroller = TextEditingController();


  void Submit(){
    setState(() {
      loading = true;
    });
   
   auth.verifyPhoneNumber(
    phoneNumber: _mobcontroller.text.toString(),
    verificationCompleted: ((phoneAuthCredential) {

      setState(() {
        loading = false;
      });
      
    }), 
    verificationFailed: ((error) {
      displayerror().toastmessage(error.toString());
       setState(() {
        loading = false;
      });
    }), 
    codeSent: ((verificationId, forceResendingToken) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) => VerifyCode(verificationId: verificationId,))));
       setState(() {
        loading = false;
      });
    }), 
    codeAutoRetrievalTimeout: ((verificationId) {
      displayerror().toastmessage(verificationId.toString());
       setState(() {
        loading = false;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [


            const SizedBox(
              height: 120,
            ),


            FormFieldSpace(
              Hint: "Mobile number", 
              validatetext: "+91 987 8888 994", 
              keyboardType: TextInputType.number, 
              controller: _mobcontroller
              ),

             const SizedBox(
              height: 20,
             ),

            CommonButton(
              ontap: (){
                 Submit();
              }, 
              loading: loading, 
              Buttontext: "Verify"
              )
          ],
        ),
      ),
    );
  }
}



//OTP page
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/PostScreen.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/CommonWidget/TextFormField.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {

  final _codeController = TextEditingController();
  bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [


            const SizedBox(
              height: 120,
            ),


            FormFieldSpace(
              Hint: "6-digit code", 
              validatetext: "eg. 265789", 
              keyboardType: TextInputType.number, 
              controller: _codeController
              ),

             const SizedBox(
              height: 20,
             ),

            CommonButton(
              ontap: (){
                setState(() {
                  loading = true;
                });
                 final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId, 
                  smsCode: _codeController.text.toString());

                  try{
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => PostScreen())));
                      setState(() {
                        loading = false;
                      });
                  }catch(e){
                     displayerror().toastmessage(e.toString());
                     setState(() {
                       loading = false;
                     });
                  }
              }, 
              loading: loading, 
              Buttontext: "Submit"
              )
          ],
        ),
      ),
    );
  }
}

//keytool -list -v -keystore "C:\Users\Ankit Thakur\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android






//Button Widget
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.ontap, required this.loading, required this.Buttontext});

  final Function() ontap;
  final bool loading;
  final String Buttontext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: ontap,
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
                     Text(Buttontext,style: const TextStyle(color: Colors.white,fontSize: 17),)),
                   ),
                 );
  }
}



//Text Form Widget
import 'package:flutter/material.dart';

class FormFieldSpace extends StatelessWidget {
   FormFieldSpace({super.key, required this.Hint, required this.validatetext, required this.keyboardType,this.Formicon,required this.controller});

   TextEditingController controller;

   final String Hint;

   final String validatetext;

   final Icon? Formicon;

   final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 60,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 232, 232, 232),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: TextFormField(
                        keyboardType: keyboardType,
                        controller: controller,
                        obscureText: true,
                        decoration:  InputDecoration(border: InputBorder.none,hintText: Hint ,prefixIcon: Formicon),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                             return validatetext;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  );
  }
}
