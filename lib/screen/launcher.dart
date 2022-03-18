import 'package:flutter/material.dart';
import 'package:pazar/screen/wrapper.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);
  static String tag = '/Launcher';

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  void loading() async {
    // await instance.getAllDocuments();
    await Future.delayed(const Duration(seconds: 3));
    launchScreen(context, Wrapper.tag);
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
      backgroundColor: colorAccentGreen,
      body: SafeArea(
          child: Container(
        color: colorAccentGreen,
        child: Center(
          child: Image.asset(
            ic_launcher,
            height: 260.0,
            width: 260.0,
          ),
        ),
      )),
    );
  }
}
