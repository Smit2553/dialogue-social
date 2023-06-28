import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  const UserChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: Text('User Chat Page', style: TextStyle(fontSize: 35))),
    );
  }
}
