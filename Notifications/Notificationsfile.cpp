import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationServices{

FirebaseMessaging messaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


 Future<void>initlocalNotification(BuildContext context,RemoteMessage message)async{
   var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
   var iosinitializationSettings = const DarwinInitializationSettings();

   var initilizationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosinitializationSettings,
   );

   await _flutterLocalNotificationsPlugin.initialize(
    initilizationSettings,
    onDidReceiveNotificationResponse: (payload){

    });
 }

 Future<void>showNotification(RemoteMessage message)async{
    
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(), 
      "High importance notifications",
      importance: Importance.max
      );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id, 
      channel.name,
      importance: Importance.high,
      channelDescription: "connecto channel",
      priority: Priority.high,
      ticker: 'ticker',
      );

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(const Duration(seconds: 0),(){
      _flutterLocalNotificationsPlugin.show(
        0, 
        message.notification!.title.toString(), 
        message.notification!.body.toString(), 
        notificationDetails
        );
    });
 }

 void initFirebase(BuildContext context){
    FirebaseMessaging.onMessage.listen((message) {

      if (kDebugMode) {
        print(message.notification!.title.toString());
      }
      if (kDebugMode) {
        print(message.notification!.body.toString());
      }

       if (Platform.isAndroid) {
        initlocalNotification(context, message);
        showNotification(message);
      }
     });
  }

 Future<void>reqpushnotifications()async{

  final FCMtoken = await messaging.getToken();
  print(FCMtoken);

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  ); 


  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  if(settings.authorizationStatus == AuthorizationStatus.authorized){
  }
  else if(settings.authorizationStatus == AuthorizationStatus.provisional){
  }
  else{
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }
}
}

