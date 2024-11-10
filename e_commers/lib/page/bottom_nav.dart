import 'package:e_commers/page/home.dart';
import 'package:e_commers/page/order_page.dart';
import 'package:e_commers/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  late Home homepage;
  late OrderPage orderPage;
  late Profile profilepage;
  int tabIndex = 0;

  @override
  void initState() {
    homepage = Home();
    profilepage = Profile();
    orderPage = OrderPage();
    pages = [homepage, orderPage, profilepage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[tabIndex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Color.fromARGB(255, 215, 204, 204),
          color: Colors.black,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            )
          ]),
    );
  }
}
