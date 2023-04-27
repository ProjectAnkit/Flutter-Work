//ImageUploadScreen

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';


class ImageUplaodScreen extends StatefulWidget {
  const ImageUplaodScreen({super.key});

  @override
  State<ImageUplaodScreen> createState() => _ImageUplaodScreenState();
}

class _ImageUplaodScreenState extends State<ImageUplaodScreen> {


  bool loading = false;
  File? image;
  ImagePicker picker = ImagePicker();

  final storage = FirebaseStorage.instance;
  final database = FirebaseDatabase.instance;

  Future getImage()async{

    final pickedfile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if(pickedfile!=null)
    {
        setState(() {
        image = File(pickedfile.path);
        });
    }
    else{
      displayerror().toastmessage("error! image not picked");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Upload Image"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: (){
                 getImage();
              },
              child: Container(
                height: 260,
                width: 260,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Center(
                  child: image!=null? Image.file(image!.absolute,fit: BoxFit.cover,) :const Text("Pick a Image"),
                ),
              ),
            ),
          ),


          const SizedBox(
            height: 20,
          ),

           
          CommonButton(
            ontap: ()async{

               setState(() {
               loading = true;
                 });
              
              final String id = DateTime.now().millisecondsSinceEpoch.toString();

              final ref = storage.ref('user'+id);
              await ref.putFile(image!.absolute);

              String imageUrl = await ref.getDownloadURL();

              database.ref(id).set({
                'id' : id,
                'imageurl': imageUrl,
              }).then((value) {

                setState(() {
                loading = false;
                 });

                AddSuccess().toastmessage('uploaded');
              }).onError((error, stackTrace) {
                setState(() {
                  loading = false;
                });
                displayerror().toastmessage(error.toString());
              });

            }, 
            loading: loading, 
            Buttontext: "Upload")
        ],
      ),
    );
  }
}
