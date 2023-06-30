import 'package:flutter/material.dart';
import 'package:dialogue_social/components/social_media_post.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SocialMediaPost(
          username: 'Sarah Smith',
          title: 'Amazing Vacation Spot',
          description: 'Check out this beautiful beach destination!',
          imageUrl: 'https://picsum.photos/200/300',
        ),
        SocialMediaPost(
          username: 'Jane Anderson',
          title: 'New Recipe Alert!',
          description:
              'I just tried this delicious recipe and it turned out amazing. You should definitely give it a try!',
          imageUrl: 'https://picsum.photos/1920/1080',
          isVerified: true,
        ),
        SocialMediaPost(
          username: 'Mike Johnson',
          title: 'Exciting News',
        ),
      ]),
    );
  }
}
