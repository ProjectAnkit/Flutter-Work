//Updated ViewprofilePage

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mychatapplication/HomeScreen/HomePageScreen.dart';
import 'package:mychatapplication/Utilities/AlertMessages/ToastMessages.dart';
import 'package:mychatapplication/Utilities/CustomWidgets/MyButton.dart';
import 'package:mychatapplication/Utilities/Models/UserModel.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key, required this.OwnUser});
  final UserModel OwnUser;

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;


  File? image;
  ImagePicker picker = ImagePicker();
  String userProfile = "";

  @override
  void dispose() {

    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _biocontroller.dispose();
  }


  Future getImage()async{
    final user = auth.currentUser;
    final imagepath = await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if(imagepath!=null)
    {
       setState(() {
           image = File(imagepath.path);
      });

       final ref = storage.ref("Profile");
       await ref.putFile(image!.absolute);

       final profileurl = await ref.getDownloadURL();
       setState(() {
         userProfile = profileurl;
       });
       
       await firestore.collection("User").doc(user!.uid).update({
        "profile url" : profileurl,
       });
    }
  }


  Future<void> Uploaddata() async {
    final user = auth.currentUser;

    try{  
       
      await firestore.collection("User").doc(user!.uid).update({
        "name" : _namecontroller.text,
        "email": _emailcontroller.text,
        "bio"  : _biocontroller.text,
      });
    }
    catch(e){
      Displayerror().toastmessage(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    _namecontroller.text = widget.OwnUser.name.toString();
    _emailcontroller.text = widget.OwnUser.email.toString();
    _biocontroller.text = widget.OwnUser.bio.toString();


    return Scaffold(
      appBar: AppBar(
       leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
        Uploaddata();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
       }),
        backgroundColor: Colors.black,
        title:  Text("connecto",style: GoogleFonts.jost(fontSize: 25),),
        centerTitle: true,  
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        getImage();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: image!=null? NetworkImage(userProfile) : NetworkImage(widget.OwnUser.imageurl.toString()),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("Tap to Change your Profile",style: GoogleFonts.jost(color: Colors.deepPurple),)
                  ],
                ),
              ),
      
              const SizedBox(
                height: 20,
              ),
      
             

              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  helperText: "full name"
                ),
              ),
      
              const SizedBox(
                height: 20,
              ),
      
               TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  helperText: "email"
                ),
              ),
      
              const SizedBox(
                height: 20,
              ),
      
               TextFormField(
                controller: _biocontroller,
                maxLength: 60,
                decoration: const InputDecoration(
                  helperText: "bio"
                ),
              ),

              const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}


//Deleted DrawerScreen
