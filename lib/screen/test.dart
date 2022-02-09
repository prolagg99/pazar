import 'package:flutter/material.dart';
import 'package:pazar/model/model.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/data_generation.dart';
import 'package:pazar/utils/widget.dart';

class TestW extends StatefulWidget {
  const TestW({Key? key}) : super(key: key);

  @override
  _TestWState createState() => _TestWState();
}

class _TestWState extends State<TestW> {
  late List<Dishes> _items;

  @override
  void initState() {
    super.initState();
    _items = getDishes();
    // _totalPrice = price;
    // totalWithDelivery = _totalPrice + 200.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text('Hey'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 18,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Text('Some text'),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
