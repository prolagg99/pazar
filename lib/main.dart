import 'package:flutter/material.dart';
import 'package:pazar/model/cart_model.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/restaurant_items.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: const Pazar(),
  ));
}

class Pazar extends StatelessWidget {
  const Pazar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => const BottomNavigation(),
        ItemCart.tag: (context) => const ItemCart(),
        RestaurantItems.tag: (context) => const RestaurantItems(),
      },
    );
  }
}
