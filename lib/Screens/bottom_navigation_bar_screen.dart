import 'package:flutter/material.dart';

import '../Data/data.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';
import 'wallet_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 3;
  List<Widget> screens = [
    AccountPage(),
    OrdersPage(),
    WalletPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'الحساب'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.featured_play_list_outlined,
              ),
              label: 'الطلبات'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
            ),
            label: 'المحفظة',
            tooltip: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'الرئيسية',
            tooltip: 'الرئيسية',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 30),
        selectedLabelStyle: TextStyle(fontSize: 18, color: primaryColor),
        unselectedLabelStyle: TextStyle(fontSize: 18, color: primaryColor),
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }
}
