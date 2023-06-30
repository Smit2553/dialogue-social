import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class UserProfileCard extends StatefulWidget {
  final String username;
  final String profilePicture;
  final int followersCount;
  final int followingCount;
  final bool isYourProfile;
  final bool? isVerified;

  UserProfileCard({
    required this.username,
    required this.profilePicture,
    required this.followersCount,
    required this.followingCount,
    required this.isYourProfile,
    this.isVerified = false,
  });

  @override
  _UserProfileCardState createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(widget.profilePicture),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.username,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.isVerified == true) ...[
                  const SizedBox(width: 8.0),
                  badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      toAnimate: false,
                    ),
                    badgeContent: const Icon(Icons.check,
                        size: 10.0, color: Colors.black),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.green.shade100,
                      shape: badges.BadgeShape.instagram,
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Followers: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  widget.followersCount.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16.0),
                const Text(
                  'Following: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  widget.followingCount.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // show elevated button only if it's not your profile
            if (!widget.isYourProfile)
              ElevatedButton(
                onPressed: toggleFollow,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isFollowing ? Colors.grey : Colors.green.shade100,
                  foregroundColor: isFollowing ? Colors.white : Colors.black,
                ),
                child: Text(
                  isFollowing ? 'Currently Following' : 'Follow',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
