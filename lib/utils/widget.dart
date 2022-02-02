// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/images.dart';

Widget text(text, textColor, fontFamily, fontSize
    // {
    // var fontSize = textSizeMedium,
    // textColor = food_textColorPrimary,
    // var fontFamily = fontRegular,
    // var isCentered = false,
    // var maxLine = 1,
    // var latterSpacing = 0.25,
    // var textAllCaps = false,
    // var isLongText = false}
    ) {
  return Text(text,
      style: TextStyle(
        color: textColor != '' ? textColor : Colors.black,
        fontFamily: fontFamily,
        fontSize: fontSize,
        // height: 1.5,
        // letterSpacing: latterSpacing
      ));
}

// class ResturantCards extends StatefulWidget {
//   // const ResturantCards({ Key? key }) : super(key: key);

//   final List<Restaurants> model;
//   const ResturantCards(this.model);

//   @override
//   _ResturantCardsState createState() => _ResturantCardsState();
// }

// class _ResturantCardsState extends State<ResturantCards> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           // index != 3 ?
//           const EdgeInsets.only(right: 10),
//       // : const EdgeInsets.only(right: 0),
//       child: Container(
//         width: 132,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.purple[600],
//             image: const DecorationImage(
//               image: AssetImage(img_tacos),
//               fit: BoxFit.fill,
//             )),
//         child: const Center(
//             child: Text(
//           'Item 1',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         )),
//       ),
//     );
//   }
// }

Widget restaurantCards(context, Restaurants model) {
  return Padding(
    padding:
        // index != 3
        //     ?
        const EdgeInsets.only(right: 10),
    // : const EdgeInsets.only(right: 0),
    child: Container(
      width: 132,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple[600],
          image: DecorationImage(
            image: AssetImage(model.image),
            fit: BoxFit.fill,
          )),
      child: const Center(
          child: Text(
        'Item 1',
        style: TextStyle(fontSize: 18, color: Colors.white),
      )),
    ),
  );
}

Widget listCards(context) {
  return Container(
      height: 94,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 6, 0),
                  child: Container(
                    // color: Colors.red,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(img_tacos),
                          fit: BoxFit.fill,
                        )),
                  ),
                ))),
            Expanded(
                flex: 4,
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Tacos poulet L',
                                style: TextStyle(
                                  fontFamily: fontBold,
                                  fontSize: textSizeMedium,
                                )),
                            // const SizedBox(height: 4),
                            Text('L طاكوس دجاج',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: fontLight,
                                  fontSize: textSizeSMedium,
                                )),
                            const Text('450.00 DA',
                                style: TextStyle(
                                  color: colorAccentGreen,
                                  fontFamily: fontRegular,
                                  fontSize: textSizeSMedium,
                                )),
                          ]),
                    ))),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: colorAccentGreen,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: const Center(
                            child: Text('Add to cart',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontRegular,
                                  fontSize: textSizeSmall,
                                )),
                          ),
                        )),
                  ],
                )),
          ],
        ),
      ));
}



// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:pazar/utils/colors.dart';
// import 'package:pazar/utils/constant.dart';
// import 'package:pazar/utils/extension.dart';
// import 'package:pazar/utils/widget.dart';
// // import 'package:stack_demo/models/FruitModel.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//   static String tag = '/Home';

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final TextEditingController _textEditingController = TextEditingController();
//   final ScrollController _scrollViewController = ScrollController();
//   bool showAppbar = true;
//   bool isScrollingDown = false;

//   // List<FruitModel> glossarListOnSearch = [];
//   // List<FruitModel> glossarList = [];

//   @override
//   void initState() {
//     _scrollViewController.addListener(() {
//       super.initState();

//       if (_scrollViewController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (!isScrollingDown) {
//           isScrollingDown = true;
//           showAppbar = false;
//           setState(() {});
//         }
//       }

//       if (_scrollViewController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         if (isScrollingDown) {
//           isScrollingDown = false;
//           showAppbar = true;
//           setState(() {});
//         }
//       }

//       // glossarList.add(FruitModel(id: 0, name: 'Apple', facts: 'Good for health'));
//       // glossarList.add(
//       //     FruitModel(id: 1, name: 'Banana', facts: 'Banana is also for health'));
//       // glossarList.add(
//       //     FruitModel(id: 2, name: 'Orange', facts: 'Orange good for health'));
//     });
//   }

//   @override
//   void dispose() {
//     _scrollViewController.dispose();
//     _scrollViewController.removeListener(() {});
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     changeStatusColor(colorAccentGreen);
//     return Scaffold(
//       backgroundColor: colorPrimary,
//       body: SafeArea(
//           child: Column(
//             children: [
//               AnimatedContainer(
//                   height: showAppbar ? 110 : 0,
//                   duration: const Duration(milliseconds: 200),
//                   color: colorPrimary,
//                   child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.shopping_basket_outlined,
//                                         color: colorAccentGreen,
//                                         size: 20.0,
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: text('0 pts', colorAccentGreen,
//                                             fontRegular, textSizeMedium),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Align(
//                                       alignment: Alignment.center,
//                                       child: text(
//                                           'ILii Ne', '', fontBold, textSizeSmall)),
//                                 ),
//                                 const Expanded(
//                                   child: SizedBox(
//                                     height: 35,
//                                     width: 35,
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: CircleAvatar(
//                                         backgroundColor: colorAccentGreen,
//                                         child: Text('IL'),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 40,
//                                 width: 300,
//                                 child: TextField(
//                                   cursorColor: colorAccentGreen,
//                                   controller: _textEditingController,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       // glossarListOnSearch = glossarList
//                                       //     .where((element) => element.name!
//                                       //         .toLowerCase()
//                                       //         .contains(value.toLowerCase()))
//                                       //     .toList();
//                                     });
//                                   },
//                                   maxLines: 1,
//                                   style: const TextStyle(
//                                       fontSize: textSizeSMedium,
//                                       fontFamily: fontLight,
//                                       color: Colors.grey,
//                                       height: 1.8),
//                                   textAlignVertical: TextAlignVertical.center,
//                                   decoration: const InputDecoration(
//                                       filled: true,
//                                       prefixIcon: Icon(
//                                         Icons.search,
//                                         color: Colors.grey,
//                                         size: 20,
//                                       ),
//                                       border: OutlineInputBorder(
//                                           borderSide: BorderSide.none,
//                                           borderRadius:
//                                               BorderRadius.all(Radius.circular(6))),
//                                       fillColor: colorAccentGrey,
//                                       contentPadding: EdgeInsets.zero,
//                                       hintText: 'search',
//                                       hintStyle: TextStyle(color: Colors.grey)),
//                                 ),
//                               ),
//                               // SizedBox(height: 2)
//                             ],
//                           ),
//                         )
//                       ]))),

                      
//             ],
//           )),
//       // body: SingleChildScrollView(
//       //   controller: _scrollViewController,
//       //   child: Padding(
//       //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       //     child:
//       //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       //       Expanded(
//       //         flex: 2,
//       //         child: Container(
//       //           color: Colors.red,
//       //         ),
//       //       ), // for the automaticlly scrolling cards
//       //       const SizedBox(height: 5),
//       //       Expanded(
//       //         flex: 1,
//       //         child: Padding(
//       //           padding: const EdgeInsets.symmetric(horizontal: 10),
//       //           child: SizedBox(
//       //               child: Column(
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   mainAxisAlignment: MainAxisAlignment.center,
//       //                   children: [
//       //                 text('Today new Available', '', fontBold, textSizeMedium),
//       //                 const SizedBox(height: 4),
//       //                 text('Best of the today items list', Colors.grey[600],
//       //                     fontLight, textSizeSMedium),
//       //               ])),
//       //         ),
//       //       ),
//       //       const SizedBox(height: 5),
//       //       Expanded(
//       //         flex: 3,
//       //         child: Container(
//       //           color: Colors.blue,
//       //         ),
//       //       ), // for the maniually scrolling cards
//       //       const SizedBox(height: 5),
//       //       Expanded(
//       //         flex: 1,
//       //         child: Padding(
//       //           padding: const EdgeInsets.symmetric(horizontal: 10),
//       //           child: SizedBox(
//       //               child: Column(
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   mainAxisAlignment: MainAxisAlignment.center,
//       //                   children: [
//       //                 text('All Items', Colors.black, fontBold, textSizeMedium),
//       //                 const SizedBox(height: 4),
//       //                 text('All Items with best items list', Colors.grey[600],
//       //                     fontLight, textSizeSMedium),
//       //               ])),
//       //         ),
//       //       ),
//       //       const SizedBox(height: 5),
//       //       // for the list cards ! ----------------------
//       //       Expanded(
//       //         flex: 4,
//       //         child: SizedBox(
//       //             child: Column(
//       //           children: [
//       //             listCards(context),
//       //             const SizedBox(height: 20),
//       //             listCards(context),
//       //           ],
//       //         )),
//       //       ),
//       //     ]),
//       //   ),
//       // ),
//     );
//   }
// }

// // void _testFuction(context, FruitModel model) {
// //   showModalBottomSheet(
// //     context: context,
// //     builder: (BuildContext bc) {
// //       return Scaffold(
// //         body: Text('${model.facts}'),
// //       );
// //     },
// //   );
// // }