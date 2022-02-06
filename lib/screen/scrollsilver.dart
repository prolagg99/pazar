// // ignore_for_file: unnecessary_const

// import 'package:flutter/material.dart';
// import 'package:pazar/utils/data_generation.dart';
// import 'package:pazar/model/model.dart';

// class TestScroll extends StatefulWidget {
//   const TestScroll({Key? key}) : super(key: key);

//   @override
//   _TestScrollState createState() => _TestScrollState();
// }

// class _TestScrollState extends State<TestScroll> {
//   List<Dishes> _mDishes = [];

//   @override
//   void initState() {
//     super.initState();
//     _mDishes = getDishes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           const SliverAppBar(
//             expandedHeight: 95,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('FilledStacks'),
//             ),
//           ),
//           SliverFillRemaining(
//             child: Column(children: const [
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               SizedBox(height: 50),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               SizedBox(height: 50),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               SizedBox(height: 50),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               SizedBox(height: 50),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               Text('1'),
//               SizedBox(height: 50),
//             ]),
//           )
//         ],
//       ),
//     );
//   }
// }
