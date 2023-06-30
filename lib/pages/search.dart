import 'package:flutter/material.dart';
import 'package:dialogue_social/components/social_media_post.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Recommended',
                ),
                Tab(text: 'Trending'),
                Tab(text: 'News'),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.black,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Recommended tab content
          SocialMediaPost(
              username: 'John Doe',
              title: 'This is a title',
              description: 'This is a body',
              imageUrl: 'https://picsum.photos/200/300'),

          // Trending tab content
          Center(child: Text('Trending')),

          // News tab content
          Center(child: Text('News')),
        ],
      ),
    );
  }
}
