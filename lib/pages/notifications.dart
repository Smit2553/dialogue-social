import 'package:flutter/material.dart';
import 'package:dialogue_social/components/notification_message.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.green.shade100,
        ),
        body: ListView(
          children: const [
            NotificationComponent(
              communityName: 'Tech Enthusiasts',
              userName: 'Sarah Smith',
              description: 'liked your post in',
              isVerified: true,
            ),
            NotificationComponent(
              communityName: 'Food Lovers',
              userName: 'Jane Anderson',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Fitness Fanatics',
              userName: 'Mike Johnson',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Bookworms',
              userName: 'Emily Thompson',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Travel Explorers',
              userName: 'Michael Johnson',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Photography Enthusiasts',
              userName: 'Jessica Davis',
              description: 'liked your post in',
            ),
          ],
        ));
  }
}
