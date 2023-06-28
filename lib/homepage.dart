import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dialogue_social/pages/home.dart';
import 'package:dialogue_social/pages/search.dart';
import 'package:dialogue_social/pages/post.dart';
import 'package:dialogue_social/pages/notifications.dart';
import 'package:dialogue_social/pages/profile.dart';
import 'package:dialogue_social/pages/chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    SearchPage(),
    const UserPost(),
    const UserNotifications(),
    const UserChat(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: _navigateBottomBar,
            gap: 8,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.green.shade100,
            padding: const EdgeInsets.all(8),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.add,
                text: 'Post',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
