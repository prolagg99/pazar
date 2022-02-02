import 'package:flutter/material.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/test.dart';

void main() async {
  runApp(const Pazar());
}

class Pazar extends StatelessWidget {
  const Pazar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => const Test(),
        Home.tag: (context) => const Home(),
        Test.tag: (context) => const Test(),
      },
    );
  }
}
