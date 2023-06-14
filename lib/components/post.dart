import 'package:flutter/material.dart';

class SocialMediaPost extends StatefulWidget {
  final String username;
  final String title;
  final String? description;
  final String? imageUrl;

  SocialMediaPost({
    super.key,
    required this.username,
    required this.title,
    this.description,
    this.imageUrl,
  });

  @override
  _SocialMediaPostState createState() => _SocialMediaPostState();
}

class _SocialMediaPostState extends State<SocialMediaPost>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
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
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          if (widget.description != null) ...[
            Text(
              truncateDescription(widget.description!),
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
          ],
          if (widget.imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
          ],
          Row(
            children: [
              GestureDetector(
                onTap: toggleLike,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 24.0,
                      ),
                    );
                  },
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
