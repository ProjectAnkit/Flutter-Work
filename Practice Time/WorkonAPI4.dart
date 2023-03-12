import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailcont = TextEditingController();
  TextEditingController passcont = TextEditingController();

  void signup(String emailcont,String passcont)
  async{
    try{
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
      body: {
        "email" : emailcont,
        "password" : passcont
      });
      
      if(response.statusCode == 200)
      {
         var data = jsonDecode(response.body.toString());
         print(data["token"]);
         print("sign in successful");
      }
      else{
        print("error while signing up");
      }
   

    }catch(e){
       print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              width: 360,
              decoration: BoxDecoration(color: const Color.fromARGB(255, 224, 217, 217),borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcont,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                    border: InputBorder.none),
                ),
              )
              ),
          ),
            const SizedBox(
              height: 20,
            ),
          Align(
            alignment: Alignment.center,
            child: Container(
               height: 60,
              width: 360,
              decoration: BoxDecoration(color: const Color.fromARGB(255, 224, 217, 217),borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passcont,
                  decoration: const InputDecoration(
                    hintText: 'Enter password',
                    border: InputBorder.none),
                ),
              )
              ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: (){
              signup(emailcont.text.toString(),passcont.text.toString());
            },
            child: Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("Login",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400),)),
            ),
          )
        ],
      ),
    );
  }
}
