import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/screens/add_group_screen.dart';
import 'package:oweme/features/dashboard/screens/dashboard.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Dashboard(),
    Center(child: Text('Search')),
    AddGroupScreen(),
    Center(child: Text('Groups')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Nav Bar
      bottomNavigationBar: Container(
        color: AppTheme.gray,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          child: GNav(
            gap: 8,
            onTabChange: _navigateBottomBar,
            selectedIndex: _selectedIndex,
            tabs: [
              GButton(icon: PhosphorIcons.house_simple_fill, text: 'Home'),
              GButton(
                icon: PhosphorIcons.magnifying_glass_fill,
                text: 'Search',
              ),
              GButton(icon: PhosphorIcons.plus_circle_bold, text: 'Add Group'),
              GButton(icon: PhosphorIcons.users_three_bold, text: 'Groups'),
              GButton(icon: PhosphorIcons.user_bold, text: 'Profile'),
            ],
            tabBackgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
            backgroundColor: AppTheme.gray,
            color: AppTheme.primaryBackground,
            activeColor: AppTheme.primaryBackground,
            padding: EdgeInsets.all(12),
          ),
        ),
      ),

      body: IndexedStack(
      index: _selectedIndex,
      children: _pages,
    ),
    );
  }
}
