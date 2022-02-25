import 'package:flutter/material.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/extension.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  static String tag = '/Loading';

  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  GetItemsClass instance = GetItemsClass();

  void loading() async {
    await instance.getCategories();
    await instance.getItems();
    launchScreen(context, BottomNavigation.tag);
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorPrimary);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
          child: Container(
        color: colorPrimary,
        child: const Center(
          child: SpinKitChasingDots(
            color: colorAccentGreen,
            size: 50.0,
          ),
        ),
      )),
    );
  }
}
