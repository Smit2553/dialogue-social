import 'package:flutter/material.dart';

class Comment {
  final String id;
  final String content;
  final List<Comment>? replies;
  final String username;

  Comment({
    required this.id,
    required this.content,
    this.replies,
    required this.username,
  });
}

class CommentSection extends StatelessWidget {
  final List<Comment> comments;

  CommentSection({required this.comments});

  Widget _buildComment(Comment comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(comment.username[0]),
          ),
          title: Text(
            comment.username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(comment.content),
          trailing: IconButton(
            icon: Icon(Icons.reply),
            onPressed: () {
              // Handle reply button click
              // You can implement the desired functionality here
            },
          ),
        ),
        if (comment.replies != null) // Add null check
          Padding(
            padding: EdgeInsets.only(left: 72),
            child: Column(
              children: comment.replies!
                  .map((reply) => _buildComment(reply))
                  .toList(),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return _buildComment(comments[index]);
      },
    );
  }
}
