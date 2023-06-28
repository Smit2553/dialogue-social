import 'package:flutter/material.dart';

class NotificationComponent extends StatelessWidget {
  final String communityName;
  final String userName;
  final String description;

  const NotificationComponent({
    Key? key,
    required this.communityName,
    required this.userName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_picture.png'),
          ),
          title: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ' + description + ' '),
                TextSpan(
                  text: communityName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
