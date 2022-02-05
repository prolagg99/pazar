// ignore_for_file: use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:pazar/screen/item_details.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

SvgPicture svgPicture(icon, color, size) {
  return SvgPicture.asset(
    icon,
    height: size,
    width: size,
    color: color,
  );
}

AppBar appBar(context, title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: colorPrimary,
    elevation: 0,
    toolbarHeight: 95,
    leading: GestureDetector(
      onTap: () => back(context),
      child: Container(
        padding: const EdgeInsets.only(left: 22),
        child: const Icon(Icons.arrow_back, size: 30),
      ),
    ),
    flexibleSpace: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: colorAccentGreen,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(title, textColor: Colors.white, fontSize: 22.0),
          ],
        ),
      ),
    ),
  );
}

Widget appBarTitle() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Image.asset(
                ic_money,
                height: 22,
                width: 22,
              ),
              const SizedBox(width: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: text('0 pts', textColor: colorAccentGreen),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
              alignment: Alignment.center,
              child: text('ILii Ne',
                  fontFamily: fontBold, fontSize: textSizeSmall)),
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

Widget text(text,
    {var fontFamily = fontRegular,
    var fontSize = textSizeMedium,
    textColor = Colors.black,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var isCentered = false,
    var maxLine = 1,
    var isLongText = false}) {
  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor,
          letterSpacing: latterSpacing
          // height: 1.5,
          ));
}

Widget carouselSliderContainer(mSlides) {
  return CarouselSlider.builder(
    itemCount: mSlides.length,
    options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      aspectRatio: 3.2,
      // enlargeCenterPage: true,
    ),
    itemBuilder: (context, index, realIdx) {
      return slideContainer(context, mSlides[index]);
    },
  );
}

Widget slideContainer(context, model) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        model.image,
        // height: 20,
        fit: BoxFit.cover,
      ),
    ),
  );
}

ListView restaurantList(mRestaurants, lastItem) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mRestaurants.length,
      itemBuilder: (context, index) {
        return restaurantCard(context, mRestaurants[index], lastItem);
      });
}

ListView dishesList(mDishes) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mDishes.length,
      itemBuilder: (context, index) {
        return itemCard(context, mDishes[index]);
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
              text(title, fontFamily: fontBold),
              const SizedBox(height: 4),
              text(subtitle,
                  textColor: Colors.grey[600],
                  fontFamily: fontLight,
                  fontSize: textSizeSMedium),
            ])),
  );
}

Widget restaurantCard(context, model, last) {
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

Widget itemCard(context, model) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: GestureDetector(
      onTap: () => launchScreen(context, ItemDetails.tag),
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
                                text(
                                  model.name,
                                  fontFamily: fontBold,
                                ),
                                // const SizedBox(height: 4),
                                text(
                                  model.arabic,
                                  fontFamily: fontLight,
                                  fontSize: textSizeSMedium,
                                ),
                                text(
                                  model.price,
                                  textColor: colorAccentGreen,
                                  fontFamily: fontRegular,
                                  fontSize: textSizeSMedium,
                                ),
                              ]),
                        ))),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: GestureDetector(
                              onTap: () => launchScreen(context, ItemsCart.tag),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: colorAccentGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Center(
                                  child: text(
                                    'Add to cart',
                                    textColor: Colors.white,
                                    fontSize: textSizeSmall,
                                    isCentered: true,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    )),
              ],
            ),
          )),
    ),
  );
}

Widget itemNotFound(context) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ic_alert,
          ),
          // svgPicture(ic_alert_triangle, Colors.grey, 32.0),
          const SizedBox(height: 6),
          text(
            'No item found ...',
            fontFamily: fontLight,
            fontSize: textSizeMLarge,
          ),
        ],
      ));
}
