// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazar/localization/language_constants.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/screen/loading.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/utils/widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String tag = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  List<Item> dishesListOnSearch = [];
  List<Slides> mSlides = [];

  late Categories lastItem;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    mSlides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Categories>>(context);
    final items = Provider.of<List<Item>>(context);

    bool rebuild = false;

    Widget checker(bool r) {
      if (categories.isEmpty && items.isEmpty) {
        return const Loading();
      } else {
        lastItem = categories[categories.length - 1];
        if (rebuild == false) {
          setState(() {
            rebuild = true;
          });
          rebuild = true;
          return checker(rebuild);
        } else {
          return Scaffold(
            backgroundColor: colorPrimary,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
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
                                          dishesListOnSearch = items
                                              .where((element) => element.name
                                                  .toLowerCase()
                                                  .contains(
                                                      value.toLowerCase()))
                                              .toList();
                                        });
                                      },
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontLight,
                                          color: Colors.grey,
                                          height: 1.8),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          suffixIcon: _textEditingController
                                                  .text.isNotEmpty
                                              ? IconButton(
                                                  onPressed: () {
                                                    _textEditingController
                                                        .clear();
                                                    setState(() {});
                                                  },
                                                  icon: const Icon(Icons.clear,
                                                      color: Colors.grey,
                                                      size: 20),
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
                                          hintText:
                                              getTranslated(context, 'search'),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey)),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: carouselSliderContainer(mSlides),
                                      ),
                                      Flexible(
                                        child: homeTextCard(
                                          context,
                                          getTranslated(
                                              context, 'today_available_title'),
                                          getTranslated(context,
                                              'today_available_subtitle'),
                                        ),
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.20,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: categories.length,
                                                itemBuilder: (context, index) {
                                                  return RestaurantCard(
                                                      category:
                                                          categories[index],
                                                      last: lastItem,
                                                      itemsList: items);
                                                })),
                                      ),
                                      Flexible(
                                        child: homeTextCard(
                                          context,
                                          getTranslated(context, 'all_items'),
                                          getTranslated(
                                              context, 'all_items_subtitle'),
                                        ),
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: items.length,
                                              itemBuilder: (context, index) {
                                                return ItemCard(items[index]);
                                              }),
                                        ),
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
    }

    return checker(rebuild);
  }
}
