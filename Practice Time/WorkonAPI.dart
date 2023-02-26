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

  List<PostModel>Posts = [];

  Future<List<PostModel>>DataMode()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
      for(Map<String, dynamic> i in data)
      {
        Posts.add(PostModel.fromJson(i));
      }
      return Posts;
    }
    else{
       return Posts;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: DataMode(),
              builder: ((context, snapshot) {
             if(!snapshot.hasData)
             {
               return Center(child: CircularProgressIndicator());
             }
             else{
               return ListView.builder(
                itemCount: Posts.length,
                itemBuilder: ((context, index) {
                return Dialog(
                  child: Column(
                      children: [
                        Text("User Id: ${Posts[index].userId.toString()}",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("Id: ${Posts[index].id.toString()}",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("Title: ${Posts[index].title.toString()}",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("Body: ${Posts[index].body.toString()}",style: TextStyle(fontSize: 15,color: Colors.black),),
                      ],
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

//PostModel

class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
