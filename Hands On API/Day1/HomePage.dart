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

  List<NewModel>Data = [];

  Future<List<NewModel>>newData()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var getData = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
        for(Map<String, dynamic> i in getData)
        {
            Data.add(NewModel.fromJson(i));
        }
        return Data;
    }
    else{
       return Data;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("App",style: TextStyle(fontWeight: FontWeight.w400),),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: newData(),
            builder: ((context, snapshot) {
           if(!snapshot.hasData)
           {
              return Center(child: CircularProgressIndicator());
           }
           else{
              return Expanded(
                child: ListView.builder(
                  itemCount: Data.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Dialog(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User Id :${Data[index].userId.toString()}",style: TextStyle(fontSize: 20,color: Colors.black),),
                            Text("Id :${Data[index].id.toString()}",style: TextStyle(fontSize: 20,color: Colors.black),),
                            Text("Title :${Data[index].title.toString()}",style: TextStyle(fontSize: 20,color: Colors.black),),
                            Text("Body :${Data[index].body.toString()}",style: TextStyle(fontSize: 20,color: Colors.black),),
                          ],
                        ),
                      ),
                    );
                  })),
              );
           }
          }))
        ],
      ),
    );
  }
}
