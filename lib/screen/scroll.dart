// import 'package:flutter/material.dart';
// import 'package:pazar/model/model.dart';
// import 'package:pazar/screen/restaurant_items.dart';
// import 'package:pazar/utils/data_generation.dart';
// import 'package:pazar/utils/extension.dart';
// import 'package:pazar/utils/widget.dart';
// import 'package:pazar/screen/restaurant_items.dart';

// class RestaurantDishes2 extends StatefulWidget {
//   const RestaurantDishes2({Key? key}) : super(key: key);

//   static String tag = '/RestaurantDishes2';

//   @override
//   _RestaurantDishes2State createState() => _RestaurantDishes2State();
// }

// class _RestaurantDishes2State extends State<RestaurantDishes2>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _textEditingController = TextEditingController();
//   List<Dishes> dishesListOnSearch = [];

//   List<Restaurants> mRestaurants = [];
//   List<Dishes> _mDishes = [];
//   late Dishes firstItem;
//   List<Slides> mSlides = [];
//   late Restaurants lastItem;

//   @override
//   void initState() {
//     _mDishes = getDishes();
//     firstItem = _mDishes[0];
//     mRestaurants = getRestaurantImages();
//     lastItem = mRestaurants[mRestaurants.length - 1];
//     mSlides = getSlides();
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
//         SliverFillRemaining(hasScrollBody: false, child: itemNotFound(context))
//       ],
//     ));
//   }
// }
