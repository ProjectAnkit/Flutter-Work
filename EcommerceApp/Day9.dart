//SellerPage
import 'package:ecommerce_app/Seller/UploadItemPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({super.key});

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("SellerPage",style: GoogleFonts.poppins(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10),
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                "Your Listed Products",
                style: GoogleFonts.poppins(color: Colors.white),
              )),
            ),
          ),



          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: 120,
                    decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
                  ),
                );
              }),
          ),

          

          const SizedBox(
            height: 40,
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadItemPage()));
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

          const Expanded(child: Column()),

          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
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
      ),
    );
  }
}
