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
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/LoginImage1.jpeg"),fit: BoxFit.fill)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
             height: 180,
            ),
            Center(child: Text("FIRE",style:GoogleFonts.langar(color: Colors.red,fontSize: 50)
            )
            ),
            Text("Welcome User",style: GoogleFonts.jost(fontSize: 23,color: const Color.fromARGB(255, 247, 129, 19),fontWeight: FontWeight.w500),),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
              child: const TextField(
                cursorColor: Colors.black,
                cursorHeight:20,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(45)),
              child: const TextField(
                cursorColor: Colors.black,
                cursorHeight: 20,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const NewButton(),
          ],
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
                
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.red,
                  borderRadius: BorderRadius.circular(45),
                    boxShadow:Buttonpressed?[const BoxShadow(
                      offset: Offset(4,4),
                      blurRadius: 2,
                      spreadRadius: 1,
                      color: Colors.black,
                    ),
                     const BoxShadow(
                      offset: Offset(-2,-2),
                      blurRadius: 2,
                      spreadRadius: 1,
                      color: Colors.white,
                    ),]:[],
                    ),
                child: Center(
                  child: Buttonpressed?Text("Sign in",
                  style: GoogleFonts.lato(
                    color: Colors.white),
                ):Container(
                  height:16,
                  width: 16,
                  child:CircularProgressIndicator(strokeWidth: 3,color: Colors.white,)),
                ),
              ),
            );
  }
}
