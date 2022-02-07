// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data_generation.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';

class ItemDetails extends StatefulWidget {
  // const ItemDetails({Key? key}) : super(key: key);
  static String tag = '/ItemDetails';

  final Dishes model;
  const ItemDetails(this.model);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
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
            InkWell(
              onTap: () {
                setState(() {
                  setItems(widget.model);
                });
                // launchScreen(context, '/ItemsCart');
              },
              child: Container(
                  height: 55,
                  width: 220,
                  decoration: BoxDecoration(
                    color: colorAccentGreen,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Align(
                    child: text(
                      'Add To Cart',
                      textColor: Colors.white,
                      fontSize: textSizeMLarge,
                    ),
                  )),
            )
          ],
        ));
  }
}
