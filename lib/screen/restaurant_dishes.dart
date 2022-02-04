import 'package:flutter/material.dart';

class RestaurantDishes extends StatefulWidget {
  const RestaurantDishes({Key? key}) : super(key: key);
  static String tag = '/RestaurantDishes';

  @override
  _RestaurantDishesState createState() => _RestaurantDishesState();
}

class _RestaurantDishesState extends State<RestaurantDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(),
    ));
  }
}
