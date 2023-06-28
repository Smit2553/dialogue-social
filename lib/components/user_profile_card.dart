import 'package:flutter/material.dart';

class UserProfileCard extends StatefulWidget {
  final String username;
  final String profilePicture;
  final int followersCount;
  final int followingCount;
  final bool isYourProfile;

  UserProfileCard({
    required this.username,
    required this.profilePicture,
    required this.followersCount,
    required this.followingCount,
    required this.isYourProfile,
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
            SizedBox(height: 16.0),
            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Followers: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  widget.followersCount.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Following: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  widget.followingCount.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
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
