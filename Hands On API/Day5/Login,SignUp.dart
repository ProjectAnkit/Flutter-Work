import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signup(String email,String password)async{
    try{
       Response response = await post(Uri.parse("https://reqres.in/api/register"),
       body: {
        "email" : email,
        "password" : password,
       }
      );

      if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
         print("Sign Up Successful");
      }else{
         print("Failed");
      }
    }catch(e){
       print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 217, 212, 212),borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: InputBorder.none),
                ),
              )
              ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 218, 212, 212),borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: password,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: InputBorder.none),
                ),
              )
              ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              signup( email.text.toString(),password.text.toString());
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 16),)),
            ),
          )
        ],
      ),
    );
  }
}
