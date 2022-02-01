// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pazar/screen/search.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';

PreferredSize appBar(context) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(40.0),
      child: SafeArea(
          child: Container(
              // color: colorPrimary,
              color: Colors.blue,
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_basket_outlined,
                                    color: colorAccentGreen,
                                    size: 20.0,
                                  ),
                                  SizedBox(width: 4),
                                  Text('0 pts',
                                      style: TextStyle(
                                        color: colorAccentGreen,
                                        fontFamily: fontRegular,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.orange,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('ILii Ne',
                                      style: TextStyle(
                                        fontSize: textSizeLargeMedium,
                                        fontFamily: fontRegular,
                                      ))),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                  backgroundColor: colorAccentGreen,
                                  child: const Text('IL'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.white60, Colors.white70],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: TextField(
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              // setState(() {
                              //   // glossarListOnSearch = glossarList
                              //   //     .where((element) => element.name!
                              //   //         .toLowerCase()
                              //   //         .contains(value.toLowerCase()))
                              //   //     .toList();
                              // });
                            },
                            // controller: _textEditingController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                hintText: 'Search'),
                          ),
                        ),
                      ),
                    ),
                  ])))));
}

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }

// Flexible textWidget(text, color, fontSize) {
//   return Flexible(
//       child: Text(text != null ? text : "",
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               fontFamily: fontRegular, color: color, fontSize: fontSize)));
// }

// Flexible textWidgetRTL(text, color, fontSize) {
//   return Flexible(
//       child: Text(text,
//           textDirection: TextDirection.rtl,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               fontFamily: fontRegular, color: color, fontSize: fontSize)));
// }

// SvgPicture svgPicture(icon) {
//   return SvgPicture.asset(
//     icon,
//     height: 36,
//     width: 36,
//     color: colorAccentGrey,
//   );
// }

// Widget bookContainer(icon, field, content, textColor, fontSize) {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(0, 14.0, 0, 0),
//     child: Container(
//         // color: Colors.red,
//         child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         svgPicture(icon),
//         Padding(
//             padding: const EdgeInsets.fromLTRB(8.0, 4.0, 14.0, 4.0),
//             child: Text(toCapitalized(field),
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontFamily: fontRegular,
//                     color: colorAccentGrey,
//                     fontSize: 20.0))),
//         Flexible(
//           child: Padding(
//             padding: arabicChar(content)
//                 ? const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0)
//                 : field == 'listing: '
//                     ? const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0)
//                     : field == 'title: '
//                         ? const EdgeInsets.fromLTRB(0, 6.0, 0, 6.0)
//                         : const EdgeInsets.fromLTRB(0, 7.0, 0, 7.0),
//             child: Row(
//               mainAxisAlignment: arabicChar(content) && field == 'title: '
//                   ? MainAxisAlignment.end
//                   : arabicChar(content) &&
//                           (field == 'author: ' || field == 'subfiled: ')
//                       ? MainAxisAlignment.center
//                       : MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Text(toTitleCase(content) + "\n",
//                       textDirection: arabicChar(content)
//                           ? TextDirection.rtl
//                           : TextDirection.ltr,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 5,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontFamily: fontRegular,
//                           color: textColor,
//                           fontSize: fontSize)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     )),
//   );
// }

// // detect if the text have arabic char to make it RTL direction
// final arabicCharExp = RegExp("^[\u0621-\u064A]", unicode: true);
// bool arabicChar(String str) {
//   return str != "" ? arabicCharExp.hasMatch(str) : false;
// }
