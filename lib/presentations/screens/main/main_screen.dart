// ignore_for_file: deprecated_member_use

import 'package:dorah/common/constant.dart';
import 'package:dorah/presentations/screens/main/account_screen.dart';
import 'package:dorah/presentations/screens/main/home_screen.dart';
import 'package:dorah/presentations/screens/main/message_screen.dart';
import 'package:dorah/presentations/screens/main/reward_screen.dart';
import 'package:dorah/presentations/screens/main/ticket.screen.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List screenLists = [
    const HomeScreen(),
    const RewardScreen(),
    const MessageScreen(),
    const TicketScreen(),
    const AccountScreen(),
  ];
  int currentIndex = 0;

  void onTapBottomNavigation(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: screenLists[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTapBottomNavigation,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primary60,
          unselectedItemColor: text40,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          items: List.generate(
            bottomNavigationList.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                currentIndex == index
                    ? bottomNavigationList[index]['icon-filled']
                    : bottomNavigationList[index]['icon-outlined'],
                color: currentIndex == index ? primary60 : text40,
              ),
              label: bottomNavigationList[index]['name'],
            ),
          ),
        ),
      ),
    );
  }
}
