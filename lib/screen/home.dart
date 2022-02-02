import 'package:flutter/material.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';
// import 'package:stack_demo/models/FruitModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String tag = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();

  // List<FruitModel> glossarListOnSearch = [];
  // List<FruitModel> glossarList = [];

  @override
  void initState() {
    // glossarList.add(FruitModel(id: 0, name: 'Apple', facts: 'Good for health'));
    // glossarList.add(
    //     FruitModel(id: 1, name: 'Banana', facts: 'Banana is also for health'));
    // glossarList.add(
    //     FruitModel(id: 2, name: 'Orange', facts: 'Orange good for health'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: SafeArea(
              child: Container(
                  color: colorPrimary,
                  // color: Colors.blue,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.shopping_basket_outlined,
                                        color: colorAccentGreen,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('0 pts',
                                            style: TextStyle(
                                              color: colorAccentGreen,
                                              fontFamily: fontRegular,
                                              fontSize: textSizeMedium,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('ILii Ne',
                                          style: TextStyle(
                                            fontFamily: fontBold,
                                            fontSize: textSizeSmall,
                                          ))),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    // color: Colors.green,
                                    height: 35,
                                    width: 35,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: CircleAvatar(
                                        // backgroundImage: ,
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
                                      // border: InputBorder.none,
                                      hintText: 'search',
                                      hintStyle: TextStyle(color: Colors.grey)
                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      ),
                                ),
                              ),
                              // SizedBox(height: 2)
                            ],
                          ),
                        )
                      ]))))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  // color: Colors.black,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Text('Today new Available',
                        style: TextStyle(
                          fontFamily: fontBold,
                          fontSize: textSizeMedium,
                        )),
                    const SizedBox(height: 4),
                    Text('Best of the today items list',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: fontLight,
                          fontSize: textSizeSMedium,
                        )),
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
                  // color: Colors.green,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Text('All Items',
                        style: TextStyle(
                          fontFamily: fontBold,
                          fontSize: textSizeMedium,
                        )),
                    const SizedBox(height: 4),
                    Text('All Items with best items list',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: fontLight,
                          fontSize: textSizeSMedium,
                        )),
                  ])),
            ),
          ),
          const SizedBox(height: 5),
          // for the list cards ! ----------------------
          Expanded(
            flex: 4,
            child: SizedBox(
                // color: Colors.grey,
                child: Column(
              children: [
                Container(
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
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(img_tacos),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Tacos poulet L',
                                              style: TextStyle(
                                                fontFamily: fontBold,
                                                fontSize: textSizeMedium,
                                              )),
                                          // const SizedBox(height: 4),
                                          Text('L طاكوس دجاج',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontFamily: fontLight,
                                                fontSize: textSizeSMedium,
                                              )),
                                          const Text('450.00 DA',
                                              style: TextStyle(
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
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Container(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                          color: colorAccentGreen,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
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
                const SizedBox(height: 20),
              ],
            )),
          ),
        ]),
      ),
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
