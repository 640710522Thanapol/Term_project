import 'dart:convert';
import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/users.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> users = jsonDecode(snapshot.data.toString());
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Username: ${users[index]['username']}'),
                  subtitle: Text('Password: ${users[index]['password']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
