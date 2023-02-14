import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ShoppingModel.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.shop});
  final Shopping shop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shop.scolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: shop.scolor,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_outlined),),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined))
            ],
          )
        ],
      ),
      body: Stack(
        children: [
           Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 420,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Colors",style: GoogleFonts.jost(color: Colors.black,fontSize: 16),),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black),shape: BoxShape.circle),
                                    child: Center(
                                      child: Container(
                                        height: 16,
                                        width: 16,
                                        decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),),
                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                    Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black),shape: BoxShape.circle),
                                    child: Center(
                                      child: Container(
                                        height: 16,
                                        width: 16,
                                        decoration: BoxDecoration(color: shop.scolor,shape: BoxShape.circle),),
                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                   Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black),shape: BoxShape.circle),
                                    child: Center(
                                      child: Container(
                                        height: 16,
                                        width: 16,
                                        decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      
                        Expanded(
                          child: Column(
                            children: [
                             Text("Size",style: GoogleFonts.jost(color: Colors.black,fontSize: 16),),
                             Text("25cm",style: GoogleFonts.jost(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                     Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(shop.Description,style: GoogleFonts.jost(fontSize: 15),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CartCounter(),
                      SizedBox(
                        height: 10,
                      ),
                      BuyButton(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Text(shop.subtext,style: GoogleFonts.jost(fontSize: 20,color: Colors.white),), 
                   Text(shop.Name,style: GoogleFonts.jost(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500),), 
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price",style: GoogleFonts.jost(fontSize: 20,color: Colors.white),),
                          Text("\$${shop.price}",style: GoogleFonts.jost(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      
                      Expanded(child: Image.asset(shop.simage,scale: 5.0,)),
                     ],
                   ),
              ],
            ),
          ),
        ],
      )
    );
  }
}



class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int size = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 50,
          child: OutlinedButton(
            onPressed: (){
              setState(() {
                if (size>0) {
               --size;
                }
              });
            }, child: Center(child: Icon(Icons.remove,color: Colors.black,))),
        ),
        Container(
            width: 50,
            child: Center(child: Text(size.toString(),style: GoogleFonts.jost(fontSize: 20),)),
        ),
        SizedBox(
          height: 30,
          width: 50,
          child: OutlinedButton(
            onPressed: (){
               setState(() {
                size++;
              });
            }, child: Center(child: Icon(Icons.add,color: Colors.black,))),
        ),
      ],
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: (){}, child: Text("Add to cart",style: GoogleFonts.jost(color: Colors.black,fontSize: 25),)),
        SizedBox(width: 50,),
        ElevatedButton(onPressed: (){}, child: Text("Buy Now",style: GoogleFonts.jost(color: Colors.white,fontSize: 25),),style: ElevatedButton.styleFrom(backgroundColor:  ),)
      ],
    );
  }
}
