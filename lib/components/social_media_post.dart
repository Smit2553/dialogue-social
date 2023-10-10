import 'package:flutter/material.dart';
import 'package:dialogue_social/components/verified_badge.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dialogue_social/pages/sub_pages/post_page.dart';

class SocialMediaPost extends StatefulWidget {
  final String username;
  final String title;
  final String? description;
  final String? imageUrl;
  final bool? isVerified;
  final List<String>? tags;

  const SocialMediaPost({
    super.key,
    required this.username,
    required this.title,
    this.description,
    this.imageUrl,
    this.isVerified = false,
    this.tags,
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

  List<Widget> buildTags() {
    return widget.tags!
        .map(
          (tag) => Chip(
            label: Text(
              '#$tag',
              style: const TextStyle(
                color: Colors.black, // Change the color of the tag
                fontWeight:
                    FontWeight.bold, // Change the font weight of the tag
              ),
            ),
            backgroundColor:
                Colors.green.shade100, // Change the background color of the tag
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) => PostPage(
              title: widget.title,
              description: widget.description,
              username: widget.username,
              imageUrl: widget.imageUrl,
              tags: widget.tags,
              isVerified: widget.isVerified,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.easeInOutCubic;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                // Add a badge if the user is verified
                if (widget.isVerified!)
                  ...buildVerifiedBadge(widget.isVerified!)
              ],
            ),
            // only display tags if there are any
            if (widget.tags != null) ...[
              Wrap(
                spacing: 4.0,
                children: buildTags(),
              ),
            ],
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
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    Share.share(widget.title);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
