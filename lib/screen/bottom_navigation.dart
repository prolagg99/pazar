import 'package:flutter/material.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/profile.dart';
import 'package:pazar/utils/colors.dart';

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
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: '',
              activeIcon: Icon(
                Icons.home,
                color: colorAccentGreen,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: '',
              activeIcon: Icon(
                Icons.shopping_cart,
                color: colorAccentGreen,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
              activeIcon: Icon(
                Icons.person,
                color: colorAccentGreen,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  const PlaceholderWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color,
      ),
    );
  }
}
