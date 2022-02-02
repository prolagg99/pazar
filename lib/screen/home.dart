import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';
// import 'package:stack_demo/models/FruitModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String tag = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollViewController = ScrollController();
  bool showAppbar = true;
  bool isScrollingDown = false;

  // List<FruitModel> glossarListOnSearch = [];
  // List<FruitModel> glossarList = [];

  @override
  void initState() {
    _scrollViewController.addListener(() {
      super.initState();

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
          setState(() {});
        }
      }

      // glossarList.add(FruitModel(id: 0, name: 'Apple', facts: 'Good for health'));
      // glossarList.add(
      //     FruitModel(id: 1, name: 'Banana', facts: 'Banana is also for health'));
      // glossarList.add(
      //     FruitModel(id: 2, name: 'Orange', facts: 'Orange good for health'));
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
    changeStatusColor(colorAccentGreen);
    return Scaffold(
        backgroundColor: colorPrimary,
        body: SafeArea(
            child: Expanded(
          child: Column(children: [
            AnimatedContainer(
                height: showAppbar ? 110 : 0,
                duration: const Duration(milliseconds: 200),
                color: colorPrimary,
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
                            // SizedBox(height: 2)
                          ],
                        ),
                      )
                    ]))),
            const BodyHome(),
          ]),
        ))
        // body: SingleChildScrollView(
        //   controller: _scrollViewController,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //     child:
        //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       Expanded(
        //         flex: 2,
        //         child: Container(
        //           color: Colors.red,
        //         ),
        //       ), // for the automaticlly scrolling cards
        //       const SizedBox(height: 5),
        //       Expanded(
        //         flex: 1,
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: SizedBox(
        //               child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                 text('Today new Available', '', fontBold, textSizeMedium),
        //                 const SizedBox(height: 4),
        //                 text('Best of the today items list', Colors.grey[600],
        //                     fontLight, textSizeSMedium),
        //               ])),
        //         ),
        //       ),
        //       const SizedBox(height: 5),
        //       Expanded(
        //         flex: 3,
        //         child: Container(
        //           color: Colors.blue,
        //         ),
        //       ), // for the maniually scrolling cards
        //       const SizedBox(height: 5),
        //       Expanded(
        //         flex: 1,
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: SizedBox(
        //               child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                 text('All Items', Colors.black, fontBold, textSizeMedium),
        //                 const SizedBox(height: 4),
        //                 text('All Items with best items list', Colors.grey[600],
        //                     fontLight, textSizeSMedium),
        //               ])),
        //         ),
        //       ),
        //       const SizedBox(height: 5),
        //       // for the list cards ! ----------------------
        //       Expanded(
        //         flex: 4,
        //         child: SizedBox(
        //             child: Column(
        //           children: [
        //             listCards(context),
        //             const SizedBox(height: 20),
        //             listCards(context),
        //           ],
        //         )),
        //       ),
        //     ]),
        //   ),
        // ),
        );
  }
}

// void _testFuction(context, FruitModel model) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext bc) {
//       return Scaffold(
//         body: Text('${model.facts}'),
//       );
//     },
//   );
// }

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              ),
            ), // for the automaticlly scrolling cards
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      text('Today new Available', '', fontBold, textSizeMedium),
                      const SizedBox(height: 4),
                      text('Best of the today items list', Colors.grey[600],
                          fontLight, textSizeSMedium),
                    ])),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
              ),
            ), // for the maniually scrolling cards
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      text('All Items', Colors.black, fontBold, textSizeMedium),
                      const SizedBox(height: 4),
                      text('All Items with best items list', Colors.grey[600],
                          fontLight, textSizeSMedium),
                    ])),
              ),
            ),
            const SizedBox(height: 5),
            // for the list cards ! ----------------------
            Expanded(
              flex: 4,
              child: SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, indx) {
                        return listCards(context);
                        // const SizedBox(height: 20),
                      }
                      // children: [
                      //   listCards(context),
                      //   const SizedBox(height: 20),
                      //   listCards(context),
                      //   const SizedBox(height: 20),
                      //   listCards(context),
                      // ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
