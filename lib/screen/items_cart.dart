import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data_generation.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';
import 'package:pazar/utils/widget.dart';

class ItemsCart extends StatefulWidget {
  const ItemsCart({Key? key}) : super(key: key);
  static String tag = '/ItemsCart';

  @override
  _ItemsCartState createState() => _ItemsCartState();
}

class _ItemsCartState extends State<ItemsCart> {
  double totalWithDelivery = 0.0;
  int numb = 1;
  // get the price from db !!
  double price = 1450.0;
  double _totalPrice = 0.0;
  late List<Dishes> _items;

  @override
  void initState() {
    super.initState();
    _items = getItems();
    _totalPrice = price;
    totalWithDelivery = _totalPrice + 200.0;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
        backgroundColor: colorAccentGreen,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 116),
          child: SafeArea(
            child: Container(
              color: colorAccentGreen,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text('total',
                                fontSize: textSizeMedium,
                                textColor: Colors.white),
                            text('${totalWithDelivery}0DA',
                                fontFamily: fontBold,
                                fontSize: textSizeMedium,
                                textColor: Colors.white),
                            text('delivery price: 200.00DA',
                                textColor: Colors.white,
                                fontSize: textSizeSmall,
                                textTitleCase: true),
                          ]),
                    ),
                  ),
                  const SizedBox(width: 26.0),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      // color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 44,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: colorAccentBlue,
                                  borderRadius: BorderRadius.circular(08)),
                              child: Center(
                                child: text('checkout',
                                    fontFamily: fontBold,
                                    fontSize: textSizeSMedium,
                                    textColor: Colors.white),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(width: 26.0),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.green,
                      child: Column(
                        children: [
                          text('cart items',
                              fontFamily: fontBold,
                              textColor: colorAccentGreen,
                              textTitleCase: true),
                          const SizedBox(
                            height: 2.0,
                          ),
                          text('swip left to remove items from list',
                              fontFamily: fontLight,
                              fontSize: textSizeSMedium,
                              textColor: Colors.grey[600]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _items.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: SizedBox(
                              // color: Colors.red,
                              height: 80.0,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 66.0,
                                                width: 58.0,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                      image:
                                                          AssetImage(img_tacos),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                              const SizedBox(width: 10.0),
                                              Container(
                                                  child: text('tacos poulet L',
                                                      fontSize:
                                                          textSizeSMedium)),
                                              const SizedBox(width: 10.0),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: 32.0,
                                                  width: 56.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    border:
                                                        Border.all(width: 0.5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (numb > 1) {
                                                                numb -= 1;
                                                                _totalPrice =
                                                                    _totalPrice -
                                                                        price;
                                                                if (totalWithDelivery ==
                                                                    200.0) {
                                                                  totalWithDelivery =
                                                                      0.0;
                                                                } else {
                                                                  totalWithDelivery =
                                                                      _totalPrice;
                                                                }
                                                              }
                                                            });
                                                          },
                                                          child: SizedBox(
                                                              child: Center(
                                                                  child: text(
                                                                      '-'))),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Center(
                                                            child: text('$numb',
                                                                fontSize:
                                                                    textSizeSMedium),
                                                          )),
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                numb += 1;
                                                                _totalPrice =
                                                                    price *
                                                                        numb;
                                                                if (totalWithDelivery ==
                                                                    0.0) {
                                                                  totalWithDelivery =
                                                                      _totalPrice +
                                                                          200.0;
                                                                } else {
                                                                  totalWithDelivery =
                                                                      _totalPrice;
                                                                }
                                                              });
                                                            },
                                                            child: SizedBox(
                                                                child: Center(
                                                                    child: text(
                                                                        '+'))),
                                                          )),
                                                    ],
                                                  )),
                                              const SizedBox(width: 3.0),
                                              text('X', fontSize: 9.0),
                                              const SizedBox(width: 3.0),
                                              text('${_totalPrice}0DA',
                                                  textColor: colorAccentGreen,
                                                  fontSize: textSizeSMedium),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              )),
        ));
  }
}

// class CartItemsCard extends StatefulWidget {
//   const CartItemsCard({Key? key}) : super(key: key);

//   @override
//   State<CartItemsCard> createState() => _CartItemsCardState();
// }

// class _CartItemsCardState extends State<CartItemsCard> {
//   int numb = 1;
//   double price = 1450.0;
//   double _totalPrice = 0.0;

//   double get totalPrice => _totalPrice;

//   @override
//   void initState() {
//     super.initState();
//     _totalPrice = price;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: SizedBox(
//         // color: Colors.red,
//         height: 80.0,
//         width: MediaQuery.of(context).size.width,
//         child: Row(
//           children: [
//             Expanded(
//               flex: 4,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 66.0,
//                           width: 58.0,
//                           decoration: const BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10)),
//                               image: DecorationImage(
//                                 image: AssetImage(img_tacos),
//                                 fit: BoxFit.fill,
//                               )),
//                         ),
//                         const SizedBox(width: 10.0),
//                         Container(
//                             child: text('tacos poulet L',
//                                 fontSize: textSizeSMedium)),
//                         const SizedBox(width: 10.0),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 12.0),
//                     child: Row(
//                       children: [
//                         Container(
//                             height: 32.0,
//                             width: 56.0,
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(26)),
//                               border: Border.all(width: 0.5),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         if (numb > 1) {
//                                           numb -= 1;
//                                           _totalPrice = _totalPrice - price;
//                                         }
//                                       });
//                                     },
//                                     child: SizedBox(
//                                         child: Center(child: text('-'))),
//                                   ),
//                                 ),
//                                 Expanded(
//                                     flex: 2,
//                                     child: Center(
//                                       child: text('$numb',
//                                           fontSize: textSizeSMedium),
//                                     )),
//                                 Expanded(
//                                     flex: 2,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           numb += 1;
//                                           _totalPrice = price * numb;
//                                         });
//                                       },
//                                       child: SizedBox(
//                                           child: Center(child: text('+'))),
//                                     )),
//                               ],
//                             )),
//                         const SizedBox(width: 3.0),
//                         text('X', fontSize: 9.0),
//                         const SizedBox(width: 3.0),
//                         text('${totalPrice}0DA',
//                             textColor: colorAccentGreen,
//                             fontSize: textSizeSMedium),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
