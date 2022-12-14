import 'package:flutter/material.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/goals_page.dart';
import 'package:masroofy/home_page.dart';
import 'package:masroofy/settings_page.dart';
import 'package:masroofy/wallet_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> screens = [
    HomePage(),
    WalletPage(),
    GoalsPage(),
    SettingsPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 218, 218, 218),
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: "Home",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_balance_wallet_outlined),
              label: "Wallet",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.checklist_rounded),
              label: "Goals",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              label: "Settings",
              backgroundColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
