import 'package:flutter/material.dart';
import 'package:dialogue_social/components/expandable_image.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform search action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            SubCategoryWidget(
              title: 'Recommended for You',
              items: [
                ExpandableImageWidget(
                  imageUrl:
                      'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg',
                  title: 'Example Image',
                  description: 'Short description of the image.',
                ),
                ExpandableImageWidget(
                  imageUrl:
                      'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg',
                  title: 'Example Image',
                  description: 'Short description of the image.',
                ),
                ExpandableImageWidget(
                  imageUrl:
                      'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg',
                  title: 'Example Image',
                  description: 'Short description of the image.',
                ),
              ],
            ),
            SizedBox(height: 10.0),
            SubCategoryWidget(
              title: 'Trending',
              items: [
                Container(color: Colors.red, height: 50.0),
                Container(color: Colors.blue, height: 50.0),
                Container(color: Colors.green, height: 50.0),
              ],
            ),
            SizedBox(height: 10.0),
            const SubCategoryWidget(
              title: 'Local News',
              items: [
                // Image.asset('assets/news1.png'),
                // Image.asset('assets/news2.png'),
                // Image.asset('assets/news3.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategoryWidget extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const SubCategoryWidget({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: items[index],
              onTap: () {
                // Handle item tap
              },
            );
          },
        ),
      ],
    );
  }
}
