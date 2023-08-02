import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  static const route = '/user-screen';

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsersData();
  }

  Future<void> fetchUsersData() async {
    final url = 'https://enye.com.ph/enyecontrols_app/login_user/send1.php'; // Replace this with your actual API endpoint URL
    final response = await http.get(Uri.parse(url));
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        users = List.from(jsonData).map((userJson) => User.fromJson(userJson)).toList();
      });
    } else {
      print('Failed to fetch data from the server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Screen'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.username),
            subtitle: Text(user.address),
          );
        },
      ),
    );
  }
}





class User {
  final int id;
  final String username;
  final String address;

  User({required this.id, required this.username, required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      address: json['address'],
    );
  }
}
