//AllProducts (updated)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/ProductPage/ProductPage.dart';
import 'package:ecommerce_app/Seller/Utilis/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key, required this.Product, required this.productimage});
  final String Product;
  final String productimage;

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("ProductPage",style: GoogleFonts.poppins(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        children: [
                  
          const SizedBox(
            height: 15,
          ),


          Expanded(
            child: StreamBuilder(
              stream: firestore.collection("Product").where("Option",isEqualTo: widget.Product.toString()).snapshots(),
              builder: (context,snapshot){
                
                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return CircularProgressIndicator(color: Colors.deepPurple,);
                }

                else{
                  QuerySnapshot productsnapshot = snapshot.data as QuerySnapshot;
                
                  if(snapshot.hasData)
                  {
                    return GridView.builder(    
              scrollDirection: Axis.vertical,
              itemCount: productsnapshot.docs.length,    
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 320), 
              itemBuilder: (context,index){

                 Map<String,dynamic> productdata = productsnapshot.docs[index].data() as Map<String,dynamic>;
                 ProductModel productmodel = ProductModel().fromMap(productdata);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductPage(Productid: productmodel.id.toString(),)));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(image: NetworkImage(productmodel.image.toString())),
                              ),
                            ),
                          ),
                    
                    
                          const SizedBox(
                            height: 5,
                          ),
                    
                          ListTile(
                            title: Text(productmodel.name.toString(),style: GoogleFonts.poppins(),overflow: TextOverflow.ellipsis),
                            subtitle: Text(productmodel.desc.toString(),style: GoogleFonts.poppins(),overflow: TextOverflow.ellipsis),
                            trailing: Text(productmodel.price.toString(),style: GoogleFonts.poppins(color: Colors.black),),
                          )
                        ],
                      ),
                    ),
                  );
                 });

                  }

                  else{
                    return Container();
                  }
                }
              })
          ),
        ],
      ),
    );
  }
}





//PRoductPage (updated)

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Seller/Utilis/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.Productid, });
  final String Productid;
  

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final firestore = FirebaseFirestore.instance;

  bool likeontap = false;
  bool buybuttonpressed = false;
  bool cartbuttonpressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SafeArea(
        child: StreamBuilder(
              stream: firestore.collection("Product").where("id",isEqualTo: widget.Productid).snapshots(),
              builder: (context,snapshot){

                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return CircularProgressIndicator(color: Colors.deepPurple,);
                }

                else{
                   QuerySnapshot productsnapshot = snapshot.data as QuerySnapshot;

                     if(snapshot.hasData)
                     {
                        Map<dynamic,dynamic> productmap = productsnapshot.docs[0].data() as Map<dynamic,dynamic>;
                        ProductModel productModeL = ProductModel().fromMap(productmap);

                        return Stack(
                                 children: [


            //Lower Violet Part of Screen

             Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      const SizedBox(
                        height: 30,
                      ),

                      Text(productModeL.name.toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                      Text(productModeL.desc.toString(),style: GoogleFonts.poppins(color: Colors.white70),),

                      const SizedBox(
                        height: 30,
                      ),

                      Text("Description",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                      Text(productModeL.details.toString(),style: GoogleFonts.poppins(color: Colors.white70),softWrap: true,),

                      const SizedBox(
                        height: 20,
                      ),

                      
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Price",style: GoogleFonts.poppins(color: Colors.white,fontSize: 26),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Container(
                              height: 50,
                              width: 140,
                              decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: Colors.grey),borderRadius: const BorderRadius.horizontal(left: Radius.elliptical(40, 20))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,border: Border.all(color: Colors.white)),
                                    ),
                                    Text("${productModeL.price}/-",style: GoogleFonts.poppins(color: Colors.white,fontSize: 26),),
                                  ],
                                  ),
                                ))),
                          ),
                       ],
                     ),
                    ],
                  ),
                ),
              ),
            ),




            // Upper Navigator and Like Buttons

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 4,right: 10,top: 4,bottom: 4),
                   child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back,color: Colors.black)),
                       
                      IconButton(onPressed: (){
                        setState(() {
                          likeontap = !likeontap;
                        });
                      }, icon: likeontap?const Icon(Icons.favorite,color: Colors.red,):const Icon(Icons.favorite_border,))
                    ],
                   ),
                 ),



                  //Product Image

                  CarouselSlider(                                       
                    items: productModeL.images!.map((i) {
                      return Builder(
                        builder: (BuildContext context){
                          return Container(
                            height: 320,
                            width: 320,
                            child: Center(
                              child: Image(image: NetworkImage(i),height: 320,width: 240,fit: BoxFit.cover,),
                            ),
                          );
                        });
                    }).toList(), 
                    options: CarouselOptions(height: 400,enlargeCenterPage: true,enlargeStrategy: CenterPageEnlargeStrategy.zoom,enlargeFactor: 0.6,enableInfiniteScroll: false))
              ],
            ),


            
            //Bottom Buy And Cart Buttons

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                           setState(() {
                             buybuttonpressed = !buybuttonpressed;
                           });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(55),
                          boxShadow: [
                            buybuttonpressed
                                ? const BoxShadow()
                                : const BoxShadow(
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black87,
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                  ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                          setState(() {
                          cartbuttonpressed = !cartbuttonpressed;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(55),
                        boxShadow: [
                            cartbuttonpressed
                                ? const BoxShadow()
                                :  const BoxShadow(
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                  ),
                          ],),
                        child: Center(
                          child: Text("Buy now",style: GoogleFonts.poppins(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
                     }

                     else{
                      return Container();
                     }
                }
              }),
      ),
    );
  }
}





//ProductModalBottomSheet (updated)

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

  List<String>Options = ["Upperwear","Lowerwear","Footwear","Utensils","Appliances","Jewellery","Electronics","Travel","Mobile"];

  String Option = "Upperwear";


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

      final timestamp = Timestamp.now();
      final productid = DateTime.now().millisecondsSinceEpoch.toString();

      await firestore.collection("Product").doc(productid).set({
        "seller": user!.phoneNumber,
        "id": productid,
        "ProductName": prodnamecontroller.text.toString(),
        "ShortDesc": prodsubnamecontroller.text.toString(),
        "ProductDetails": proddesccontroller.text.toString(),
        "Price": prodpricecontroller.text.toString(),
        "mainimage": url2,
        "Option": Option,
        "UploadTime" : timestamp,
        "Images": [
          url1,url2,url3
        ]
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
                height: MediaQuery.of(context).size.height*.65,
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
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Type :",style: GoogleFonts.poppins(color: Colors.grey.shade700),),
                              DropdownButton(
                                value: Option,
                                items: Options.map((String e) {
                                  return DropdownMenuItem(
                                    onTap: (){
                                      Option = e.toString();
                                    },
                                    value: e,
                                    child: Text(e,style: GoogleFonts.poppins(color: Colors.grey),));
                                }).toList(), 
                                onChanged: (value){
                                  Option = value.toString();
                                }),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      
                  
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















