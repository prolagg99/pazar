// ignore_for_file: must_be_immutable, avoid_print, import_of_legacy_library_into_null_safe, deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pazar/model/cart.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({Key? key}) : super(key: key);
  static String tag = '/ItemsCart';

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(0, 184),
        child: ItemsCartAppBar(),
      ),
      body: SizedBox(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Scrollbar(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return CartItemsCard(
                    item: cart.items[index],
                    index: index,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemsCartAppBar extends StatefulWidget {
  const ItemsCartAppBar({Key? key}) : super(key: key);

  @override
  _ItemsCartAppBarState createState() => _ItemsCartAppBarState();
}

class _ItemsCartAppBarState extends State<ItemsCartAppBar> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return SafeArea(
      child: Container(
        color: colorAccentGreen,
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
                          Consumer<CartModel>(
                              builder: (context, cart, child) => text(
                                  '${cart.totalPrice}0DA',
                                  fontFamily: fontBold,
                                  fontSize: textSizeMedium,
                                  textColor: Colors.white)),
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
  Item item;
  int index;
  CartItemsCard({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  _CartItemsCardState createState() => _CartItemsCardState();
}

class _CartItemsCardState extends State<CartItemsCard> {
  late int qnt = 1;
  double _itemPrice = 0.0;
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _itemPrice = widget.item.price; // never change
    _totalPrice = widget.item.totalPrice;
    qnt = widget.item.qnt;
  }

  @override
  Widget build(BuildContext context) {
    CartModel cartModel = Provider.of<CartModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Slidable(
        key: UniqueKey(),
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.33,
        dismissal: SlidableDismissal(
          child: const SlidableDrawerDismissal(),
          onDismissed: (actionType) {
            // maybe this cause a problem in the future
            cartModel.updateItemQnt(widget.index, 1, widget.item.price);
            cartModel.remove(widget.index);
            print(cartModel.items.length);
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
                                  image: AssetImage(widget.item.image),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                              child: text(widget.item.name,
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
                                        if (qnt > 1) {
                                          setState(() {
                                            qnt -= 1;
                                            _totalPrice =
                                                _totalPrice - _itemPrice;
                                          });
                                          cartModel.updateItemQnt(
                                              widget.index, qnt, _totalPrice);
                                        }
                                      },
                                      child: SizedBox(
                                          child: Center(child: text('-'))),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                        '${widget.item.qnt}',
                                        style: const TextStyle(
                                            fontSize: textSizeSMedium),
                                      ))),
                                  Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            qnt += 1;
                                            _totalPrice += _itemPrice;
                                          });
                                          cartModel.updateItemQnt(
                                              widget.index, qnt, _totalPrice);
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
                            child: text('${widget.item.totalPrice}0DA',
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
