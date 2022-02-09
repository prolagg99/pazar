// ignore_for_file: must_be_immutable

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
  // int numb = 1;
  // // get the price from db !!
  // double price = 1450.0;
  // double _totalPrice = 0.0;
  late List<Dishes> _items;

  @override
  void initState() {
    super.initState();
    _items = getItems();
    // _totalPrice = price;
    // totalWithDelivery = _totalPrice + 200.0;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 196,
                  elevation: 0.0,
                  pinned: true,
                  snap: false,
                  floating: true,
                  bottom: const PreferredSize(
                      preferredSize: Size(0, 196), child: Text('')),
                  flexibleSpace: PreferredSize(
                    preferredSize: const Size(0, 120), // Add this code
                    child: Container(
                      color: colorAccentGreen,
                      // height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(),
                          Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 44,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: colorAccentBlue,
                                              borderRadius:
                                                  BorderRadius.circular(08)),
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
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26.0),
                                  topRight: Radius.circular(26.0),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body:
                // the scrolling getItems List !
                ScrollConfiguration(
              behavior: MyBehavior(),
              child: Scrollbar(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return CartItemsCard(model: _items[index]);
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

class CartItemsCard extends StatefulWidget {
  // const CartItemsCard({Key? key}) : super(key: key);

  Dishes model;
  CartItemsCard({Key? key, required this.model}) : super(key: key);

  @override
  _CartItemsCardState createState() => _CartItemsCardState();
}

class _CartItemsCardState extends State<CartItemsCard> {
  double totalWithDelivery = 0.0;
  int qnt = 1;
  // get the price from db !!
  double _itemPrice = 0.0;
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _itemPrice = widget.model.price;
    _totalPrice = _itemPrice;
    totalWithDelivery = _totalPrice + 200.0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        color: Colors.white,
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Container(
                          height: 66.0,
                          width: 58.0,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage(img_tacos),
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                            child: text(widget.model.name,
                                fontSize: textSizeSMedium)),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      children: [
                        Container(
                            height: 32.0,
                            width: 56.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(26)),
                              border: Border.all(width: 0.5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (qnt > 1) {
                                          qnt -= 1;
                                          _totalPrice =
                                              _totalPrice - _itemPrice;
                                          if (totalWithDelivery == 200.0) {
                                            totalWithDelivery = 0.0;
                                          } else {
                                            totalWithDelivery = _totalPrice;
                                          }
                                        }
                                      });
                                    },
                                    child: SizedBox(
                                        child: Center(child: text('-'))),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: text('$qnt',
                                          fontSize: textSizeSMedium),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          qnt += 1;
                                          _totalPrice = _itemPrice * qnt;
                                          if (totalWithDelivery == 0.0) {
                                            totalWithDelivery =
                                                _totalPrice + 200.0;
                                          } else {
                                            totalWithDelivery = _totalPrice;
                                          }
                                        });
                                      },
                                      child: SizedBox(
                                          child: Center(child: text('+'))),
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
    );
  }
}
