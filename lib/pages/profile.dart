import 'package:flutter/material.dart';
import 'package:dialogue_social/components/user_profile_card.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appbar'),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                // Handle menu item selection here
                if (value == 'settings') {
                  // Navigate to the settings screen or perform any desired action
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  // Add more menu items here if needed
                ];
              },
            ),
          ],
        ),
        body: UserProfileCard(
            username: 'John Doe',
            profilePicture: 'assets/images/profile_picture.png',
            followersCount: 100,
            followingCount: 50,
            isYourProfile: true));
  }
}
