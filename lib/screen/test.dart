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
  final ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  List<Restaurants> mListing = [];
  late Restaurants resturants;

  @override
  void initState() {
    super.initState();
    mListing = getRestaurantImages();
    resturants = mListing[0];
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
                                  // controller: _textEditingController,
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
                              // SizedBox(height: 2)
                            ],
                          ),
                        ),
                      )
                    ]))),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollViewController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //add your screen content here
                      Flexible(
                        // flex: 2,
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.30,
                          color: Colors.red,
                        ),
                      ),
                      Flexible(
                        // flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.19,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        // flex: 3,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.44,
                          // color: Colors.blue,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mListing.length,
                              itemBuilder: (context, index) {
                                return restaurantCards(context, resturants);
                                // const SizedBox(height: 20),
                              }
                              // children: <Widget>[

                              //   const SizedBox(width: 10),
                              //   Container(
                              //     width: 132,
                              //     color: Colors.purple[500],
                              //     child: const Center(
                              //         child: Text(
                              //       'Item 2',
                              //       style: TextStyle(
                              //           fontSize: 18, color: Colors.white),
                              //     )),
                              //   ),
                              //   const SizedBox(width: 10),
                              //   Container(
                              //     width: 132,
                              //     color: Colors.purple[400],
                              //     child: const Center(
                              //         child: Text(
                              //       'Item 3',
                              //       style: TextStyle(
                              //           fontSize: 18, color: Colors.white),
                              //     )),
                              //   ),
                              //   const SizedBox(width: 10),
                              //   Container(
                              //     width: 132,
                              //     color: Colors.purple[300],
                              //     child: const Center(
                              //         child: Text(
                              //       'Item 4',
                              //       style: TextStyle(
                              //           fontSize: 18, color: Colors.white),
                              //     )),
                              //   ),
                              // ],
                              ),
                        ),
                      ),
                      Flexible(
                        // flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.19,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      listCards(context),
                      const SizedBox(height: 20),
                      listCards(context),

                      const SizedBox(height: 20),
                      listCards(context),

                      const SizedBox(height: 20),
                      listCards(context), listCards(context),

                      const SizedBox(height: 20),
                      listCards(context),
                      listCards(context), listCards(context),
                      listCards(context),
                      listCards(context), listCards(context),
                      listCards(context),
                      listCards(context), listCards(context),
                      listCards(context),
                      listCards(context), listCards(context),
                      listCards(context),
                    ],
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
