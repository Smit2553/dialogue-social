import 'package:flutter/material.dart';
import 'package:dialogue_social/components/post.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SocialMediaPost(
          username: 'John Doe',
          title: 'This is a title',
          description: 'This is a body',
          imageUrl: 'https://picsum.photos/200/300'),
      SocialMediaPost(
          username: 'John Doe',
          title: 'This is a title',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          imageUrl: 'https://picsum.photos/1920/1080'),
      SocialMediaPost(
        username: 'John Doe',
        title: 'This is a title',
      )
    ]));
  }
}
