import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {
  const UserPost({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('User Post Page', style: TextStyle(fontSize: 35))),
    );
  }
}