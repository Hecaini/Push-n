
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../main.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route = '/notification-screen';


  @override
  Widget build(BuildContext context) {
    final RemoteMessage message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    // Access the custom data 'username' and 'address'
    final String userID = message.data['user_id'] ?? '';
    final String username = message.data['username'] ?? '';
    final String address = message.data['address'] ?? '';
    final String token = message.data['tokens'] ?? '';
    return Scaffold(
      appBar: AppBar(title: const Text('Screen Notification'),
      ),
      body: Center(
        child: Column(
          children: [
         Text('\nUsername:  $userID'),
            Text('\nAddress:   $username'),
            Text('\nAddress:   $address'),
            Text('\nToken:   $token'),
            //Text('MESSAGE:   ${message.data}'),
          ],
        ),
      ),
    );
  }
}
