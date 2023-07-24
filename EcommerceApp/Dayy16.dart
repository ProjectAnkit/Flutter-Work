//Wishlist Page

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/CartPage/GetProduct.dart';
import 'package:ecommerce_app/ProductPage/ProductPage.dart';
import 'package:ecommerce_app/Seller/Utilis/ProductModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,   
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                      child: Text("My Wishlist",style: GoogleFonts.poppins(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w400),),
                    ),
          
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Items you liked will be saved here",style: GoogleFonts.poppins(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
          
          
                const Icon(Icons.favorite,color: Colors.black,size: 30,),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          const Divider(color: Colors.grey,thickness: 0.68),
          
          
          Expanded(
            child: StreamBuilder(
              stream: firestore
                  .collection("User")
                  .doc(user!.phoneNumber)
                  .collection("wishlist")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                } else {
                  if (snapshot.hasData) {
                    QuerySnapshot datasnapshot = snapshot.data as QuerySnapshot;
                    return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 370),
                        itemCount: datasnapshot.docs.length,
                        itemBuilder: (context, index) {
                          String productid =
                              datasnapshot.docs[index]["id"].toString();
                            
                          return FutureBuilder(
                              future: getProduct(productid),
                              builder: ((context, asyncsnapshot) {
                                if (asyncsnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else {
                                  if (asyncsnapshot.hasData) {
                                    ProductModel productModel =
                                        asyncsnapshot.data as ProductModel;
                            
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: (){

                                              firestore.collection("User").doc(user.phoneNumber).collection("wishlist").doc(productid).delete();
                                              
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),


                                          const SizedBox(
                                            height: 2,
                                          ),


                                          InkWell(
                                                              onTap: (){
                                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductPage(Productid: productModel.id.toString(),)));
                                                              },
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                 
                                                                  Container(
                                                                    height: 220,
                                                                    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)),
                                                                    child: Center(
                                                                      child: CachedNetworkImage(
                                                                           imageUrl: productModel.image.toString(),
                                                                           placeholderFadeInDuration: const Duration(milliseconds: 100),
                                                                           placeholder: (context, url) => 
                                                                           Shimmer.fromColors(
                                                                                                baseColor: Colors.grey.shade300,
                                                                                                highlightColor: Colors.white60,
                                                                                                 child: Container(
                                                                                                    height: 220,
                                                                                                    decoration: BoxDecoration(
                                                                                                    color: Colors.grey.shade300,
                                                                                                    borderRadius: BorderRadius.circular(10)),
                                                                                                  ),
                                                                           ),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                                                                  
                                                                                                                  
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                                                                  
                                                                  ListTile(
                                                                    title: Text(productModel.name.toString(),style: GoogleFonts.poppins(),overflow: TextOverflow.ellipsis),
                                                                    subtitle: Text(productModel.desc.toString(),style: GoogleFonts.poppins(),overflow: TextOverflow.ellipsis),
                                                                    trailing: Text(productModel.price.toString(),style: GoogleFonts.poppins(color: Colors.black),),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                        ],
                                      ),
                                    );
          
                    }      
                    
                          else {
                                    return Container();
                                  }
                                }
                              }));
                        });
                  } else {
                    return Container();
                  }
                }
              }),
          ),
        ],
      ),
    );
  }
}
