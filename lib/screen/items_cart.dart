// ignore_for_file: must_be_immutable, avoid_print, import_of_legacy_library_into_null_safe, deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data_generation.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';

final key = GlobalKey<_ItemsCartAppBarState>();
final List<Dishes> items = getItems();

class ItemCart extends StatefulWidget {
  const ItemCart({Key? key}) : super(key: key);
  static String tag = '/ItemsCart';

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  // late List<Dishes> _items;

  @override
  void initState() {
    super.initState();
    // _items = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(0, 184),
          child: ItemsCartAppBar(
            key: key,
            length: items.length,
            itemsList: items,
          ),
        ),
        body: SizedBox(
            child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Scrollbar(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CartItemsCard(
                    model: items[index],
                    index: index,
                  );
                },
              ),
            ),
          ),
        )));
  }
}

class ItemsCartAppBar extends StatefulWidget {
  int length;
  List<Dishes> itemsList;
  ItemsCartAppBar({Key? key, required this.length, required this.itemsList})
      : super(key: key);

  @override
  _ItemsCartAppBarState createState() => _ItemsCartAppBarState();
}

class _ItemsCartAppBarState extends State<ItemsCartAppBar> {
  double totalWithDelivery = 0.0;
  double totalWithQntDelivery = 0.0;

  // to calculate the total price after updating the qnt of each item !
  late List sum;

  @override
  void initState() {
    super.initState();
    sum = List<double>.filled(widget.length, 0);
    // if (widget.length != 0) {
    //   totalWithDelivery = 200.0;
    //   initialTotalPrice();
    // }
    initialTotalPrice();
  }

  void initialTotalPrice() {
    if (widget.length != 0) {
      totalWithDelivery = 200.0;
    }
    for (var s in widget.itemsList) {
      totalWithDelivery = totalWithDelivery + s.price;
    }
    totalWithQntDelivery = totalWithDelivery;
  }

  void calculateTotal() {
    totalWithDelivery = 0.0;
    for (var s in sum) {
      totalWithDelivery = totalWithDelivery + s;
    }
    totalWithDelivery = totalWithDelivery + totalWithQntDelivery;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return SafeArea(
      child: Container(
        color: colorAccentGreen,
        // height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(color: Colors.red),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
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
            Container(
              height: 68,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
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
    );
  }
}

class CartItemsCard extends StatefulWidget {
  Dishes model;
  int index;
  CartItemsCard({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  _CartItemsCardState createState() => _CartItemsCardState();
}

class _CartItemsCardState extends State<CartItemsCard> {
  int qnt = 1;
  double _itemPrice = 0.0;
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _itemPrice = widget.model.price;
    _totalPrice = _itemPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Slidable(
        key: UniqueKey(),
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.33,
        dismissal: SlidableDismissal(
          child: const SlidableDrawerDismissal(),
          onDismissed: (actionType) {
            items.removeWhere((element) {
              return element.name == widget.model.name;
            });
            // setState(() {
            // items.removeAt(widget.index);
            // });
            key.currentState!.setState(() {
              items.isNotEmpty
                  ? key.currentState!.totalWithDelivery =
                      key.currentState!.totalWithDelivery -
                          (key.currentState!.sum[widget.index] + _itemPrice)
                  : key.currentState!.totalWithDelivery = 00.0;
              // the problem is here !! -> the problem fixid
              print(items.length);
              print(widget.model.name);
              // dont forget to update the value of sum tab !
            });
          },
        ),
        child: Container(
          color: Colors.white,
          height: 80.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                flex: 5,
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
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(widget.model.image),
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
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: [
                          Container(
                              height: 32.0,
                              width: 58.0,
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
                                            key.currentState!.setState(() {
                                              key.currentState!
                                                      .sum[widget.index] =
                                                  _totalPrice - _itemPrice;
                                              key.currentState!
                                                  .calculateTotal();
                                            });
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
                                          });
                                          key.currentState!.setState(() {
                                            key.currentState!
                                                    .sum[widget.index] =
                                                _totalPrice - _itemPrice;
                                            key.currentState!.calculateTotal();
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
                          Flexible(
                            child: text('${_totalPrice}0DA',
                                textColor: colorAccentGreen,
                                fontSize: textSizeSMedium),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        secondaryActions: <Widget>[
          SlideAction(
            onTap: () async {},
            child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(04),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete, color: Colors.white),
                    const SizedBox(
                      width: 6,
                    ),
                    text(
                      'delete',
                      textColor: Colors.white,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
