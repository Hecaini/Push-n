import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_n/page/home_screen.dart';
import 'package:push_n/page/notification_screen.dart';

import 'api/firebase_api.dart';


final navigatorKey = GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  await FirebaseApi().initPushNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
        routes: {
        '/': (context) => HomeScreen(),
        '/notification-screen': (context) => NotificationScreen(),
        // Add other named routes here...
        },

    );
  }
}