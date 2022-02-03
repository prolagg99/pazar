// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:pazar/model/model.dart';
// import 'package:pazar/utils/data.dart';
// import 'package:pazar/utils/widget.dart';

// class PrefetchImageDemo extends StatefulWidget {
//   const PrefetchImageDemo({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _PrefetchImageDemoState();
//   }
// }

// class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
//   List<Slides> mSlides = [];

//   @override
//   void initState() {
//     mSlides = getSlides();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.red,
//       body: SafeArea(
//         child: CarouselSlider.builder(
//           itemCount: mSlides.length,
//           options: CarouselOptions(
//             viewportFraction: 1,
//             autoPlay: true,
//             // aspectRatio: 3.0,
//             // enlargeCenterPage: true,
//           ),
//           itemBuilder: (context, index, realIdx) {
//             return slideContainer(context, mSlides[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// // Widget slideContainer(context, model) {
// //   return Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 36),
// //     child: Image.asset(
// //       model.image,
// //       // height: 20,
// //       // fit: BoxFit.cover,
// //     ),
// //   );
// // }
