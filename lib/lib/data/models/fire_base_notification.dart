import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FireBaseNotification extends GetxService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    try{
    final fCMToken = await _firebaseMessaging.getToken();
    }catch(e){
      print(e.toString());
    }
    FirebaseMessaging.onBackgroundMessage(handelBackgroundMessage);
  }

  Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin)async{
    var androidInitialize =  const AndroidInitializationSettings("drawable/fasateen_logo");
    var iosInitialize =  const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android:androidInitialize,iOS: iosInitialize );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }
}

Future<void> handelBackgroundMessage(RemoteMessage message) async {
  print('title: ${message.notification?.title}');
  print('body: ${message.notification?.body}');
  print('data: ${message.data}');
}
