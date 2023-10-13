//HomeScreen

import 'package:flutter/material.dart';
import 'package:notesapp/FavouriteScreen.dart';
import 'package:notesapp/ProviderClass.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountMethod()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue
          )
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal
          )
        ),
        debugShowCheckedModeBanner: false, 
        home: const FavouriteScreen()),
    );
  }
}




//CountScreen

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notesapp/ProviderClass.dart';
import 'package:notesapp/SliderPage.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeMethod>(context);
    final countProvider = Provider.of<CountMethod>(context,listen: false);
    log("build");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=> SliderPage()));

          }, icon: Icon(Icons.forward,color: Colors.white,))
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Consumer<CountMethod>(
              builder: (context, value, child) {
                log("Only Text widget");
                return Text(value.ccount.toString(),style: TextStyle(fontSize: 50),);
              },
            ),
          ],
        )
        ),
      

      floatingActionButton: FloatingActionButton(onPressed: (){
        countProvider.increment();
      },child: Icon(Icons.add)),
    );
  }
}





//Provider Class

import 'package:flutter/material.dart';

class CountMethod with ChangeNotifier{

  int count = 0;
  int get ccount => count;

  void increment(){
    count++;
    notifyListeners();
  }
}



