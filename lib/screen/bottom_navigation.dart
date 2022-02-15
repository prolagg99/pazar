import 'package:flutter/material.dart';
import 'package:pazar/model/cart.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/profile.dart';
import 'package:pazar/utils/colors.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List _children = const [
    Home(),
    ItemCart(),
    Profile(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex], // new
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 0.1, color: Colors.grey))),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                bottomNavigationBarItem(Icons.home_outlined, Icons.home),
                bottomNavigationBarItem(
                    Icons.shopping_cart_outlined, Icons.shopping_cart),
                bottomNavigationBarItem(Icons.person_outline, Icons.person),
              ],
            ),
          ),
        ));
  }
}

BottomNavigationBarItem bottomNavigationBarItem(ic, activeIc) {
  return BottomNavigationBarItem(
      icon: Icon(ic, size: 28),
      label: '',
      activeIcon: Icon(activeIc, size: 28, color: colorAccentGreen));
}
