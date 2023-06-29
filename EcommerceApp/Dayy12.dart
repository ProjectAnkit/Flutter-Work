//SellerPage (Modified)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Seller/UploadItemPage.dart';
import 'package:ecommerce_app/Seller/Utilis/ProductModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({super.key});

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    return Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.start,              
                  children: [
          
                    const SizedBox(
                      height: 90,
                    ),
          
                    Container(
              height: 40,
              width: 160,
              decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your Listed Products",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
              )),
            ),
        
            
        
            const SizedBox(
              height: 10,
            ),
          
          
          
                    SizedBox(
                      height: 250,
                      child: StreamBuilder(
                        stream: firestore.collection("Seller").doc(user!.phoneNumber).collection("Products").snapshots(),
                        builder: (context,snapshot){

                        if(snapshot.connectionState == ConnectionState.active)
                        {

                          if(snapshot.hasData){

                             QuerySnapshot snapshotdata = snapshot.data as QuerySnapshot;

                             return ListView.builder(
                              itemCount: snapshotdata.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          ProductModel product = ProductModel();

                          Map<String,dynamic> usermap = snapshotdata.docs[index].data() as Map<String,dynamic>;
                          ProductModel productModel = product.fromMap(usermap);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: 120,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey.shade300)),
                                  child: Image(image: NetworkImage(productModel.image!,),)
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(productModel.name.toString(),style: GoogleFonts.poppins(color: Colors.black),overflow: TextOverflow.ellipsis,),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Price : ",style: GoogleFonts.poppins(color: Colors.grey.shade500),),

                                      Text(productModel.price.toString()+"/-",style: GoogleFonts.poppins(color: Colors.black),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                          }

                          else{
                            return Container();
                          }
                        }

                        else{
                          return Container();
                        }

                         
                        })
                    ),
          
                    
          
                    const SizedBox(
                      height: 20,
                    ),
          
          
                    Container(
                      height: 260,
                      decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 14),
                            child: Text("Do you want to list your new product ? click on the button below ",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16),softWrap: true,),
                          ),
          
                          InkWell(
                            onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const UploadItemPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(55)),
                                child: Center(
                                  child: Text("Add Product",style: GoogleFonts.poppins(color: Colors.white),),
                                ),
                              ),
                            ),
                          ),
          
                          InkWell(
                            onTap: (){
          
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(55)),
                                child: Center(
                                  child: Text("Need help ?",style: GoogleFonts.poppins(color: Colors.black),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
    
    
                     
                     const SizedBox(
                      height: 40,
                     ),
    
    
                     Container(
                       height: 90,
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(15)),
                       child: Center(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("No more want to be a seller ? ",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16),),
                             InkWell(
                               onTap: (){
                                 
                               },
                               child: Text(" click here ",style: GoogleFonts.poppins(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)),
                           ],
                         ),
                       ),
                     ),
    
                  ],
                );
  }
}
