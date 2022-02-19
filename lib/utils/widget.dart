// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:pazar/localization/language_constants.dart';
import 'package:pazar/model/cart.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/screen/item_details.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';
import 'package:provider/provider.dart';

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

SvgPicture svgPicture2(icon) {
  return SvgPicture.asset(icon, fit: BoxFit.scaleDown);
}

Widget text(text,
    {var fontFamily = fontRegular,
    var fontSize = textSizeMedium,
    textColor = Colors.black,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var textTitleCase = false,
    var isCentered = false,
    var maxLine = 1,
    var isLongText = false}) {
  return Text(
      textAllCaps
          ? text.toUpperCase()
          : textTitleCase
              ? toTitleCase(text)
              : toCapitalized(text),
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

AppBar appBar(context, title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: colorPrimary,
    elevation: 0,
    toolbarHeight: 96,
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
            text(title, textColor: Colors.white, fontSize: textSizeLarge),
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
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget homeTextCard(context, title, subtitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(title, fontFamily: fontBold, textTitleCase: true),
              const SizedBox(height: 4),
              text(subtitle,
                  textColor: Colors.grey[600],
                  fontFamily: fontLight,
                  fontSize: textSizeSMedium),
            ])),
  );
}

ListView restaurantListView(mRestaurants, lastItem) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mRestaurants.length,
      itemBuilder: (context, index) {
        return restaurantCard(context, mRestaurants[index], lastItem);
      });
}

ListView itemListView(mDishes) {
  return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mDishes.length,
      itemBuilder: (context, index) {
        return ItemCard(mDishes[index]);
      });
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

class ItemCard extends StatefulWidget {
  final Item model;
  const ItemCard(this.model);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(widget.model),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetails(widget.model)));
        },
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
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage(widget.model.image),
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
                                    widget.model.name,
                                    fontFamily: fontBold,
                                  ),
                                  text(
                                    widget.model.nameArab,
                                    fontFamily: fontLight,
                                    fontSize: textSizeSMedium,
                                  ),
                                  text(
                                    '${widget.model.price} DA',
                                    textColor: colorAccentGreen,
                                    fontFamily: fontBold,
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
                              child: SizedBox(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    splashFactory: isInCart
                                        ? NoSplash.splashFactory
                                        : null,
                                    shadowColor:
                                        isInCart ? Colors.transparent : null,
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    primary: isInCart
                                        ? colorAccentGreyBtn
                                        : colorAccentGreen,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                  ),
                                  onPressed: isInCart
                                      ? () {
                                          null;
                                          print(isInCart);
                                        }
                                      : () {
                                          print(isInCart);
                                          var cart = context.read<CartModel>();
                                          cart.addItem(widget.model);
                                        },
                                  child: ButtonTheme(
                                    child: text(
                                      getTranslated(context, 'add_to_cart'),
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
}

Widget itemNotFound(context) {
  return SingleChildScrollView(
      child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 150.0),
    child: Column(
      children: [
        const Icon(Icons.warning_amber_rounded,
            size: 44, color: colorAccentGreyBtn),
        const SizedBox(height: 6),
        text(
          getTranslated(context, 'no_item_found'),
          fontFamily: fontLight,
          fontSize: textSizeMLarge,
        ),
      ],
    ),
  ));
}

Widget itemDetailsCard(context, model) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        model.name,
                        fontFamily: fontBold,
                        fontSize: textSizeLarge,
                      )),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(model.image)),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                )),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              text(getTranslated(context, 'category'),
                                  textColor: Colors.grey[600],
                                  fontFamily: fontBold,
                                  fontSize: textSizeSMedium),
                              const SizedBox(width: 6),
                              text(model.category,
                                  fontFamily: fontBold,
                                  fontSize: textSizeSMedium),
                              const SizedBox(width: 6),
                              text('كبابجي', fontSize: textSizeSMedium),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.watch_later,
                                      color: colorAccentGreen),
                                  const SizedBox(width: 4),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(
                                          getTranslated(
                                              context, 'delivery_is_available'),
                                          textColor: Colors.grey[600],
                                          fontFamily: fontBold,
                                          fontSize: textSizeSmall,
                                          latterSpacing: 0.0),
                                      const SizedBox(height: 2),
                                      text('09:00-22:00',
                                          fontSize: textSizeSMedium),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.orangeAccent,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(06)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Row(
                                      children: [
                                        svgPicture(ic_alert_circle,
                                            Colors.orangeAccent, 24.0),
                                        const SizedBox(width: 4),
                                        Flexible(
                                          child: text(
                                              getTranslated(
                                                  context, 'item_details_note'),
                                              fontSize: textSizeXSmall,
                                              latterSpacing: 0.0,
                                              isLongText: true),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          text(getTranslated(context, 'price'),
                              textColor: colorAccentGreen,
                              fontFamily: fontBold,
                              fontSize: textSizeMLarge),
                          const SizedBox(width: 2),
                          text(
                            '${model.price} DA',
                            textColor: colorAccentGreen,
                            fontFamily: fontBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}
