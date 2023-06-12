//Product Page

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.tag});
  final String tag;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  List<String> Images = ["assets/Products/checkshirt.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SafeArea(
        child: Stack(
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

                      Text("Neville Shirt",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                      Text("Blue Check cotton regular shirt",style: GoogleFonts.poppins(color: Colors.white70),),

                      const SizedBox(
                        height: 30,
                      ),

                      Text("Description",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                      Text("djfdskjbfjsfkjsbfdbskjbfdskjfbkfbdsjfbkjfsdkfjkdsbfkdsjfbdsfjdbfdskjfbdskfbdskjfbdskjfdbfjdsbfdskjfsbfkdbskjfbsdkjfbdskjfdbsfjdsbfdsjfdskfdsbfdsjkfbdskjfdsbfdskjbdsfbdskjbfdsfbdskfkjfbdskbfdskjfbdsfkjdsbfkjdsbfdskjfbdskjfbdsfkjdsbfdskjbfdskjfbdsf",style: GoogleFonts.poppins(color: Colors.white70),softWrap: true,),

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
                              height: 60,
                              width: 140,
                              decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: Colors.white),borderRadius: const BorderRadius.horizontal(left: Radius.elliptical(40, 20))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.white)),
                                    ),
                                    Text("999/-",style: GoogleFonts.poppins(color: Colors.white,fontSize: 32),),
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
                       
                      Icon(Icons.favorite,color: Colors.red[700],size: 35,)
                    ],
                   ),
                 ),



                  //Product Image

                  CarouselSlider(                    
                    items: Images.map((i) {
                      return Builder(
                        builder: (BuildContext context){
                          return Container(
                            height: 320,
                            width: 320,
                            child: Center(
                              child: Image(image: AssetImage(i),height: 320,width: 240,fit: BoxFit.cover,),
                            ),
                          );
                        });
                    }).toList(), 
                    options: CarouselOptions(height: 400,enlargeCenterPage: true,enlargeStrategy: CenterPageEnlargeStrategy.zoom,enlargeFactor: 0.6))
              ],
            ),


            
            //Bottom Buy And Cart Buttons

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                           
                      },
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(55)),
                        child: Center(
                          child: Text("Add to Cart",style: GoogleFonts.poppins(color: Colors.black),),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(55)),
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
        ),
      ),
    );
  }
}
