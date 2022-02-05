import 'package:flutter/material.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/images.dart';
import 'package:pazar/utils/widget.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);
  static String tag = '/ItemDetails';

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            expandedHeight: 100,
            pinned: false,
            snap: false,
            floating: true,
            flexibleSpace: appBar(context, 'item details'),
          ),
          SliverFillRemaining(
              child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.56,
                    child: itemDetailsCard(context)),
              ),
              Container(
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
                  ))
            ],
          ))
        ]),
      ),
    );
  }
}

Widget itemDetailsCard(context) {
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
                        'Tacos poulet L',
                        fontFamily: fontBold,
                        fontSize: textSizeLarge,
                      )),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(img_tacos)),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                )),
            // the last expanded --------------------------------------------------
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      // color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                text('Category:',
                                    textColor: Colors.grey[600],
                                    fontFamily: fontBold,
                                    fontSize: textSizeSMedium),
                                const SizedBox(width: 6),
                                text('Kababji',
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
                      // color: Colors.black,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
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
                                        text('delivery is available',
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
                                        // color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(06)),
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
                                                'the delivery can be free if you have enough points',
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
                      // color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            text('Price:',
                                textColor: colorAccentGreen,
                                fontFamily: fontBold,
                                fontSize: textSizeMLarge),
                            const SizedBox(width: 2),
                            text(
                              '450.00 DA',
                              textColor: colorAccentGreen,
                              fontFamily: fontBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ));
}
