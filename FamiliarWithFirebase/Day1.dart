//SplashScreen
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   Splashservives splashscreen = Splashservives();
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen.ToLogin(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.timeline_sharp,color: Colors.white,size: 76,))
        ],
      ),
    );
  }
}

class Splashservives{

  void ToLogin(BuildContext context){
    
    Timer(const Duration(seconds : 3), ()=> Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage()))));
  }
}












//LoginPage
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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


               Center(
                 child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 232, 232, 232),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(border: InputBorder.none,hintText: "Email"),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(border: InputBorder.none,hintText: "Password"),
                      ),
                    ),
                  ),
                  ),
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

                  },
                   child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(25)),
                    child: const Center(child: Text("login",style: TextStyle(color: Colors.white,fontSize: 17),)),
                   ),
                 ),
               ),



               SizedBox(
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
