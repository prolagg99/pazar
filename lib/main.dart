import 'package:flutter/material.dart';
import 'package:pazar/model/cart.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/profile.dart';
import 'package:pazar/screen/restaurant_items.dart';
import 'package:pazar/model/catalog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => CatalogModel()),
      ChangeNotifierProvider(
        create: (context) => CartModel(),
      ),
    ],
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
        Home.tag: (context) => const Home(),
        RestaurantItems.tag: (context) => const RestaurantItems(),
        ItemCart.tag: (context) => const ItemCart(),
        Profile.tag: (context) => const Profile(),
      },
    );
  }
}
