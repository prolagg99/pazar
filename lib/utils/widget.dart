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

Widget appBarTitle() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const Icon(
                Icons.shopping_basket_outlined,
                color: colorAccentGreen,
                size: 20.0,
              ),
              const SizedBox(width: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: text(
                    '0 pts', colorAccentGreen, fontRegular, textSizeMedium),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
              alignment: Alignment.center,
              child: text('ILii Ne', '', fontBold, textSizeSmall)),
        ),
        const Expanded(
          child: SizedBox(
            height: 35,
            width: 35,
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: colorAccentGreen,
                child: Text('IL'),
              ),
            ),
          ),
        ),
      ],
    ),
  );
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

ListView restaurantList(mRestaurants, lastItem) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mRestaurants.length,
      itemBuilder: (context, index) {
        return restaurantCards(context, mRestaurants[index], lastItem);
      });
}

ListView dishesList(mDishes) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mDishes.length,
      itemBuilder: (context, index) {
        return listCards(context, mDishes[index]);
      });
}

Widget textCard(context, title, subtitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(title, '', fontBold, textSizeMedium),
              const SizedBox(height: 4),
              text(subtitle, Colors.grey[600], fontLight, textSizeSMedium),
            ])),
  );
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
