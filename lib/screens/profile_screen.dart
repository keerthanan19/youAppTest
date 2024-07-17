// Suggested code may be subject to a license. Learn more: ~LicenseLog:3931195744.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3412443357.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:893229608.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1588525377.
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
 static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            ),
            SizedBox(height: 20.0),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('john.doe@example.com'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
