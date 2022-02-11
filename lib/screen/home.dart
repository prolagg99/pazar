import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/screen/restaurant_items.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/data_generation.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String tag = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  List<Restaurants> mRestaurants = [];
  List<Dishes> dishesListOnSearch = [];
  List<Dishes> _mDishes = [];
  List<Slides> mSlides = [];
  late Restaurants lastItem;

  @override
  void initState() {
    super.initState();
    mRestaurants = getRestaurantImages();
    lastItem = mRestaurants[mRestaurants.length - 1];
    _mDishes = getDishes();
    mSlides = getSlides();
  }

  // @override
  // void dispose() {
  //   _textEditingController.dispose();
  //   _textEditingController.removeListener(() {});
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: colorPrimary,
                automaticallyImplyLeading: false,
                expandedHeight: 110,
                elevation: 0,
                pinned: _textEditingController.text.isNotEmpty &&
                        dishesListOnSearch.isEmpty
                    ? true
                    : _textEditingController.text.isNotEmpty &&
                            dishesListOnSearch.length < 7
                        ? true
                        : false,
                snap: false,
                floating: false,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(54.0), // Add this code
                  child: Text(''), // Add this code
                ),
                flexibleSpace: Padding(
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
                                key: formKey,
                                cursorColor: colorAccentGreen,
                                controller: _textEditingController,
                                onChanged: (value) {
                                  setState(() {
                                    dishesListOnSearch = _mDishes
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
                                decoration: InputDecoration(
                                    suffixIcon: _textEditingController
                                            .text.isNotEmpty
                                        ? IconButton(
                                            onPressed: () {
                                              _textEditingController.clear();
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.clear,
                                                color: Colors.grey, size: 20),
                                          )
                                        : const SizedBox(),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                    fillColor: colorAccentGrey,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'search',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ];
          },
          body: _textEditingController.text.isNotEmpty &&
                  dishesListOnSearch.isEmpty
              ? itemNotFound(context)
              : _textEditingController.text.isNotEmpty &&
                      dishesListOnSearch.isNotEmpty
                  ? itemListView(dishesListOnSearch)
                  : ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: Scrollbar(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: carouselSliderContainer(mSlides),
                                ),
                                Flexible(
                                  child: homeTextCard(
                                      context,
                                      'today new available',
                                      'best of the today items list'),
                                ),
                                Flexible(
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      child: GestureDetector(
                                        onTap: () => launchScreen(
                                            context, RestaurantItems.tag),
                                        child: restaurantListView(
                                            mRestaurants, lastItem),
                                      )),
                                ),
                                Flexible(
                                  child: homeTextCard(context, 'all items',
                                      'all items with best items list'),
                                ),
                                Flexible(
                                  child:
                                      SizedBox(child: itemListView(_mDishes)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
