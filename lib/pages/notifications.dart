import 'package:flutter/material.dart';
import 'package:dialogue_social/components/notification_message.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body: ListView(
          children: const [
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
            NotificationComponent(
              communityName: 'Community Name',
              userName: 'John Doe',
              description: 'liked your post in',
            ),
          ],
        ));
  }
}
