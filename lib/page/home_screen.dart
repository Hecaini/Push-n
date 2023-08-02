


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const route = '/';


  Future<void> sendPushNotifications() async {
    final url = 'https://enye.com.ph/enyecontrols_app/login_user/send1.php'; // Replace this with the URL to your PHP script
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      print('Push notifications sent successfully!');
    } else {
      print('Failed to send push notifications.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: sendPushNotifications,

          child: Text('Send Push Notifications'),
        ),
      ),
    );
  }
}

