import 'package:flutter/material.dart';
import 'package:dialogue_social/components/user_profile_card.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserProfileCard(
            username: 'John Doe',
            profilePicture: 'assets/images/profile_picture.png',
            followersCount: 100,
            followingCount: 50,
            isYourProfile: true,
            isVerified: true,
          ),
        ],
      ),
    );
  }
}
