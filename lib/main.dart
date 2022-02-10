import 'package:flutter/material.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/profile.dart';
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
        '/': (context) => const Profile(),
        ItemCart.tag: (context) => const ItemCart(),
        RestaurantItems.tag: (context) => const RestaurantItems(),
      },
    );
  }
}
