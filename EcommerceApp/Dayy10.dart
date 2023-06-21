//UploadProductPage

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UploadItemPage extends StatefulWidget {
  const UploadItemPage({super.key});

  @override
  State<UploadItemPage> createState() => _UploadItemPageState();
}

class _UploadItemPageState extends State<UploadItemPage>{

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showproductSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("UploadItem",style: GoogleFonts.poppins(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){

                    SelectImage1();

                  },
                  child: Container(
                    height: 160,
                    width: 90,
                    decoration: BoxDecoration(color: Colors.grey.shade100,border: Border.all(color: Colors.grey.shade400)),
                    child: Center(
                      child: Text("tap to add image",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontSize: 12),textAlign: TextAlign.center,),
                    ),
                  ),
                ),


                InkWell(
                  onTap: (){

                    SelectImage2();

                  },
                  child: Container(
                    height: 260,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.grey.shade100,border: Border.all(color: Colors.grey.shade400)),
                    child: Center(
                      child: Text("tap to add image",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontSize: 12),),
                    ),
                  ),
                ),


                InkWell(
                  onTap: (){

                    SelectImage3();

                  },
                  child: Container(
                    height: 160,
                    width: 90,
                    decoration: BoxDecoration(color: Colors.grey.shade100,border: Border.all(color: Colors.grey.shade400)),
                    child: Center(
                      child: Text("tap to add image",style: GoogleFonts.poppins(color: Colors.grey.shade400,fontSize: 12),textAlign: TextAlign.center,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          

          const SizedBox(
            height: 50,
          ),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Remember !",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("1. Uploaded product image should be in cutout.",style: GoogleFonts.poppins(color: Colors.grey.shade600,fontSize: 14),softWrap: true,),
                  Text("2. Upload product image should be in png format.",style: GoogleFonts.poppins(color: Colors.grey.shade600,fontSize: 14),softWrap: true,),
                  Text("3. Uploaded product image should be clear.",style: GoogleFonts.poppins(color: Colors.grey.shade600,fontSize: 14),softWrap: true,),
                  Text("4. Uploaded product image should be related to that product.",style: GoogleFonts.poppins(color: Colors.grey.shade600,fontSize: 14),softWrap: true,),
                  Text("5. Uploaded product image size should less than 5 mb.",style: GoogleFonts.poppins(color: Colors.grey.shade600,fontSize: 14),softWrap: true,),
                  Text("6. Uploaded product image should be in Boxfit.",style: GoogleFonts.poppins(color: Colors.grey.shade600,fontSize: 14),softWrap: true,),
              ],
            ),
          ),

          Expanded(child: Column()),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Center(
              child: IconButton(onPressed: ()async{
                await showproductSheet(context);
              }, icon: const Icon(Icons.keyboard_double_arrow_up,color: Colors.deepPurple,size: 40,),),
            ),
          )
         
        ],
      ),
    );
  }
}










//BottomSheet

import 'package:ecommerce_app/Seller/Utilis/CustomInputField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future <dynamic> showproductSheet(BuildContext context)async{

  TextEditingController prodnamecontroller = TextEditingController();
  TextEditingController prodsubnamecontroller = TextEditingController();
  TextEditingController proddesccontroller = TextEditingController();
  TextEditingController prodpricecontroller = TextEditingController();

  await showModalBottomSheet(
    context: context, 
    enableDrag: true,
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    builder: (context){
      return Container(
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

                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Upload Product",style: GoogleFonts.poppins(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              );
    });

}





//CustomInputField

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({super.key, required this.hint, required this.textcontroller, required this.length, required this.maxlines});
  final String hint;
  final TextEditingController textcontroller;
  final int maxlines;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  maxLength: length,
                  maxLines: maxlines,
                  style: GoogleFonts.poppins(),
                  controller: textcontroller,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: hint,
                    hintStyle: GoogleFonts.poppins(),
                    border: InputBorder.none),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





