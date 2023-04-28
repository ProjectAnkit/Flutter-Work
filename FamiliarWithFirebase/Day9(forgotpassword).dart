//ForgotPasswordScreen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/CommonWidget/TextFormField.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final auth = FirebaseAuth.instance;
  bool loading = false;
  final _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Reset Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormFieldSpace(
              encrypt: false,
              Hint: "email address", 
              validatetext: "xyz@gmail.com", 
              keyboardType: TextInputType.emailAddress, 
              controller: _emailcontroller
              ),

              const SizedBox(
                height: 20,
              ),

              CommonButton(
                ontap: (){
                  setState(() {
                    loading = true;
                  });
                  auth.sendPasswordResetEmail(
                    email: _emailcontroller.text.toString()
                    ).then((value) => {
                      setState(() {
                        loading = false;
                      }),
                        AddSuccess().toastmessage("/Password reset link is sent to your email address/")
                    }).onError((error, stackTrace) =>{
                      setState(() {
                        loading = false;
                      }),
                        displayerror().toastmessage(error.toString())
                    });
                }, 
                loading: loading, 
                Buttontext: "Reset")
          ],
        ),
      ),
    );
  }
}
