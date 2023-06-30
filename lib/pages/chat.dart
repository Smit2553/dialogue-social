import 'package:flutter/material.dart';
import 'package:dialogue_social/components/chat_components.dart';

class UserChat extends StatelessWidget {
  UserChat({Key? key}) : super(key: key);
  final List<Message> messages = [
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
  ];
  final List<Message> messages1 = [
    Message(
      text: 'Hello',
      isMe: true,
      timestamp: '9:00 AM',
    ),
    Message(
      text: 'Hey there!',
      isMe: false,
      timestamp: '9:02 AM',
    ),
    Message(
      text: 'How\'s your day going?',
      isMe: false,
      timestamp: '9:05 AM',
    ),
    Message(
      text: 'Pretty good, thanks for asking!',
      isMe: true,
      timestamp: '9:10 AM',
    ),
    Message(
      text: 'Any plans for the weekend?',
      isMe: false,
      timestamp: '9:15 AM',
    ),
    Message(
      text: 'Not yet, I\'m still deciding.',
      isMe: true,
      timestamp: '9:20 AM',
    ),
  ];
  final List<Message> messages2 = [
    Message(
      text: 'Hey',
      isMe: true,
      timestamp: '2:00 PM',
    ),
    Message(
      text: 'Hi! How can I help you?',
      isMe: false,
      timestamp: '2:02 PM',
    ),
    Message(
      text: 'I need some assistance with my account.',
      isMe: true,
      timestamp: '2:05 PM',
    ),
    Message(
      text: 'Sure, I\'ll be happy to help. What seems to be the issue?',
      isMe: false,
      timestamp: '2:10 PM',
    ),
  ];
  final List<Message> messages3 = [
    Message(
      text: 'Good morning!',
      isMe: true,
      timestamp: '8:30 AM',
    ),
    Message(
      text: 'Morning! How did you sleep?',
      isMe: false,
      timestamp: '8:35 AM',
    ),
    Message(
      text: 'I slept like a baby!',
      isMe: true,
      timestamp: '8:40 AM',
    ),
    Message(
      text: 'That\'s great to hear!',
      isMe: false,
      timestamp: '8:45 AM',
    ),
    Message(
      text: 'Did you have any plans for today?',
      isMe: false,
      timestamp: '8:50 AM',
    ),
    Message(
      text: 'Not really, just some errands to run.',
      isMe: true,
      timestamp: '8:55 AM',
    ),
    Message(
      text: 'Alright, have a productive day!',
      isMe: false,
      timestamp: '9:00 AM',
    ),
    Message(
      text: 'Thanks! You too.',
      isMe: true,
      timestamp: '9:05 AM',
    ),
    Message(
      text: 'By the way, have you watched any good movies lately?',
      isMe: false,
      timestamp: '9:10 AM',
    ),
    Message(
      text:
          'Yes, I recently saw a fantastic sci-fi movie called "Quantum Dreams." Highly recommend!',
      isMe: true,
      timestamp: '9:15 AM',
    ),
    Message(
      text: 'I\'ll definitely check it out. Thanks for the recommendation!',
      isMe: false,
      timestamp: '9:20 AM',
    ),
    Message(
      text: 'No problem! Let me know how you like it.',
      isMe: true,
      timestamp: '9:25 AM',
    ),
    Message(
      text:
          'Hey, I just finished watching "Quantum Dreams." It was mind-blowing!',
      isMe: false,
      timestamp: '9:30 AM',
    ),
    Message(
      text: 'I\'m glad you enjoyed it! It\'s one of my favorites.',
      isMe: true,
      timestamp: '9:35 AM',
    ),
    Message(
      text: 'Do you have any other movie recommendations?',
      isMe: false,
      timestamp: '9:40 AM',
    ),
    Message(
      text:
          'Absolutely! Have you seen "The Illusionist"? It\'s a captivating mystery thriller.',
      isMe: true,
      timestamp: '9:45 AM',
    ),
    Message(
      text: 'No, I haven\'t. I\'ll add it to my watchlist. Thanks!',
      isMe: false,
      timestamp: '9:50 AM',
    ),
    Message(
      text: 'You\'re welcome! I think you\'ll enjoy it.',
      isMe: true,
      timestamp: '9:55 AM',
    ),
    Message(
      text:
          'Hey, I finally watched "The Illusionist." It was amazing! Thanks for the recommendation.',
      isMe: false,
      timestamp: '10:00 AM',
    ),
    Message(
      text:
          'You\'re welcome! I\'m glad you liked it. If you need more recommendations, feel free to ask!',
      isMe: true,
      timestamp: '10:05 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ChatBox(
          profilePicture: 'https://i.imgur.com/p81Eh87.jpeg',
          username: 'John Doe',
          messages: messages,
        ),
        ChatBox(
          profilePicture: 'https://i.imgur.com/DVJcEE3.jpeg',
          username: 'Stella Thompson',
          messages: messages1,
        ),
        ChatBox(
          profilePicture: 'https://i.imgur.com/OXIgSuT.jpeg',
          username: 'Ethan Collins',
          messages: messages2,
        ),
        ChatBox(
          profilePicture: 'https://i.imgur.com/PGwkUcB.jpeg',
          username: 'Ava Rodriguez',
          messages: messages3,
          isVerified: true,
        ),
      ],
    ));
  }
}
