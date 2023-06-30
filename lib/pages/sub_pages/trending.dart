import 'package:flutter/material.dart';
import 'package:dialogue_social/components/social_media_post.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SocialMediaPost(
            username: 'Alex Carter',
            title: 'Travel Adventure',
            description:
                'I recently went on an amazing adventure and explored some breathtaking locations. Check out the photos from my trip!',
            imageUrl: 'https://picsum.photos/200/300',
          ),
          SocialMediaPost(
            username: 'Ryan Anderson',
            title: 'Delicious Dessert Recipe',
            description:
                'Indulge in this mouthwatering dessert recipe that will satisfy your sweet tooth. Trust me, it\'s worth every bite!',
            imageUrl: 'https://picsum.photos/1920/1080',
            isVerified: true,
          ),
          SocialMediaPost(
            username: 'Olivia Wilson',
            title: 'Throwback Memories',
          ),
        ],
      ),
    );
  }
}
