import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
       body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Login.jpg"),fit: BoxFit.fill)),
        child: Column(
          children: [
            const SizedBox(
              height:270,
            ),
            const Text("Hello User !",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10,
            ),
            const Text("Welcome back, we miss you",style: TextStyle(fontSize: 25,color: Colors.white,)),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: const Color.fromARGB(255, 245, 245, 245),border: Border.all(color: const Color.fromARGB(255, 255, 253, 253),),borderRadius: BorderRadius.circular(25)),
              child: const TextField(
                decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Email"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: const Color.fromARGB(255, 245, 245, 245),border: Border.all(color: const Color.fromARGB(255, 255, 253, 253),),borderRadius: BorderRadius.circular(25)),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Password"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(color: Color.fromARGB(255, 11, 202, 167),borderRadius: BorderRadius.circular(25)),
              child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),))),
              SizedBox(
                height: 8,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",style: TextStyle(color: Colors.white,),),
                    Text("Register now",style: TextStyle(color: Colors.blue,),),
                  ],
                ),
          ],
        ),
       ),
      ),
    );
  }
}
