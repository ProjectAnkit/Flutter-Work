//CartPage (Modified)

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/CartPage/GetProduct.dart';
import 'package:ecommerce_app/Seller/Utilis/ProductModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body:  Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(    
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
                            child: Center(child: Text("My Cart",style: GoogleFonts.poppins(color: Colors.white),)),
                          ),
                        ),
          
                        const SizedBox(
                          height: 20,
                        ),

                        StreamBuilder(
                          stream: firestore.collection("User").doc(user!.phoneNumber).collection("Cart").snapshots(),
                          builder: (context,snapshot){     

                            if(snapshot.connectionState == ConnectionState.waiting)
                            {
                                 return Container();
                            }

                            else{

                              if(snapshot.hasData)
                              {
                                QuerySnapshot datasnapshot = snapshot.data as QuerySnapshot;
                                return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: const Center(
                                              child: Divider(
                                                thickness: 0.8,
                                              ),
                                            ),
                                          ),
                                          Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "${datasnapshot.docs.length} Items in your cart",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey),
                                            ),
                                          )),
                                          SizedBox(
                                            height: 5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: const Center(
                                              child: Divider(
                                                thickness: 0.8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                       Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14.0),
                                        child: SizedBox(
                                          height: 460,
                                          child: ListView.builder(
                                            itemCount: datasnapshot.docs.length,
                                            itemBuilder: (context,index){
                                          
                                              String productid = datasnapshot.docs[index]["id"].toString();
                                          
                                              return FutureBuilder(
                                                future: getProduct(productid),
                                                builder: ((context, asyncsnapshot) {
                                              
                                                  if(asyncsnapshot.connectionState == ConnectionState.waiting)
                                                  {
                                                    return Container();
                                                  }

                                                  else{

                                                    if(asyncsnapshot.hasData)
                                                    {
                                                       ProductModel productModel = asyncsnapshot.data as ProductModel;
                                              
                                                       return MyCartItem(productModel: productModel,);
                                                    }

                                                    else{
                                                      return Container();
                                                    }
                                                  }
                                                  
                                                }));
                                          
                                            }),
                                        )
                                      ),
                                    ],
                                  );                  
                              }

                              else{
                                return Container();
                              }
                            }
                            

                          }),

                        const SizedBox(
                          height: 10,
                        ),

                        Divider(color: Colors.grey.shade300,thickness: 0.8,),

                        
                        const SizedBox(
                          height: 10,
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Price",style: GoogleFonts.poppins(color: Colors.grey),),
                                     Text("1200/-",style: GoogleFonts.poppins(color: Colors.black),),
                                  ],
                                ),
                              ),

                             Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Discount",style: GoogleFonts.poppins(color: Colors.grey),),
                                     Text("-300/-",style: GoogleFonts.poppins(color: Colors.black),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sale Price",style: GoogleFonts.poppins(color: Colors.grey),),
                                     Text("999/-",style: GoogleFonts.poppins(color: Colors.black),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Service tax",style: GoogleFonts.poppins(color: Colors.grey),),
                                     Text("22/-",style: GoogleFonts.poppins(color: Colors.black),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Covenience charges",style: GoogleFonts.poppins(color: Colors.grey),),
                                     Text("0/-",style: GoogleFonts.poppins(color: Colors.black),),
                                  ],
                                ),
                              ),

                              Divider(color: Colors.grey.shade300,thickness: 0.8,),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Price",style: GoogleFonts.poppins(color: Colors.grey),),
                                     Text("1021/-",style: GoogleFonts.poppins(color: Colors.black),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )

                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(color: Colors.deepPurple),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                             Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(55)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0,left: 32),
                              child: Row(
                                children: [
                                 const CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: Colors.black,
                                  child: Center(child: Icon(Icons.arrow_back,size: 12,),),
                                 ),
                                 
                                 const SizedBox(
                                  width: 10,
                                 ),

                                  Text("Go back",style: GoogleFonts.poppins(color: Colors.black),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              
                      InkWell(
                        onTap: (){
              
                        },
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(55)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0,left: 32),
                              child: Row(
                                children: [

                                  Text("Place Order",style: GoogleFonts.poppins(color: Colors.black),),

                                  const SizedBox(
                                  width: 10,
                                 ),

                                  const CircleAvatar(
                                  maxRadius: 10,
                                  backgroundColor: Colors.black,
                                  child: Center(child: Icon(Icons.check,size: 12,),),
                                 ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}



class MyCartItem extends StatelessWidget {
  const MyCartItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 190,
            width: 140,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
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
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productModel.name.toString(),style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),overflow: TextOverflow.ellipsis),
              Text(productModel.details.toString(),style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16),overflow: TextOverflow.ellipsis),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Text("Size : ",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(child: Text("M",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),)),
                    ),
                    ),
                  ],
                ),
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity : ",style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                  Row(
                    children: [
                      
                      IconButton(onPressed: (){

                      }, icon: const Icon(Icons.add)),

                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text("1",style: GoogleFonts.poppins(color: Colors.black),),
                        )),

                      IconButton(onPressed: (){

                      }, icon: const Icon(Icons.remove)),
                    ],
                  ),
                ],
              ),

              Text("${productModel.price}/-",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}




//FutureFunction

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Seller/Utilis/ProductModel.dart';


final firestore = FirebaseFirestore.instance;

Future<ProductModel> getProduct(String productid)async{
 
   final document = await firestore.collection("Product").doc(productid).get();

   Map<String,dynamic> productmap = document.data() as Map<String,dynamic>;
   ProductModel productModel = ProductModel().fromMap(productmap);

   return productModel;
}
