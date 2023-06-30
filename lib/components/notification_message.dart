import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class NotificationComponent extends StatelessWidget {
  final String communityName;
  final String userName;
  final String description;
  final bool? isVerified;

  const NotificationComponent({
    Key? key,
    required this.communityName,
    required this.userName,
    required this.description,
    this.isVerified = false,
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
                    TextSpan(
                      text: ' ',
                      children: [
                        WidgetSpan(
                          child: badges.Badge(
                            badgeAnimation: const badges.BadgeAnimation.scale(
                              toAnimate: false,
                            ),
                            badgeContent: const Icon(
                              Icons.check,
                              size: 10.0,
                              color: Colors.black,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              badgeColor: Colors.green.shade100,
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
