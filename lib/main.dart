import 'package:flutter/material.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/item_details.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/restaurant_dishes.dart';

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
        '/': (context) => const Home(),
        Home.tag: (context) => const Home(),
        ItemDetails.tag: (context) => const ItemDetails(),
        ItemsCart.tag: (context) => const ItemsCart(),
        RestaurantDishes.tag: (context) => const RestaurantDishes(),
      },
    );
  }
}
