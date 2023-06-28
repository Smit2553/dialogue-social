import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final String profilePicture;
  final String username;
  final String timestamp;
  final List<Message> messages;

  ChatBox({
    required this.profilePicture,
    required this.username,
    required this.timestamp,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 100),
              pageBuilder: (context, animation, secondaryAnimation) => ChatPage(
                profilePicture: profilePicture,
                username: username,
                messages: messages,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves
                        .easeInOutCubic, // Add a curve for smoother animation
                  )),
                  child: child,
                );
              },
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profilePicture),
        ),
        title: Text(
          username,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(messages.last.text),
        trailing: Text(
          timestamp,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String profilePicture;
  final String username;
  final List<Message> messages;

  ChatPage({
    required this.profilePicture,
    required this.username,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profilePicture),
            ),
            SizedBox(width: 8.0),
            Text(username),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessage(message.text,
                    isMe: message.isMe, timestamp: message.timestamp);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send button pressed
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String text,
      {required bool isMe, required String timestamp}) {
    final bgColor = isMe ? Colors.green[100] : Colors.grey[200];
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 4.0),
                Text(
                  timestamp,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  final String timestamp;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}
