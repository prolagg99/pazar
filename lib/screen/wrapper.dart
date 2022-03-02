// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:pazar/model/user.dart';
import 'package:pazar/screen/authenticate/authenticate.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const BottomNavigation();
    }
  }
}
