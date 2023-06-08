import 'package:flutter/material.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('User Notification Page', style: TextStyle(fontSize: 35))),
    );
  }
}