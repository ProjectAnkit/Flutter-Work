//AddPostScreen

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';
import 'package:firebase_database/firebase_database.dart';



class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  
  bool loading = false;
  final _postcontroller = TextEditingController();
  final database = FirebaseDatabase.instance.ref('posts');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _postcontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text("Add post"))
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40,),
      
            TextFormField(
              controller: _postcontroller,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),hintText: "please add your thought of day"),
            ),
            

            const SizedBox(
              height: 10,
            ),


            CommonButton(
              loading: loading, 
              Buttontext: "Add", 
              ontap: (){
                 
                 setState(() {
                   loading = true;
                 });

                database.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                  'id' : DateTime.now().millisecondsSinceEpoch.toString(),
                  'thought' : _postcontroller.text.toString(),
                }).then((value) {  
                  AddSuccess().toastmessage();
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  displayerror().toastmessage(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              })
          ],
        ),
      ),
    );
  }
}



//Postscreen

import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,child: Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPost()));
      },),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){
            auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
