import 'package:flutter/material.dart';
import 'package:pazar/utils/widget.dart';

class TestW extends StatefulWidget {
  const TestW({Key? key}) : super(key: key);

  @override
  _TestWState createState() => _TestWState();
}

class _TestWState extends State<TestW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: <Widget>[
                const Text('Hey'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 18,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 50.0),
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
