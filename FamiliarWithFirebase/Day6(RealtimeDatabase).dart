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
  final _searchcontroller = TextEditingController();
  final _updatecontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchcontroller.dispose();
    _updatecontroller.dispose();
  }





    Future <void> callDialog(String title, String id)async{
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Update"),
          content: Container(
            child: TextFormField(
             decoration: InputDecoration(),
            ),
          ),
          actions: [
            TextButton(onPressed: (){}, child: const Text("cancel")),
            TextButton(onPressed: (){}, child: const Text("update")),
          ],
        );
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,child: const Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddPost()));
      },),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text("Posts"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage())));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [

          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width *0.9,
              decoration:  BoxDecoration(color: const Color.fromARGB(255, 236, 236, 236),borderRadius: BorderRadius.circular(45),border: Border.all(color: Colors.black)),
              child: Center(
                child: Center(
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      controller: _searchcontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Posts",          
                      ),
                    ),
                  ),
                ),
              )),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: const Center(child: CircularProgressIndicator(color: Colors.black,)),
              itemBuilder: (context,snapshot,animation,index){

               if(_searchcontroller.text.isEmpty)
               {
                   return ListTile(
                   trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ListTile(
                          onTap: (){
                            callDialog(snapshot.child('thought').value.toString(), snapshot.child('id').value.toString());
                          },
                          leading: Icon(Icons.edit),
                          title: Text("Edit"),
                        ),
                        ),

                        PopupMenuItem(
                        child: ListTile(
                          onTap: (){
                            
                          },
                          leading: Icon(Icons.delete),
                          title: Text("Delete"),
                        ),
                        ),
                    ],
                  ),
                  title: Text(snapshot.child('thought').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
               }

               else if(snapshot.child('thought').value.toString().contains(_searchcontroller.text.toLowerCase()))
               {
                   return ListTile(
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text("Edit"),
                        onTap: (){
                          
                        },
                        )
                    ],
                  ),


                  title: Text(snapshot.child('thought').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),

                );
               }

               else{
                return Container();
               }
              },
            ),
          )
        ],
      ),
    );
  }
}
