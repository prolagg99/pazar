import 'package:flutter/material.dart';

class ItemsCart extends StatefulWidget {
  const ItemsCart({Key? key}) : super(key: key);
  static String tag = '/ItemsCart';

  @override
  _ItemsCartState createState() => _ItemsCartState();
}

class _ItemsCartState extends State<ItemsCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(),
    ));
  }
}
