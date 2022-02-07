import 'package:flutter/material.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/restaurant_items.dart';

void main() async {
  runApp(const Pazar());
}

class Pazar extends StatelessWidget {
  const Pazar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // '/': (context) => const TestScroll(),
        // '/': (context) => const RestaurantDishes2(),
        '/': (context) => const BottomNavigation(),
        ItemsCart.tag: (context) => const ItemsCart(),
        RestaurantItems.tag: (context) => const RestaurantItems(),
      },
    );
  }
}
