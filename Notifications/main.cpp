import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mychatapplication/LoadingScreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundMessagehandler);

 
 
  runApp(const Material(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    ),
  ));
}
 
 @pragma('vm:entry-point')
 Future<void>_backgroundMessagehandler(RemoteMessage message)async{
    await Firebase.initializeApp();
  }
