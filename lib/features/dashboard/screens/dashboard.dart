import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/dashboard/widgets/add_friend_button.dart';
import 'package:oweme/features/dashboard/widgets/friend_avatar.dart';
import 'package:oweme/features/dashboard/widgets/group_card.dart';
import 'package:oweme/features/dashboard/widgets/overall_balance_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: AppTheme.white,
                      child: Icon(
                        PhosphorIcons.bell_simple_fill,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34),
              // Dashboard Card
              OverallBalanceCard(
                totalBalance: 220.0,
                oweAmount: 45.0,
                owedAmout: 135.0,
              ),
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
                height: 100,
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
              SizedBox(height: 14),
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
                  ],
                ),
              ),
              const SizedBox(height: 6),
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
