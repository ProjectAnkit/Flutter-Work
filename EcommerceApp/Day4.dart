//CartPage

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:  Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(    
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("My Cart",style: GoogleFonts.poppins(color: Colors.white),)),
                        ),
          
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            SizedBox(
                              height: 5,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: const Center(
                                child: Divider(thickness: 0.8,),
                              ),
                            ),

                            Center(child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("6 Items in your cart",style: GoogleFonts.poppins(color: Colors.grey),),
                            )),

                            SizedBox(
                              height: 5,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: const Center(
                                child: Divider(thickness: 0.8,),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),
          
                        const MyCartItem(),
                        const MyCartItem(),
                        const MyCartItem(),
                        const MyCartItem(),
                        const MyCartItem(),
                        const MyCartItem(),
                        
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
  const MyCartItem({super.key});

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
          ),
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Check Shirt",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),),
              Text("cotton regular fit shirt ",style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16),),
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

              Text("999/-",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
