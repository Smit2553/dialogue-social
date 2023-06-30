import 'package:flutter/material.dart';
import 'package:dialogue_social/components/social_media_post.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SocialMediaPost(
        username: 'Emily Thompson',
        title: 'Book Recommendation',
        description:
            'I just finished reading an incredible book. You won\'t be able to put it down!',
        imageUrl: 'https://picsum.photos/200/300',
      ),
      SocialMediaPost(
        username: 'Michael Johnson',
        title: 'Fitness Journey Update',
        description:
            'I\'ve been working hard on my fitness goals and making great progress. Here are some tips and tricks that have helped me along the way!',
        imageUrl: 'https://picsum.photos/1920/1080',
        isVerified: true,
      ),
      SocialMediaPost(
        username: 'Jessica Davis',
        title: 'Exciting Announcement',
      ),
    ]));
  }
}
