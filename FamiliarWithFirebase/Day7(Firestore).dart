//AddFirestoreDataScreen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/CommonWidget/Button.dart';
import 'package:flutter_application_1/utils/ToastMessage.dart';



class FireStoredataScreen extends StatefulWidget {
  const FireStoredataScreen({super.key});

  @override
  State<FireStoredataScreen> createState() => _FireStoredataScreenState();
}

class _FireStoredataScreenState extends State<FireStoredataScreen> {
  
  bool loading = false;
  final _datacontroller = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('user');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text("Add Firebase data"))
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40,),
      


            TextFormField(
              controller: _datacontroller,
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
                
                final String id = DateTime.now().millisecondsSinceEpoch.toString();
                fireStore.doc(id).set({
                  'title': _datacontroller.text.toString(),
                  'id': id,
                }).then((value) {
                  setState(() {
                    loading = false;
                  });
                    AddSuccess().toastmessage('added');
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                   displayerror().toastmessage(error.toString());
                });
              })
          ],
        ),
      ),
    );
  }
}




//FirestoreListScreen

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirebaseScreen/AddFirebaseData.dart';
import 'package:flutter_application_1/LoginPages/LoginPage.dart';

class FireStoreListScreen extends StatefulWidget {
  const FireStoreListScreen({super.key});

  @override
  State<FireStoreListScreen> createState() => _FireStoreListScreenState();
}

class _FireStoreListScreenState extends State<FireStoreListScreen> {

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('user');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,child: const Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const FireStoredataScreen()));
      },),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text("FireStore list"),
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
          
          StreamBuilder(
            stream: firestore.snapshots(),
            builder: ((context,AsyncSnapshot<QuerySnapshot> snapshot){

              if(snapshot.connectionState == ConnectionState.waiting)
              {
                 return Center(child: CircularProgressIndicator(color: Colors.black,));
              }
              
              else if(snapshot.hasError)
              {
                  return Center(child: Text("error occured"),);
              }

              else{
                 return Expanded(
                   child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.docs[index]['title'].toString()),
                        subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
                      );
                    }),
                 );
              }

            }))
          
        ],
      ),
    );
  }
}
