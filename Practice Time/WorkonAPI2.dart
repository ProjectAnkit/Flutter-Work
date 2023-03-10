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

  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  var data = jsonDecode(response.body.toString());

  if(response.statusCode == 200)
  {
        for(Map i in data)
        {
           NewModel newmodel = NewModel(id: i['id'],url : i['url'],title: i['title']); 
           NewList.add(newmodel);
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
              builder: ((context,AsyncSnapshot<List<NewModel>> snapshot) {
              if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount: NewList.length,
                  itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(NewList[index].url.toString())),
                    title: Text(NewList[index].id.toString()),
                    subtitle: Text(NewList[index].title.toString()),
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

class NewModel {
 int id;
 String title;
 String url;
  NewModel({
    required this.id,
    required this.title,
    required this.url,
  });
 
}
