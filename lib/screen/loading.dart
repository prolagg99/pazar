import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pazar/utils/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: const Center(
        child: SpinKitCircle(
          color: colorAccentGreen,
          size: 32.0,
          // lineWidth: 0.1,
        ),
      ),
    );
  }
}
