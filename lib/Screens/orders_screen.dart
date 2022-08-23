import 'package:flutter/material.dart';

import '../Data/data.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'wallet_screen.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int selected = 1;
  List<Widget> screens = [
    AccountPage(),
    OrdersPage(),
    WalletPage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/under_construction.png"),
      ),
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
        selectedLabelStyle: TextStyle(fontSize: 16, color: primaryColor),
        unselectedLabelStyle: TextStyle(fontSize: 14, color: primaryColor),
        currentIndex: selected,
        onTap: (index) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => screens[index]));
        },
      ),
    );
  }
}
