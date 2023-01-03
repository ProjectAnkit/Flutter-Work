import 'package:classico1/Routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              const SizedBox(
                 height: 200,
              ),
              const Icon(Icons.lock,size: 65,color: Colors.red,),
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Username or Mobile number",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.black12,
                        filled: true)
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.black12,
                        filled: true)
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Text("Forgot Password ?",style: GoogleFonts.lato(color: Colors.red),textAlign: TextAlign.left,)),
              const SizedBox(
                height: 14,
              ),
              const NewButton(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Text("  or continue with  ",style: GoogleFonts.lato(),),
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Profiles(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewButton extends StatefulWidget {
  const NewButton({super.key});

  @override
  State<NewButton> createState() => _NewButtonState();
}

class _NewButtonState extends State<NewButton> {

  bool Buttonpressed = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () async {
                setState((){
                  Buttonpressed = false;
                },
                );
                await Future.delayed(const Duration(seconds: 3));
                Navigator.pushNamed(context, MyRoutes.Homepage);
                
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 60,
                width: 340,
                decoration: BoxDecoration(color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                    boxShadow:Buttonpressed?[const BoxShadow(
                      offset: Offset(2,2),
                      blurRadius: 2,
                      spreadRadius: 1,
                      color: Colors.black,
                    ),
                    ]:[],
                    ),
                child: Center(
                  child: Buttonpressed?Text("Sign in",
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    color: Colors.white),
                ):Container(
                  height:16,
                  width: 16,
                  child:const CircularProgressIndicator(strokeWidth: 2,color: Colors.white,)),
                ),
              ),
            );
  }
}

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            child: Image(image: AssetImage("assets/Google.png",))),
            SizedBox(
              width: 20,
            ),
            Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            child: Image(image: AssetImage("assets/Apple.png",))),
            SizedBox(
              width: 20,
            ),
            Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            child: Image(image: AssetImage("assets/Gmail.png",))),
        ],
      ),
    );
  }
}
