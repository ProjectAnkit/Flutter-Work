//HomePage

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var data;
  Future<void>getUserData()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200)
    {
       data = jsonDecode(response.body.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserData(),
              builder: ((context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                 return Center(child: CircularProgressIndicator(color: Colors.black,),);
              }else{
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                            AddRow(title: 'name', value: data[index]['name']),
                            AddRow(title: 'username', value: data[index]['username']),
                            AddRow(title: 'email', value: data[index]['email']),
                            AddRow(title: 'latitude', value: data[index]['address']['geo']['lat']),
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
  const AddRow({super.key, required this.title, required this.value});

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
