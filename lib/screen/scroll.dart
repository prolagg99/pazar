import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/data.dart';
import 'package:pazar/utils/widget.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Dishes> _mDishes = [];

  @override
  void initState() {
    super.initState();
    _mDishes = getDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: MyBehavior(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 95,
            pinned: false,
            snap: false,
            floating: true,
            flexibleSpace: appBar(context),
          ),
          SliverFillRemaining(
            child: Container(
              child: dishesList(_mDishes),
            ),
          )
        ],
      ),
    ));
  }
}
