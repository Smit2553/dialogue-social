import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dialogue_social/pages/home.dart';
import 'package:dialogue_social/pages/discover.dart';
import 'package:dialogue_social/pages/notifications.dart';
import 'package:dialogue_social/pages/profile.dart';
import 'package:dialogue_social/pages/chat.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int unreadNotifications = 1;

  void _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const UserHome(),
    DiscoverPage(),
    const UserNotifications(),
    UserChat(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green.shade100,
        foregroundColor: Colors.black,
        children: [
          _currentIndex == 3
              ? SpeedDialChild(
                  child: const Icon(Icons.add_comment),
                  label: 'New Chat',
                )
              : SpeedDialChild(
                  child: const Icon(Icons.add),
                  label: 'New Post',
                  onTap: () {},
                ),
          _currentIndex == 1
              ? SpeedDialChild(
                  child: const Icon(Icons.search),
                  label: 'Search',
                  onTap: () {},
                )
              : SpeedDialChild(
                  child: const Icon(Icons.search),
                  label: 'Search',
                  // go to discover page
                  onTap: () {
                    setState(
                      () {
                        _currentIndex = 1;
                      },
                    );
                  },
                ),
          if (_currentIndex == 2)
            SpeedDialChild(
              child: const Icon(Icons.delete),
              label: 'Read Notifications',
              onTap: () {
                setState(
                  () {
                    unreadNotifications = 0;
                  },
                );
              },
            ),
          if (_currentIndex == 4)
            SpeedDialChild(
              child: const Icon(Icons.settings),
              label: 'Settings',
              onTap: () {},
            ),
        ],
      ),
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
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.explore,
                text: 'Discover',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
                leading: _currentIndex == 2 || unreadNotifications == 0
                    ? null
                    : badges.Badge(
                        position:
                            badges.BadgePosition.topEnd(top: -12, end: -12),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.red.shade100,
                          elevation: 0,
                        ),
                        badgeContent: Text(
                          unreadNotifications.toString(),
                          style: TextStyle(color: Colors.red.shade900),
                        ),
                        child: Icon(
                          Icons.notifications,
                          color:
                              _currentIndex == 2 ? Colors.black : Colors.pink,
                        ),
                      ),
              ),
              const GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              const GButton(
                icon: Icons.person,
                leading: CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.png')),
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
