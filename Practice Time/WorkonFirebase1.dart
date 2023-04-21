//Main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practiceapp/VerifyPhoneScreen.dart';

void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Material(
    child: MaterialApp(
      home:  VerifyPhoneScreen(),
    ),
  ));
}








//PhoneVerificationPage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practiceapp/VerifyCode.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {

  final mobcontroller = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mobcontroller.dispose();
  }


  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: mobcontroller,
                decoration: const InputDecoration(
                  hintText: "+91 999 8888 777"
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 0, 0, 0))),
              onPressed: (){
                setState(() {
                  loading = true;
                });
                   auth.verifyPhoneNumber(
                    phoneNumber: mobcontroller.text.toString(),
                    verificationCompleted: (_){
                        setState(() {
                          loading = false;
                        });
                    }, 
                    verificationFailed: (e){
                      setState(() {
                        loading = false;
                      });
                        Fluttertoast.showToast(
                        msg: e.toString(),
                         backgroundColor: Colors.red,
                         textColor: Colors.white,
                         toastLength: Toast.LENGTH_SHORT,
                        );
                    }, 
                    codeSent: (verificationId, forceResendingToken) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyCode(verificationId: verificationId,)));
                    }, 
                    codeAutoRetrievalTimeout: (verificationId){
                     setState(() {
                       loading = false;
                     });
                    });
              }, 
              child: Center(child: loading?CircularProgressIndicator(color: Colors.white,) : Text("verify",style: TextStyle(color: Colors.white),)))
          ],
        ),
      ),
    );
  }
}






//VerifyWithCode
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practiceapp/PostScreen.dart';
import 'package:practiceapp/VerifyCode.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {

  final codecontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codecontroller.dispose();
  }


  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: codecontroller,
                decoration: const InputDecoration(
                  hintText: "enter 6-digit code"
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 0, 0, 0))),
              onPressed: ()async{
                setState(() {
                  loading = true;
                });
                   
                   final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId, 
                    smsCode: codecontroller.text.toString()
                    );

                    try{
                       await auth.signInWithCredential(credential);
                       setState(() {
                        loading = false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PostScreen()));

                    }catch(e){
                      setState(() {
                        loading = false;
                      });
                       Fluttertoast.showToast(
                        msg: e.toString(),
                         backgroundColor: Colors.red,
                         textColor: Colors.white,
                         toastLength: Toast.LENGTH_SHORT,
                        );
                    }
              }, 
              child: Center(child: loading?CircularProgressIndicator(color: Colors.white,) : Text("Submit",style: TextStyle(color: Colors.white),)))
          ],
        ),
      ),
    );
  }
}
