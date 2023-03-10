//HomePage

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'NewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<NewModel>NewList = [];

Future<List<NewModel>>getmodel()async{

  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data = jsonDecode(response.body.toString());

  if(response.statusCode == 200)
  {
     for(Map<String, dynamic> i in data)
     {
        NewList.add(NewModel.fromJson(i));
     }
     return NewList;
  }
  else{
     return NewList;
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getmodel(),
              builder: ((context, snapshot) {
              if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount: NewList.length,
                  itemBuilder: ((context, index) {
                  return Dialog(
                    child: Column(
                      children: [
                        Text("id : "+ NewList[index].id.toString()),
                        Text("Userid : "+ NewList[index].userId.toString()),
                        Text("title : "+ NewList[index].title.toString()),
                        Text("body : "+ NewList[index].body.toString()),
                      ],
                    ),
                  );
                }));
              }
              else{
                return Center(child: CircularProgressIndicator(color: Colors.black,));
              }
            })),
          )
        ],
      ),
    );
  }
}



//NewModel

class NewModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  NewModel({this.userId, this.id, this.title, this.body});

  NewModel.fromJson(Map<String, dynamic> json) {
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
