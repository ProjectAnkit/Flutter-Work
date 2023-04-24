//PostScreen

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPages/LoginPage.dart';
import 'package:flutter_application_1/PostPages/AddPost.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,child: const Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddPost()));
      },),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){
            auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage())));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot <DatabaseEvent> snapshot){
               

                if(!snapshot.hasData)
                {
                   return const Center(child: CircularProgressIndicator(color: Colors.black,));
                }

                else{

                   Map<dynamic,dynamic>map = snapshot.data!.snapshot.value as dynamic;
                   List<dynamic>list = [];
                   list.clear();
                   list = map.values.toList();

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context,index){
                  return ListTile(
                    title: Text(list[index]['thought']),
                    subtitle: Text(list[index]['id']),
                  );
                });
                }
              })
              ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: const Center(child: CircularProgressIndicator(color: Colors.black,)),
              itemBuilder: (context,snapshot,animation,index){
                return ListTile(
                  title: Text(snapshot.child('thought').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
