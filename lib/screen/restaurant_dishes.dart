import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/screen/item_details.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';
import 'package:pazar/utils/widget.dart';

class RestaurantDishes extends StatefulWidget {
  const RestaurantDishes({Key? key}) : super(key: key);
  static String tag = '/RestaurantDishes';

  @override
  _RestaurantDishesState createState() => _RestaurantDishesState();
}

class _RestaurantDishesState extends State<RestaurantDishes> {
  List<Dishes> _mDishes = [];

  @override
  void initState() {
    super.initState();
    _mDishes = getDishes();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 95,
            pinned: false,
            snap: false,
            floating: true,
            flexibleSpace: appBar(context),
          ),
          SliverFillRemaining(
              child: Container(
            // color: Colors.red,
            child: dishesList(_mDishes),
          ))
        ]),
      ),
    );
  }
}
