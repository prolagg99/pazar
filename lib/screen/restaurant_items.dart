import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/data_generation.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';

class RestaurantItems extends StatefulWidget {
  const RestaurantItems({Key? key}) : super(key: key);
  static String tag = '/RestaurantItems';

  @override
  _RestaurantItemsState createState() => _RestaurantItemsState();
}

class _RestaurantItemsState extends State<RestaurantItems> {
  List<Dishes> _mDishes = [];
  late Dishes firstItem;

  @override
  void initState() {
    _mDishes = getDishes();
    firstItem = _mDishes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                shape: const ContinuousRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(46))),
                automaticallyImplyLeading: false,
                // expandedHeight: 101,
                elevation: 0,
                pinned: false,
                snap: false,
                floating: true,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(40.0), // Add this code
                  child: Text(''), // Add this code
                ),
                flexibleSpace: appBar(context, 'kababji'),
              ),
            ];
          },
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    itemCount: _mDishes.length,
                    itemBuilder: (context, index) {
                      return _mDishes[index] == firstItem
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: itemCard(context, _mDishes[index]))
                          : itemCard(context, _mDishes[index]);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
