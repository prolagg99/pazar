import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data.dart';
import 'package:pazar/utils/widget.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  static String tag = '/Test';

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  List<Restaurants> mRestaurants = [];
  late Restaurants lastItem;
  List<Dishes> mDishes = [];

  @override
  void initState() {
    super.initState();
    mRestaurants = getRestaurantImages();
    lastItem = mRestaurants[mRestaurants.length - 1];
    mDishes = getDishes();
    // _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
                height: _showAppbar ? 110 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(children: [
                      Expanded(
                        child: Padding(
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
                                      child: text('0 pts', colorAccentGreen,
                                          fontRegular, textSizeMedium),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: text('ILii Ne', '', fontBold,
                                        textSizeSmall)),
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
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                  cursorColor: colorAccentGreen,
                                  controller: _textEditingController,
                                  onChanged: (value) {
                                    setState(() {
                                      // glossarListOnSearch = glossarList
                                      //     .where((element) => element.name!
                                      //         .toLowerCase()
                                      //         .contains(value.toLowerCase()))
                                      //     .toList();
                                    });
                                  },
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontLight,
                                      color: Colors.grey,
                                      height: 1.8),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6))),
                                      fillColor: colorAccentGrey,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: 'search',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]))),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  controller: _scrollViewController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.14,
                            color: Colors.red,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      text('Today new Available', '', fontBold,
                                          textSizeMedium),
                                      const SizedBox(height: 4),
                                      text(
                                          'Best of the today items list',
                                          Colors.grey[600],
                                          fontLight,
                                          textSizeSMedium),
                                    ])),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: mRestaurants.length,
                                itemBuilder: (context, index) {
                                  return restaurantCards(
                                      context, mRestaurants[index], lastItem);
                                  // const SizedBox(height: 20),
                                }),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      text('All Items', Colors.black, fontBold,
                                          textSizeMedium),
                                      const SizedBox(height: 4),
                                      text(
                                          'All Items with best items list',
                                          Colors.grey[600],
                                          fontLight,
                                          textSizeSMedium),
                                    ])),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                              // height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  shrinkWrap: true,

                                  // scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: mDishes.length,
                                  itemBuilder: (context, index) {
                                    return listCards(context, mDishes[index]);
                                    // const SizedBox(height: 20),
                                  })),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
