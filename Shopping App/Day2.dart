// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/ItemPage.dart';

import 'package:shopping/ShoppingModel.dart';
import 'package:shopping/shoppingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Shopping>Items = [
    Shopping(Name: "Gucci Purse", price: "999", simage: "assets/Purse1.png", scolor: Colors.brown),
    Shopping(Name: "Swarna Purse", price: "789", simage: "assets/Purse2.png", scolor: Color.fromARGB(255, 11, 124, 147)),
    Shopping(Name: "Trispy Purse", price: "669", simage: "assets/Purse3.png", scolor: Color.fromARGB(255, 149, 19, 10)),
    Shopping(Name: "Shiks Purse", price: "1999", simage: "assets/Purse4.png", scolor: Colors.brown.shade700),
    Shopping(Name: "Gucci Purse", price: "999", simage: "assets/Purse1.png", scolor: Colors.brown),
    Shopping(Name: "Swarna Purse", price: "789", simage: "assets/Purse2.png", scolor: Color.fromARGB(255, 11, 124, 147)),
    Shopping(Name: "Trispy Purse", price: "669", simage: "assets/Purse3.png", scolor: Color.fromARGB(255, 149, 19, 10)),
    Shopping(Name: "Shiks Purse", price: "1999", simage: "assets/Purse4.png", scolor: Colors.brown.shade700),
    Shopping(Name: "Gucci Purse", price: "999", simage: "assets/Purse1.png", scolor: Colors.brown),
    Shopping(Name: "Swarna Purse", price: "789", simage: "assets/Purse2.png", scolor: Color.fromARGB(255, 11, 124, 147)),
    Shopping(Name: "Trispy Purse", price: "669", simage: "assets/Purse3.png", scolor: Color.fromARGB(255, 149, 19, 10)),
    Shopping(Name: "Shiks Purse", price: "1999", simage: "assets/Purse4.png", scolor: Colors.brown.shade700),
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
        child: Column(
          children: <Widget>[
            Text("Women",style: GoogleFonts.jost(fontSize: 25,fontWeight: FontWeight.w400),),
            Options(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.74),
                itemCount: Items.length,
                itemBuilder: ((context, int index) => InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(),));
                  },
                  child: Shopcard(shop: Items[index])))),
            ),
          ],
        ),
      )
    );
  }
}

 
 class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

  var Categories = ["Purses","Jewellery","Shoes","Dress","Tops"];

  int select  = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (context, index) => OptionCard(index),
      ),
    );
  }


 Widget OptionCard(int index){
  return GestureDetector(
    onTap: () {
      setState(() {
        select = index;
      });
    },
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: Column(
            children: [
              Text(Categories[index],style: GoogleFonts.jost(fontSize: 22,fontWeight: FontWeight.w400 ,color: select==index?Colors.black:Colors.grey)),
              select==index?Container(
                    height: 3,
                    width: 30,
                    color: Colors.black,
                  ):Container(),
                  SizedBox(
                    height: 4,
                  )
            ],
          ),
        ),
      ),
  );
 }
 }
