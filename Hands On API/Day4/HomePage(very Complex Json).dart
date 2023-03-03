import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'NewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<NewModel>getData()async{
    final response = await http.get(Uri.parse('https://webhook.site/f2bdfdbb-4030-4575-bb68-2bd9f909a5d5'));
    var Data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
        return NewModel.fromJson(Data);
    }
    else
    {
       return NewModel.fromJson(Data);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<NewModel>(
              future: getData(),
              builder: (context, snapshot) {
                if(!snapshot.hasData)
                {
                   return Center(child: CircularProgressIndicator(color: Colors.black,),);
                }
                else
                {
                  return ListView.builder(
                  itemCount: snapshot.data!.data![0].products!.length,
                  itemBuilder:((context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image(image: NetworkImage(snapshot.data!.data![0].image.toString())),),
                          title: Text(snapshot.data!.data![0].name.toString()),
                          subtitle: Text(snapshot.data!.data![0].description.toString()),
                          trailing: Icon(Icons.favorite_outline),
                        ),
                        Divider(thickness: 1),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height *.3,
                            width: MediaQuery.of(context).size.width *1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.data![0].products![index].images!.length,
                              itemBuilder: ((context, position) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *.25,
                                  width: MediaQuery.of(context).size.width *1,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(snapshot.data!.data![0].products![index].images![position].url.toString()))),
                                ),
                              );
                            })),
                          ),
                        ),
                        Divider(thickness: 1,),
                      ],
                    );
                  }));
                }
              },
            ))
        ],
      ),
    );
  }
}

