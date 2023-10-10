import 'package:flutter/material.dart';
import 'package:dialogue_social/components/verified_badge.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dialogue_social/components/comment_section.dart';

class PostPage extends StatefulWidget {
  final String username;
  final String title;
  final String? description;
  final String? imageUrl;
  final bool? isVerified;
  final List<String>? tags;

  const PostPage({
    super.key,
    required this.username,
    required this.title,
    this.description,
    this.imageUrl,
    this.isVerified = false,
    this.tags,
  });

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage>
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

  List<Comment> comments = [
    Comment(
      id: '1',
      content: 'First comment',
      replies: [
        Comment(
            id: '1.1',
            content: 'Reply to first comment',
            replies: [],
            username: 'John Doe'),
        Comment(
            id: '1.2',
            content: 'Another reply to first comment',
            replies: [],
            username: 'Jane Smith'),
      ],
      username: 'Alice',
    ),
    Comment(
      id: '2',
      content: 'Second comment',
      replies: [
        Comment(
            id: '2.1',
            content: 'Reply to second comment',
            replies: [],
            username: 'Bob'),
      ],
      username: 'Charlie',
    ),
    Comment(
      id: '3',
      content: 'Third comment',
      replies: [],
      username: 'Eve',
    ),
    Comment(
      id: '4',
      content: 'Fourth comment',
      replies: [],
      username: 'Ava',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                'Check out this post by ${widget.username} on Dialogue Social: ${widget.title}',
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
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
                  ],
                ),
              ],
            ),
          ),
          CommentSection(comments: comments),
        ],
      ),
    );
  }
}
