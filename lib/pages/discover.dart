import 'package:flutter/material.dart';
import 'package:dialogue_social/pages/sub_pages/recommended.dart';
import 'package:dialogue_social/pages/sub_pages/trending.dart';
import 'package:dialogue_social/pages/sub_pages/news.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
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
          RecommendedPage(), // Content for Recommended tab
          TrendingPage(), // Content for Trending tab
          NewsPage(), // Content for News tab
        ],
      ),
    );
  }
}
