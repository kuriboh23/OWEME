import 'package:flutter/material.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/widgets/add_friend_button.dart';
import 'package:oweme/features/dashboard/widgets/friend_avatar.dart';
import 'package:oweme/features/dashboard/widgets/group_card.dart';
import 'package:oweme/features/dashboard/widgets/overall_balance_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Float Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addGroup');
        },
        label: Text(
          'Add Group',
          style: TextStyle(
            color: AppTheme.primaryBackground,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(Icons.add, color: AppTheme.primaryBackground),
        backgroundColor: AppTheme.white.withAlpha(200),
      ),
      // Bottom Nav Bar
      bottomNavigationBar: Container(
        color: AppTheme.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
          child: GNav(
            gap: 8,
            onTabChange: (index) {
              print(index);
            },
            selectedIndex: 0,
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.group, text: 'Groups'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
            tabBackgroundColor: AppTheme.primaryColor.withValues(alpha: 0.3),
            backgroundColor: AppTheme.white,
            color: AppTheme.primaryBackground,
            activeColor: AppTheme.primaryColor,
            padding: EdgeInsets.all(12),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello, Hamza',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Notification Clicked');
                    },
                    child: CircleAvatar(
                      backgroundColor: AppTheme.white,
                      child: Icon(
                        Icons.notifications,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              // Dashboard Card
              OverallBalanceCard(),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'Quick Send',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.white,
                  ),
                ),
              ),

              // Friends
              SizedBox(
                height: 104,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    AddFriendButton(),
                    SizedBox(width: 16),
                    FriendAvatar(name: 'Hamza'),
                    SizedBox(width: 16),
                    FriendAvatar(name: 'Alae'),
                    SizedBox(width: 16),
                    FriendAvatar(name: 'Alaaedin'),
                    SizedBox(width: 16),
                    FriendAvatar(name: 'Yakuza'),
                    SizedBox(width: 16),
                    FriendAvatar(name: 'Yassmine'),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Groups',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: AppTheme.textBody,
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Recent Groups
              GroupCard(
                groupName: 'Trip Ifran',
                isOwed: true,
                amount: 45,
                isOngoing: true,
                members: 5,
              ),
              GroupCard(
                groupName: 'Party',
                isOwed: false,
                amount: 15,
                isOngoing: false,
                members: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
