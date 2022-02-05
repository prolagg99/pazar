import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/data.dart';
import 'package:pazar/utils/widget.dart';

class RestaurantDishes extends StatefulWidget {
  const RestaurantDishes({Key? key}) : super(key: key);
  static String tag = '/RestaurantDishes';

  @override
  _RestaurantDishesState createState() => _RestaurantDishesState();
}

class _RestaurantDishesState extends State<RestaurantDishes>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Dishes> _mDishes = [];
  late Dishes firstItem;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    _mDishes = getDishes();
    firstItem = _mDishes[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 95,
              elevation: 0,
              pinned: false,
              snap: false,
              floating: true,
              flexibleSpace: appBar(context, 'Kabaji'),
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
                  // separatorBuilder: (context, child) => const Divider(
                  //   height: 1,
                  // ),
                  padding: const EdgeInsets.all(0.0),
                  itemCount: _mDishes.length,
                  itemBuilder: (context, i) {
                    return _mDishes[i] == firstItem
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: itemCard(context, _mDishes[i]))
                        : itemCard(context, _mDishes[i]);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

// class TabA extends StatelessWidget {
//   // const TabA({Key? key}) : super(key: key);
//   List<Dishes> model;
//   TabA({required this.model});

//   @override
//   Widget build(BuildContext context) {
//     return Scrollbar(
//       child: ListView.separated(
//         separatorBuilder: (context, child) => const Divider(
//           height: 1,
//         ),
//         padding: const EdgeInsets.all(0.0),
//         itemCount: model.length,
//         itemBuilder: (context, i) {
//           return itemCard(context, model[i]);
//         },
//       ),
//     );
//   }
// }
