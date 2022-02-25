// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';

class CategoryItems extends StatefulWidget {
  final String category;
  List<Item> categoryItems;
  CategoryItems({
    Key? key,
    required this.category,
    required this.categoryItems,
  }) : super(key: key);
  static String tag = '/CategoryItems';

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    var categoryItems = widget.categoryItems;
    Item firstItem = categoryItems[0];

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
                flexibleSpace: appBar(context, widget.category),
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
                    itemCount: categoryItems.length,
                    itemBuilder: (context, index) {
                      return categoryItems[index] == firstItem
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: ItemCard(categoryItems[index]))
                          : ItemCard(categoryItems[index]);
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
