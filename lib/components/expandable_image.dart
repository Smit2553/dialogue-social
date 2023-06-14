import 'package:flutter/material.dart';

class ExpandableImageWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  ExpandableImageWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  _ExpandableImageWidgetState createState() => _ExpandableImageWidgetState();
}

class _ExpandableImageWidgetState extends State<ExpandableImageWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        width: double.infinity,
        height: _isExpanded ? maxHeight : 200.0,
        child: Stack(
          children: [
            Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.green.shade200.withOpacity(0.5),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
