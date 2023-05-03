import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mychatapplication/HomeScreen/HomePage.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyFieldSpace.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {

  File? image;
  final imagePicker = ImagePicker();
  bool loading = false;
  final auth = FirebaseAuth.instance;

    final _namecontroller = TextEditingController();
    final storage = FirebaseStorage.instance;
    final firestore = FirebaseFirestore.instance.collection("User");


  Future getImage()async{

    final pickedfile = await imagePicker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if(pickedfile!=null)
    {
       setState(() {
         image = File(pickedfile.path);
         });
    }
    else{
       Displayerror().toastmessage("image not selected");
    }
  }




  Future upload()async{

    setState(() {
      loading = true;
    });

   try{
     
    final ref = storage.ref("Profile");
    await ref.putFile(image!.absolute);

    String imageurl = await ref.getDownloadURL();
   
    final user = auth.currentUser;
    
    firestore.doc(user!.uid).set({
      "name": _namecontroller.text.toString(),
      "email" : user.email,
      "profile url" : imageurl,
      "id": user.uid,
      "phone number": user.phoneNumber,
    }).then((value) async{

      setState(() {
        loading = false;
      });

      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
    }).onError((error, stackTrace) {

    setState(() {
      loading = false;
    });

    Displayerror().toastmessage(error.toString());
    });
   }

   catch(e){
    setState(() {
      loading = false;
    });
    Displayerror().toastmessage(e.toString());
   }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("connecto",style: GoogleFonts.jost(fontSize: 25)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              
              Center(
                child: InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(75)),
                    child:image!=null?ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Image.file(image!.absolute,fit: BoxFit.cover,))
                         :  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Upload",style: GoogleFonts.jost(color: Colors.black,fontSize: 15),),
                          const Icon(Icons.image,size: 30,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      
              const SizedBox(
                height: 3,
              ),
      
              Text("Profile",style: GoogleFonts.jost(color: Colors.black,fontSize: 15),),
      
              const SizedBox(
                height: 30,
              ),
      
      
              MyFieldSpace(
                controller: _namecontroller, 
                encrypt: false, 
                hinttext: "Full Name", 
                validator: "please enter your own name"
                ),
      
             const SizedBox(
              height: 10,
             ),
      
      
             MyButton(
              buttontxt: "Continue", 
              loading: loading, 
              ontap: (){

                upload();
      
              })
          ],
        ),
      ),
    );
  }
}
