import 'package:flutter/material.dart';
import 'package:pazar/screen/home.dart';

void main() async {
  runApp(Pazar());
}

class Pazar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => Home(),
        Home.tag: (context) => Home(),
      },
    );
  }
}
