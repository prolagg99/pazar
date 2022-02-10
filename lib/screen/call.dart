// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';

final key = GlobalKey<MyStatefulWidget1State>();

class Callback extends StatelessWidget {
  const Callback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MyStatefulWidget1(key: key),
            const MyStatefulWidget2(),
          ],
        ),
      ),
    );
  }
}

// the AppBar ---------------------------------------------------------
class MyStatefulWidget1 extends StatefulWidget {
  const MyStatefulWidget1({Key? key}) : super(key: key);
  @override
  State createState() => MyStatefulWidget1State();
}

class MyStatefulWidget1State extends State<MyStatefulWidget1> {
  String createdObject = "Hello world!";
  String get createdObjectFunc => createdObject;
  double totalPriceWithDelivery = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$totalPriceWithDelivery'),
    );
  }
}

// the item cart card -----------------------------------------------
class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({Key? key}) : super(key: key);

  @override
  State createState() => MyStatefulWidget2State();
}

class MyStatefulWidget2State extends State<MyStatefulWidget2> {
  String _text = 'PRESS ME';
  double total = 2000.00;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(_text),
        onPressed: () {
          setState(() {
            // use the value of parent
            print(key.currentState!.createdObject);
            _text = key.currentState!.createdObjectFunc;

            // update the value of variable in parent
            key.currentState!.setState(() {
              key.currentState!.totalPriceWithDelivery = total;
              print(key.currentState!.totalPriceWithDelivery);
            });
          });
        },
      ),
    );
  }
}
