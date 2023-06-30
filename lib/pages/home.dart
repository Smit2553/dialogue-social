import 'package:flutter/material.dart';
import 'package:dialogue_social/components/social_media_post.dart';

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
        imageUrl: 'https://picsum.photos/200/300',
      ),
      SocialMediaPost(
        username: 'John Doe',
        title: 'This is a title',
        description: 'This is text',
        imageUrl: 'https://picsum.photos/1920/1080',
        isVerified: true,
      ),
      SocialMediaPost(
        username: 'John Doe',
        title: 'This is a title',
      )
    ]));
  }
}
