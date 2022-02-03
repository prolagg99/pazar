import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data.dart';
import 'package:pazar/utils/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String tag = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  List<Restaurants> mRestaurants = [];
  List<Dishes> dishesListOnSearch = [];
  List<Dishes> mDishes = [];
  List<Slides> mSlides = [];
  late Restaurants lastItem;

  @override
  void initState() {
    super.initState();
    mRestaurants = getRestaurantImages();
    lastItem = mRestaurants[mRestaurants.length - 1];
    mDishes = getDishes();
    mSlides = getSlides();

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
                      child: appBarTitle(),
                    ),
                    Expanded(
                      // to avoid over flow in the bottom
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 308,
                              child: TextField(
                                cursorColor: colorAccentGreen,
                                controller: _textEditingController,
                                onChanged: (value) {
                                  setState(() {
                                    dishesListOnSearch = mDishes
                                        .where((element) => element.name!
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                        .toList();
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
                            )
                          ],
                        ),
                      ),
                    )
                  ])),
            ),
            _textEditingController.text.isNotEmpty && dishesListOnSearch.isEmpty
                ? Column(
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Text(
                            'No results',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 22,
                                color: Color(0xff848484)),
                          ),
                        ),
                      )
                    ],
                  )
                : _textEditingController.text.isNotEmpty &&
                        dishesListOnSearch.isNotEmpty
                    ? dishesList(dishesListOnSearch)
                    : Expanded(
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: SingleChildScrollView(
                            controller: _scrollViewController,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: carouselSliderContainer(mSlides),
                                  ),
                                  Flexible(
                                    child: textCard(
                                        context,
                                        'Today new Available',
                                        'Best of the today items list'),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.20,
                                        child: restaurantList(
                                            mRestaurants, lastItem)),
                                  ),
                                  Flexible(
                                    child: textCard(context, 'All Items',
                                        'All Items with best items list'),
                                  ),
                                  Flexible(
                                    child: SizedBox(child: dishesList(mDishes)),
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
