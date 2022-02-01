// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:flappy_search_bar/search_bar_style.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// import 'package:pazar/utils/colors.dart';
// import 'package:pazar/utils/constant.dart';
// import 'package:pazar/utils/widget.dart';

// class Post {
//   final String title;
//   final String body;

//   Post(this.title, this.body);
// }

// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final SearchBarController<Post> _searchBarController = SearchBarController();
//   bool isReplay = false;

//   Future<List<Post>> _getALlPosts(String text) async {
//     List<Post> posts = [];

//     var random = Random();
//     for (int i = 0; i < 10; i++) {
//       posts
//           .add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
//     }
//     return posts;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         preferredSize: const Size.fromHeight(104.0),
//         child: Scaffold(
//           // appBar: appBar(context),
//           body: SafeArea(
//               //   child: Column(children: [
//               // Expanded(
//               //   child: Container(
//               //     color: Colors.grey,
//               //     child: Row(
//               //       children: [
//               //         Expanded(
//               //           child: Container(
//               //             color: Colors.black,
//               //             child: Row(
//               //               children: const [
//               //                 Icon(
//               //                   Icons.shopping_basket_outlined,
//               //                   color: colorAccentGreen,
//               //                   size: 20.0,
//               //                 ),
//               //                 SizedBox(width: 4),
//               //                 Text('0 pts',
//               //                     style: TextStyle(
//               //                       color: colorAccentGreen,
//               //                       fontFamily: fontRegular,
//               //                     )),
//               //               ],
//               //             ),
//               //           ),
//               //         ),
//               //         Expanded(
//               //           child: Container(
//               //             color: Colors.orange,
//               //             child: const Align(
//               //                 alignment: Alignment.center,
//               //                 child: Text('ILii Ne',
//               //                     style: TextStyle(
//               //                       fontSize: textSizeLargeMedium,
//               //                       fontFamily: fontRegular,
//               //                     ))),
//               //           ),
//               //         ),
//               //         Expanded(
//               //           child: Container(
//               //             color: Colors.green,
//               //             child: const Align(
//               //               alignment: Alignment.centerRight,
//               //               child: CircleAvatar(
//               //                 backgroundColor: colorAccentGreen,
//               //                 child: Text('IL'),
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               child: SearchBar<Post>(
//             hintText: 'search',
//             hintStyle: TextStyle(
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.grey[500]),
//             // icon: ic_search,
//             textStyle: const TextStyle(color: Colors.white),
//             searchBarPadding:
//                 const EdgeInsets.symmetric(horizontal: 38, vertical: 00),
//             searchBarStyle: SearchBarStyle(
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
//               backgroundColor: colorAccentGrey,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             minimumChars: 1,
//             onSearch: _getALlPosts,
//             searchBarController: _searchBarController,
//             placeHolder: Container(
//               color: Colors.red,
//               child: const Center(
//                   child: Text(
//                 "PlaceHolder",
//                 style: TextStyle(fontSize: 30),
//               )),
//             ),
//             cancellationWidget: const Text("Cancel"),
//             emptyWidget: const Text("empty"),
//             onCancelled: () {
//               print("Cancelled triggered");
//             },
//             mainAxisSpacing: 10,
//             onItemFound: (Post post, int index) {
//               return Container(
//                 color: Colors.lightBlue,
//                 child: ListTile(
//                   title: Text(post.title),
//                   isThreeLine: true,
//                   subtitle: Text(post.body),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const Detail()));
//                   },
//                 ),
//               );
//             },
//           )),
//         ));

//     // ])))));
//   }
// }

// class Detail extends StatelessWidget {
//   const Detail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const SafeArea(
//         child: Center(
//             child: Text(
//           "Detail",
//           style: TextStyle(fontSize: 30),
//         )),
//       ),
//     );
//   }
// }
