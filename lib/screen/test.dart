import 'package:flutter/material.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
// import 'package:stack_demo/models/FruitModel.dart';

class SearchBarTest extends StatefulWidget {
  @override
  _SearchBarTestState createState() => _SearchBarTestState();
}

class _SearchBarTestState extends State<SearchBarTest> {
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
    return Scaffold(
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
                                            fontSize: 13,
                                            fontFamily: fontBold,
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
                            children: const [
                              SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                  // controller: _textEditingController,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 13),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
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
                        // Container(
                        //   height: 30,
                        //   width: 280,
                        //   color: Colors.red,
                        //   // decoration: BoxDecoration(
                        //   //   gradient: const LinearGradient(
                        //   //       colors: [Colors.white60, Colors.white70],
                        //   //       begin: Alignment.topCenter,
                        //   //       end: Alignment.bottomCenter),
                        //   //   borderRadius: BorderRadius.circular(8),
                        //   // ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        //     child: TextField(
                        //       // textAlign: TextAlign.left,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           // glossarListOnSearch = glossarList
                        //           //     .where((element) => element.name!
                        //           //         .toLowerCase()
                        //           //         .contains(value.toLowerCase()))
                        //           //     .toList();
                        //         });
                        //       },
                        //       controller: _textEditingController,
                        //       decoration: const InputDecoration(
                        //           contentPadding: EdgeInsets.zero,
                        //           border: InputBorder.none,
                        //           errorBorder: InputBorder.none,
                        //           enabledBorder: InputBorder.none,
                        //           // contentPadding: EdgeInsets.all(0),
                        //           hintText: 'Search'),
                        //     ),
                        //   ),
                        // ),
                      ]))))),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffFEFDFD), Color(0xffBDBDB2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child:
              // _textEditingController.text.isNotEmpty &&
              //         glossarListOnSearch.isEmpty
              //     ?
              Column(
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
          // : ListView.builder(
          //     itemCount: 3,
          //     // _textEditingController.text.isNotEmpty
          //     //     ? glossarListOnSearch.length
          //     //     : glossarList.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           // _textEditingController.text.isNotEmpty
          //           // ? _testFuction(context, glossarListOnSearch[index])
          //           // : _testFuction(context, glossarList[index]);
          //         },
          //         child: const Padding(
          //           padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
          //           child: Text(
          //             '',
          //             // _textEditingController.text.isNotEmpty
          //             //     ? glossarListOnSearch[index].name!
          //             //     : glossarList[index].name!,
          //             style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize: 20,
          //                 fontFamily: 'Avenir'),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
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
