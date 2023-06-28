import 'package:flutter/material.dart';
import 'package:dialogue_social/components/chat_user.dart';

class UserChat extends StatelessWidget {
  UserChat({Key? key}) : super(key: key);
  List<Message> messages = [
    Message(
      text: 'Hi',
      isMe: true,
      timestamp: '10:00 AM',
    ),
    Message(
      text: 'Hey, how are you?',
      isMe: false,
      timestamp: '10:05 AM',
    ),
    Message(
      text: 'I\'m good, thanks!',
      isMe: true,
      timestamp: '10:10 AM',
    ),
    Message(
      text: 'That\'s great to hear!',
      isMe: false,
      timestamp: '10:15 AM',
    ),
    Message(
      text: 'By the way, did you see the latest update?',
      isMe: false,
      timestamp: '10:20 AM',
    ),
    Message(
      text: 'Yes, it looks amazing!',
      isMe: true,
      timestamp: '10:25 AM',
    ),
    Message(
      text: 'Test',
      isMe: true,
      timestamp: '10:25 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Chat')),
        body: ListView(
          children: [
            ChatBox(
              profilePicture:
                  'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
              username: 'John Doe',
              timestamp: '10:30 AM',
              messages: messages,
            ),
            ChatBox(
              profilePicture:
                  'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
              username: 'John Doe',
              timestamp: '10:30 AM',
              messages: messages,
            ),
            ChatBox(
              profilePicture:
                  'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
              username: 'John Doe',
              timestamp: '10:30 AM',
              messages: messages,
            ),
            ChatBox(
              profilePicture:
                  'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
              username: 'John Doe',
              timestamp: '10:30 AM',
              messages: messages,
            ),
          ],
        ));
  }
}
