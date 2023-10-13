//ThemeScreen

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
            RadioListTile<ThemeMode>(
              title: Text("Light Mode"),
              value: ThemeMode.light, 
              groupValue: themeprovider.themeMode, 
              onChanged: themeprovider.settheme
              ),

              RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark, 
              groupValue: themeprovider.themeMode, 
              onChanged: themeprovider.settheme
              ),

              RadioListTile<ThemeMode>(
              title: Text("System Mode"),
              value: ThemeMode.system, 
              groupValue: themeprovider.themeMode, 
              onChanged: themeprovider.settheme
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



//HomeScreen

import 'package:flutter/material.dart';
import 'package:notesapp/Countscreen.dart';
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
        ChangeNotifierProvider(create: (_)=> ThemeMethod()),
      ],
      child: Builder(
        builder: (context){
          final themeprovider = Provider.of<ThemeMethod>(context);
          return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue
          )
        ),
        themeMode: themeprovider.themeMode,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal
          )
        ),
        debugShowCheckedModeBanner: false, 
        home: const CountScreen());
        })
    );
  }
}



//PRoviderClass

import 'package:flutter/material.dart';

class ThemeMethod with ChangeNotifier{

  var _thememode = ThemeMode.light;
  ThemeMode get themeMode => _thememode;

  void settheme(themeMode){
     _thememode = themeMode;
     notifyListeners();
  }
}

