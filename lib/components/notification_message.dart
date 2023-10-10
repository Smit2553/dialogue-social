import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class NotificationComponent extends StatelessWidget {
  final String communityName;
  final String userName;
  final String description;
  final bool? isVerified;
  final bool? isRead;

  const NotificationComponent({
    Key? key,
    required this.communityName,
    required this.userName,
    required this.description,
    this.isVerified = false,
    this.isRead = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_picture.png'),
            ),
            title: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (isVerified == true)
                    const TextSpan(
                      text: ' ',
                      children: [
                        WidgetSpan(
                          child: badges.Badge(
                            badgeAnimation: badges.BadgeAnimation.scale(
                              toAnimate: false,
                            ),
                            badgeContent: Icon(
                              Icons.check,
                              size: 10.0,
                              color: Colors.white,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              badgeColor: Colors.green,
                              shape: badges.BadgeShape.instagram,
                            ),
                          ),
                        ),
                      ],
                    ),
                  TextSpan(text: ' $description '),
                  TextSpan(
                    text: communityName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
