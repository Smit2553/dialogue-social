import 'package:flutter/material.dart';
import 'package:dialogue_social/components/create_user_post.dart';

class UserPost extends StatelessWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateUserPost(),
    );
  }
}
