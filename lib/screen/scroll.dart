// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:pazar/model/model.dart';
// import 'package:pazar/utils/data.dart';
// import 'package:pazar/utils/widget.dart';

// class RestaurantDishes extends StatefulWidget {
//   const RestaurantDishes({Key? key}) : super(key: key);

//   static String tag = '/RestaurantDishes';

//   @override
//   _RestaurantDishesState createState() => _RestaurantDishesState();
// }

// class _RestaurantDishesState extends State<RestaurantDishes>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List<Dishes> _mDishes = [];

//   @override
//   void initState() {
//     _tabController = TabController(
//       initialIndex: 0,
//       length: 2,
//       vsync: this,
//     );
//     _mDishes = getDishes();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: CustomScrollView(
//       slivers: <Widget>[
//         const SliverAppBar(
//           pinned: false,
//           snap: false,
//           floating: true,
//           flexibleSpace: FlexibleSpaceBar(
//             title: Text('Demo'),
//           ),
//         ),
//         SliverGrid(
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200.0,
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//             childAspectRatio: 4.0,
//           ),
//           delegate: SliverChildBuilderDelegate(
//             (BuildContext context, int index) {
//               return itemCard(context, _mDishes[1]);
//             },
//             childCount: 50,
//           ),
//         ),
//       ],
//     ));
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }
