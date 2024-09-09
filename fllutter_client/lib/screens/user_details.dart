import 'package:fllutter_client/models/user_model.dart';
import 'package:fllutter_client/screens/edit_user.dart';
import 'package:fllutter_client/services/user_service.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
            ),
            SizedBox(height: 8),
            Text('Email: ${user.email}'),
            SizedBox(height: 8),
            Text('Age: ${user.age}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUserScreen(user: user),
                  ),
                );
              },
              child: Text('Edit User'),
            ),
            ElevatedButton(
              onPressed: () async {
                await UserService().deleteUser(user.id);
                Navigator.pop(context); // Return to the previous screen
              },
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
