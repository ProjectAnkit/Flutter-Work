//HomePage

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<UserModel>UserList = [];

  Future<List<UserModel>>getUserData() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
      for(Map<String, dynamic> i in data)
      {
          UserList.add(UserModel.fromJson(i));
      }
      return UserList;
    }else{
      return UserList;
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
              future: getUserData(),
              builder: ((context,AsyncSnapshot<List<UserModel>> snapshot) {
              if(!snapshot.hasData)
              {
                 return Center(child: CircularProgressIndicator(color: Colors.black,));
              }
              else
              {
                 return ListView.builder(
                  itemCount: UserList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            AddRow(title: 'id', value: snapshot.data![index].id.toString(),),
                            AddRow(title: 'Name', value: snapshot.data![index].name.toString(),),
                            AddRow(title: 'email', value: snapshot.data![index].email.toString(),),
                            AddRow(title: 'city', value: snapshot.data![index].address!.city.toString(),),
                            AddRow(title: 'latitudes', value: snapshot.data![index].address!.geo!.lat.toString(),),
                          ],
                        ),
                      ),
                    );
                  }));
              }
            })),
          )
        ],
      ),
    );
  }
}

class AddRow extends StatelessWidget {
   AddRow({super.key,required this.title,required this.value});

  final String title,value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(title,style: TextStyle(fontSize: 15,color: Colors.black),),
                Text(value,style: TextStyle(fontSize: 15,color: Colors.black),),
             ],
      ),
    );
  }
}

//UserModel

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}
