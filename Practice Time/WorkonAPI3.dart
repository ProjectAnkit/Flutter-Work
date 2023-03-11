import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/NewModel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  Future<NewModel>getData()async{
    final response = await http.get(Uri.parse("https://webhook.site/4bb5e7bf-42cf-4094-af2d-10428a852e2b"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
        return NewModel.fromJson(data);
    }
    else{
      return NewModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(backgroundColor: Colors.black,),
       body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: ((context,AsyncSnapshot<NewModel> snapshot) {
              if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount: snapshot.data!.data![0].products!.length,
                  itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data!.data![0].image.toString())),
                          title: Text(snapshot.data!.data![0].name.toString()),
                          subtitle: Text(snapshot.data!.data![0].shopemail.toString()),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.4,
                          width: MediaQuery.of(context).size.width *1,
                          child: ListView.builder(
                            itemCount: snapshot.data!.data![0].products![index].images!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, position) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.25,
                                width: MediaQuery.of(context).size.width*1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(snapshot.data!.data![0].products![index].images![position].url.toString()))
                                ),
                              ),
                            );
                          })),
                        ),
                      ],
                    ),
                  );
                }));
              }
              else{
                return Center(child: CircularProgressIndicator(color: Colors.black,),);
              }
            })),
          )
        ],
       ),
    );
  }
}




class NewModel {
  bool? success;
  String? message;
  List<Data>? data;

  NewModel({this.success, this.message, this.data});

  NewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;
  int? iV;
  List<Products>? products;

  Data(
      {this.sId,
      this.isActive,
      this.createdAt,
      this.name,
      this.description,
      this.shopemail,
      this.shopaddress,
      this.shopcity,
      this.userid,
      this.image,
      this.iV,
      this.products});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    image = json['image'];
    iV = json['__v'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['shopemail'] = this.shopemail;
    data['shopaddress'] = this.shopaddress;
    data['shopcity'] = this.shopcity;
    data['userid'] = this.userid;
    data['image'] = this.image;
    data['__v'] = this.iV;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  String? categories;
  String? subcate;
  String? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? colors;
  String? size;
  List<Images>? images;
  int? iV;
  bool? inWishlist;

  Products(
      {this.sId,
      this.onSale,
      this.salePercent,
      this.sold,
      this.sliderNew,
      this.sliderRecent,
      this.sliderSold,
      this.date,
      this.title,
      this.categories,
      this.subcate,
      this.shop,
      this.price,
      this.saleTitle,
      this.salePrice,
      this.description,
      this.colors,
      this.size,
      this.images,
      this.iV,
      this.inWishlist});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    onSale = json['on_sale'];
    salePercent = json['sale_percent'];
    sold = json['sold'];
    sliderNew = json['slider_new'];
    sliderRecent = json['slider_recent'];
    sliderSold = json['slider_sold'];
    date = json['date'];
    title = json['title'];
    categories = json['categories'];
    subcate = json['subcate'];
    shop = json['shop'];
    price = json['price'];
    saleTitle = json['sale_title'];
    salePrice = json['sale_price'];
    description = json['description'];
    colors = json['colors'];
    size = json['size'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    iV = json['__v'];
    inWishlist = json['in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['on_sale'] = this.onSale;
    data['sale_percent'] = this.salePercent;
    data['sold'] = this.sold;
    data['slider_new'] = this.sliderNew;
    data['slider_recent'] = this.sliderRecent;
    data['slider_sold'] = this.sliderSold;
    data['date'] = this.date;
    data['title'] = this.title;
    data['categories'] = this.categories;
    data['subcate'] = this.subcate;
    data['shop'] = this.shop;
    data['price'] = this.price;
    data['sale_title'] = this.saleTitle;
    data['sale_price'] = this.salePrice;
    data['description'] = this.description;
    data['colors'] = this.colors;
    data['size'] = this.size;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['in_wishlist'] = this.inWishlist;
    return data;
  }
}

class Images {
  String? sId;
  String? filename;
  String? url;

  Images({this.sId, this.filename, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    filename = json['filename'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['filename'] = this.filename;
    data['url'] = this.url;
    return data;
  }
}

