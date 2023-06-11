//HomePage

import 'package:ecommerce_app/HomePage/Utilities/CategorySection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HomePage",style: GoogleFonts.poppins(),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("Categories",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
          ),

          const CategoriesSection(),

           const SizedBox(
          height: 40,
        ),

        Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("Offers",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
          ),

        ],
      ),
    );
  }
}



//CategorySection

import 'package:ecommerce_app/AllProducts/AllProducts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0,right: 15,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             ItemContainer(Optionlogo: "assets/Categories/Shirt.png",product: "Upperwear"),
             ItemContainer(Optionlogo: "assets/Categories/Pants.png",product: "Lowerwear"),
             ItemContainer(Optionlogo: "assets/Categories/Shoes.png",product: "Footwear"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0,right: 15,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             ItemContainer(Optionlogo: "assets/Categories/Utensil.png",product: "Utensils",),
             ItemContainer(Optionlogo: "assets/Categories/Fridge.png",product: "Appliances"),
             ItemContainer(Optionlogo: "assets/Categories/Ring.png",product: "Jewellery",),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0,right: 15,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             ItemContainer(Optionlogo: "assets/Categories/Laptop.png",product: "Electronics",),
             ItemContainer(Optionlogo: "assets/Categories/Trolleybag.png",product: "Travel"),
             ItemContainer(Optionlogo: "assets/Categories/Phone.png",product: "Mobile",),
            ],
          ),
        ),

       
      ],
    );
  }
}





class ItemContainer extends StatefulWidget {
  const ItemContainer({super.key, required this.Optionlogo, required this.product});
  final String Optionlogo;
  final String product;

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AllProducts(Product: widget.product.toString(),)));
    },
    child: Column(
      children: [
        AnimatedContainer(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: Colors.deepPurple),
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: Image(image: AssetImage(widget.Optionlogo),height: 70,width: 70,),
                  )
                  ),

        const SizedBox(
          height: 3,
        ),


        Text(widget.product,style: GoogleFonts.poppins(color: Colors.black),)
      ],
    ),
  );
  }
}
