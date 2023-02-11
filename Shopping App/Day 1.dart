//HomePAge

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/ShoppingModel.dart';
import 'package:shopping/shoppingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Shopping>Items = [
    Shopping(Name: "Gucci Bag", price: "999", simage: "assets/Purse1.png", scolor: Colors.brown),
    Shopping(Name: " Bag", price: "999", simage: "assets/Purse2.png", scolor: Color.fromARGB(255, 11, 124, 147)),
    Shopping(Name: "Gucci Bag", price: "999", simage: "assets/Purse3.png", scolor: Color.fromARGB(255, 149, 19, 10)),
    Shopping(Name: "Gucci Bag", price: "999", simage: "assets/Purse4.png", scolor: Colors.brown.shade700),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),),
        title: Center(child: Text("shopme",style: GoogleFonts.jost(fontWeight: FontWeight.w300),)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined)),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.74),
          itemCount: Items.length,
          itemBuilder: ((context, int index) => Shopcard(shop: Items[index]))),
      )
    );
  }
}

//Shopping CArd

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/ShoppingModel.dart';

class Shopcard extends StatelessWidget {
  const Shopcard({super.key, required this.shop});
  final Shopping shop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(color: shop.scolor,borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Image.asset(shop.simage)
                ),
              ),
              Text(shop.Name,style: GoogleFonts.jost(fontWeight: FontWeight.w400,fontSize: 20),),
              Text("\$${shop.price}",style: GoogleFonts.jost(color: Colors.grey,fontSize: 15),)
      ],
    );
  }
}

//Shopping Model
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class Shopping {
  String Name;
  String price;
  String simage;
  Color scolor;
  Shopping({
    required this.Name,
    required this.price,
    required this.simage,
    required this.scolor,
  });
}
