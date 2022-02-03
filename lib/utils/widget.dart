// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

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

Widget restaurantCards(context, model, last) {
  return Padding(
    padding: model != last
        ? const EdgeInsets.only(right: 10)
        : const EdgeInsets.only(right: 0),
    child: Container(
      width: 132,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple[600],
          image: DecorationImage(
            image: AssetImage(model.image),
            fit: BoxFit.fill,
          )),
    ),
  );
}

Widget listCards(context, model) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
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
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(model.image),
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
                              Text(model.name,
                                  style: const TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: textSizeMedium,
                                  )),
                              // const SizedBox(height: 4),
                              Text(model.arabic,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontFamily: fontLight,
                                    fontSize: textSizeSMedium,
                                  )),
                              Text(model.price,
                                  style: const TextStyle(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
        )),
  );
}
