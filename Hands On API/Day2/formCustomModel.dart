//HomePage

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Photos>Photoslist = [];

  Future<List<Photos>>getPhotos()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
        for(Map i in data)
        {
            Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
            Photoslist.add(photos);
        }
        return Photoslist;
    }
    else{
        return Photoslist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("API")),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getPhotos(),
            builder: ((context,snapshot) {
            return Expanded(
              child: ListView.builder(
                itemCount: Photoslist.length,
                itemBuilder: ((context, index) {
                if(!snapshot.hasData)
                {
                  return Center(child: CircularProgressIndicator());
                }
                else
                {
                   return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data![index].url.toString())),
                    title: Text("Id :"+snapshot.data![index].id.toString()),
                    subtitle: Text("desc :"+snapshot.data![index].title.toString()),
                  ),
                );
                }
              })),
            );
          }))
        ],
      ),
    );
  }
}

class Photos {
  String title;
  String url;
  int id;
  Photos({
    required this.title,
    required this.url,
    required this.id,
  });
}
