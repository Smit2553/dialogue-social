import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class SocialMediaPost extends StatefulWidget {
  final String username;
  final String title;
  final String? description;
  final String? imageUrl;
  final bool? isVerified;

  SocialMediaPost({
    super.key,
    required this.username,
    required this.title,
    this.description,
    this.imageUrl,
    this.isVerified = false,
  });

  @override
  _SocialMediaPostState createState() => _SocialMediaPostState();
}

class _SocialMediaPostState extends State<SocialMediaPost>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    if (isLiked) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }

  String truncateDescription(String description) {
    if (description.length > 300) {
      return '${description.substring(0, 300)}...';
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                // Replace with profile picture URL
                backgroundImage:
                    const AssetImage('assets/images/profile_picture.png'),
                backgroundColor: Colors.green.shade200,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              // Add a badge if the user is verified
              if (widget.isVerified!) ...[
                const SizedBox(width: 8.0),
                badges.Badge(
                  badgeContent:
                      const Icon(Icons.check, size: 10.0, color: Colors.black),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.green.shade100,
                    shape: badges.BadgeShape.instagram,
                  ),
                ),
              ],
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          if (widget.description != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                truncateDescription(widget.description!),
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
          if (widget.imageUrl != null) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          Row(
            children: [
              IconButton(
                onPressed: () {
                  toggleLike();
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : null,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {
                  // Comment button action
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Share button action
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
