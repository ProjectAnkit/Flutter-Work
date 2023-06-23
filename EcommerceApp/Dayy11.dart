//Updated ProductBottomSheet

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Seller/Utilis/CustomInputField.dart';
import 'package:ecommerce_app/Utils/ToastMessages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


Future <dynamic> showproductSheet(BuildContext context,File? image1,File? image2,File? image3)async{

  TextEditingController prodnamecontroller = TextEditingController();
  TextEditingController prodsubnamecontroller = TextEditingController();
  TextEditingController proddesccontroller = TextEditingController();
  TextEditingController prodpricecontroller = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;


   Future UploadProduct()async{
   
    Navigator.pop(context);
    showDialog(   
      barrierDismissible: false, 
      context: context, 
      builder: (context){
        return  const AlertDialog(

          actions: [

            Column(
              children: [
                SpinKitCircle(color: Colors.deepPurple,),
              ],
            ),
            
          ],
        );
      });
    final user = auth.currentUser;

    try{
      
      //For image 1
      final imageref1 = storage.ref(DateTime.now().millisecondsSinceEpoch.toString());
      await imageref1.putFile(image1!.absolute);

      final url1 = await imageref1.getDownloadURL();
      

      //For image 2
      final imageref2 = storage.ref(DateTime.now().millisecondsSinceEpoch.toString());
      await imageref2.putFile(image2!.absolute);

      final url2 = await imageref2.getDownloadURL();
      

      //For image 3
      final imageref3 = storage.ref(DateTime.now().millisecondsSinceEpoch.toString());
      await imageref3.putFile(image3!.absolute);

      final url3 = await imageref3.getDownloadURL();


      final productid = DateTime.now().millisecondsSinceEpoch.toString();
      await firestore.collection("Seller").doc(user!.phoneNumber).collection("Products").doc(productid).set({
        "id": productid,
        "ProductName": prodnamecontroller.text.toString(),
        "ShortDesc": prodsubnamecontroller.text.toString(),
        "ProductDetails": proddesccontroller.text.toString(),
        "Price": prodpricecontroller.text.toString(),
      });
 
       final imageid = DateTime.now().millisecondsSinceEpoch.toString();
       await firestore.collection("Seller").doc(user.phoneNumber).collection("Products").doc(productid).collection("images").doc(imageid).set({
        "imagesid": imageid,
        "image1": url1,
        "image2": url2,
        "image3": url3,
       });

       Navigator.pop(context);
       Navigator.pop(context);
       toastmessage().showsuccess("Successfully uploaded");
    }



    // ignore: empty_catches
    catch(e){ 
      toastmessage().showerror(e.toString());

      Navigator.pop(context);
    }

    }


  

  await showModalBottomSheet(
    context: context, 
    enableDrag: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (context){
      return Container(
                height: MediaQuery.of(context).size.height*.55,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                  
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 4,
                          width: 60,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                  
                      
                      MyInputField(hint: "Product name", textcontroller: prodnamecontroller, length: 20,maxlines: 1,),
                  
                      MyInputField(hint: "Short description", textcontroller: prodsubnamecontroller, length: 50,maxlines: 2,),
                  
                      MyInputField(hint: "Product details", textcontroller: proddesccontroller, length: 320, maxlines: 4),
                  
                      MyInputField(hint: "Price", textcontroller: prodpricecontroller, length: 10,maxlines: 1,),


                  
                      InkWell(
                  onTap: () {
                    
                    UploadProduct();
                                       
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(55),
                      boxShadow: const [
                        BoxShadow(
                                offset: Offset(1.5, 1.5),
                                color: Colors.black87,
                                spreadRadius: 2,
                                blurRadius: 1,
                              ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      "Upload Product",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                ),
                    ],
                  ),
                ),
              );
    });
}
