import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? image;
  ImagePicker _picker = ImagePicker();
  bool showspinner = false;

  Future getImage()async{
    var pickedfile = await _picker.pickImage(source: ImageSource.gallery,);
    
    if(pickedfile!=null)
    {
      image = File(pickedfile.path);
      setState(() {});
      print("image selected");
    }
    else
    {
      print("image not selected");
    }
  } 

  Future<void>Uploadimage()async{

    setState(() {
      showspinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());

    int length = await image!.length();

    var uri = Uri.parse("https://fakestoreapi.com/products");

    var request = new http.MultipartRequest("POST", uri);

    request.fields["title"] = "static title";

    var multipart = new http.MultipartFile(
      'image',
       stream,
        length);

    request.files.add(multipart);

    var response = await request.send();

    print(response.stream.toString());

    if(response.statusCode == 200)
    {
        setState(() {
          showspinner = false;
        });
        print("uploaded successfully");
    }
    else{
      setState(() {
        showspinner = false;
      });
      print("error while uploading");
    }

  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                getImage();
              },
              child: Container(
                child: image==null?
                Container(
                  child: Center(child: Text("Pick Image")),
                ):
                Container(
                  child: Center(
                    child: Image.file(File(image!.path).absolute,
                    height: 300,
                    width: 300,),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                Uploadimage();
              },
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text("Upload",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
