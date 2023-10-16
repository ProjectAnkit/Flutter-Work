//HomeScreen

import 'package:flutter/material.dart';
import 'package:hostify/Functions.dart';
import 'package:hostify/UserScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> UserMethod())
        ],
        child: MaterialApp(
          home: UserScreen(),
        ));
  }
}




//Api services

import 'dart:convert';
import 'package:hostify/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  static String baseurl = "https://88a7-43-230-199-50.ngrok.io/users";

  static Future<void> add(UserModel user)async{
     Uri uri = Uri.parse(baseurl+"/add");
     await http.post(uri,body: user.toMap());
  }

  static Future<void> delete(UserModel user)async{
     Uri uri = Uri.parse(baseurl+"/delete");
     await http.post(uri,body: user.toMap());
  }

    static Future<List<UserModel>> getlist(String mailid)async{
     Uri uri = Uri.parse(baseurl+"/list");
     var response = await http.get(uri);
     var decoded = jsonDecode(response.body);
     
     List<UserModel> users = [];

     for(var usermap in decoded){
       UserModel user = UserModel().fromMap(usermap);
       users.add(user);
     }

     return users;
  }
}





//Functions

import 'package:flutter/material.dart';
import 'package:hostify/ApiServices.dart';
import 'package:hostify/UserModel.dart';

class UserMethod with ChangeNotifier{

  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  UserMethod(){
    fetchusers();
  }

  void addtoList(UserModel user){
      users.add(user);
      notifyListeners();
      ApiServices.add(user);
  }


  void delete(UserModel user){
    int indexofelement = users.indexOf(users.firstWhere((element) => element.email==user.email));
    users.removeAt(indexofelement);
    notifyListeners();
    ApiServices.delete(user);
  }

  void fetchusers()async{
     _users = await ApiServices.getlist("sunaina@gmail.com");
    notifyListeners();
  }
}




//USerscreen

import 'package:flutter/material.dart';
import 'package:hostify/Functions.dart';
import 'package:hostify/UserModel.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _mailcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserMethod>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(
          context: context, 
          builder: (context){
            return AlertDialog(
              title: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _mailcontroller,
                      decoration: InputDecoration(
                        hintText: "enter emailid"
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        hintText: "enter name"
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration( 
                        hintText: "enter age"
                      ),
                    ),
                  ),
                ],
              ),

              actions: [

               TextButton(onPressed: (){
                       
                  userprovider.addtoList(UserModel(name: _namecontroller.text, age: _agecontroller.text, email: _mailcontroller.text));
                  Navigator.pop(context);
                  _namecontroller.clear();
                  _agecontroller.clear();
                  _mailcontroller.clear();

                }, child: Text("add")),
                

                TextButton(onPressed: (){

                  Navigator.pop(context);

                }, child: Text("cancel"))
              ],
            );
          });

      },
      child: Icon(Icons.add),backgroundColor: Colors.teal,),

      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userprovider.users.length,
              itemBuilder: (context,index){
                return InkWell(
                  onLongPress: () {
                    userprovider.delete(userprovider.users[index]);
                  },
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),),
                    child: Row(
                      children: [
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(userprovider.users[index].name.toString(),style: TextStyle(fontSize: 18),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(userprovider.users[index].age.toString(),style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                            ),
                             Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(userprovider.users[index].email.toString(),style: TextStyle(fontSize: 14),),
                            ),
                
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                );
              })),
        ],
      )
    );
  }
}

