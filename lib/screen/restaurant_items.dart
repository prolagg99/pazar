import 'package:flutter/material.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';
import 'package:provider/provider.dart';

class RestaurantItems extends StatefulWidget {
  const RestaurantItems({Key? key}) : super(key: key);
  static String tag = '/RestaurantItems';

  @override
  _RestaurantItemsState createState() => _RestaurantItemsState();
}

class _RestaurantItemsState extends State<RestaurantItems> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CatalogModel>();
    Item firstItem = cart.catalogItems[0];

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
                    itemCount: cart.catalogItems.length,
                    itemBuilder: (context, index) {
                      return cart.catalogItems[index] == firstItem
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: ItemCard(cart.catalogItems[index]))
                          : ItemCard(cart.catalogItems[index]);
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
