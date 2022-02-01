import 'package:flutter/material.dart';
import 'package:pazar/screen/test.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String tag = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SearchBarTest());
  }
}
