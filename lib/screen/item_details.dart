// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:pazar/localization/language_constants.dart';
import 'package:pazar/model/cart.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  static String tag = '/ItemDetails';

  final Item model;
  const ItemDetails(this.model);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);

    Item item = widget.model;
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(item),
    );

    return Scaffold(
        backgroundColor: colorPrimary,
        appBar: appBar(context, 'item details'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.56,
                  child: itemDetailsCard(context, widget.model)),
            ),
            GestureDetector(
              onTap: isInCart
                  ? () {
                      null;
                      print(isInCart);
                    }
                  : () {
                      print(isInCart);
                      var cart = context.read<CartModel>();
                      cart.addItem(item);
                      print(cart.items.length);
                      back(context);
                    },
              child: Container(
                  height: 55,
                  width: 220,
                  decoration: BoxDecoration(
                    color: isInCart ? colorAccentGreyBtn : colorAccentGreen,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Align(
                    child: text(
                      getTranslated(context, 'add_to_cart'),
                      textColor: Colors.white,
                      fontSize: textSizeMLarge,
                    ),
                  )),
            )
          ],
        ));
  }
}
