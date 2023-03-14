import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? image;
  final  _picker = ImagePicker();
  bool showspinner = false;

  Future getImage()async{
    final pickedfile = await _picker.pickImage(imageQuality: 80,source : ImageSource.gallery);

    if(pickedfile!=null)
    {
      image = File(pickedfile.path);
      setState(() {});
    }
    else{
      print("not selected");
    }
  }

  Future<void>UploadImage()async{
       setState(() {
         showspinner = true;
       });

       var stream  =  new http.ByteStream(image!.openRead());

       var length = await image!.length();

       var uri = Uri.parse("https://fakestoreapi.com/products");

       var request = new MultipartRequest("POST", uri);

       request.fields['title'] = "Static title";

       var multipart = new http.MultipartFile(
        'image',
         stream,
          length,
       );

       request.files.add(multipart);

       var response  =  await request.send();

       print( response.stream.toString());

       if(response.statusCode == 200)
       {
        setState(() {
            showspinner = false;
          });  
          print("image uploaded");
       }
       else{
        setState(() {
            showspinner = false;
          });
        print("error while uploading image");
       }
       
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              InkWell(
                onTap: (){
                  getImage();
                },
                child: Container(
                  child: image==null?Center(child: Text("Pick Image"))   
                :
                Container(
                  child: Center(
                    child: Image.file(File(image!.path).absolute,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,),
                  ),
                ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: (){
                  UploadImage();
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("Upload Image",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
