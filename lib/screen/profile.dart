import 'package:flutter/material.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text('ILii Ne',
                            fontFamily: fontBold, fontSize: textSizeSMedium),
                        text(
                          'pro.lagg99@gmail.com',
                          fontFamily: fontLight,
                          fontSize: textSizeSmall,
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Container(
            height: 78,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('total points : 0',
                        fontFamily: fontBold,
                        fontSize: textSizeNormal,
                        textColor: Colors.grey[800],
                        textTitleCase: true),
                    text(
                      'note: every point grant you 1 free of charge delivery',
                      fontFamily: fontBold,
                      fontSize: textSizeXSmall,
                      textColor: colorAccentGreen,
                      isLongText: true,
                      isCentered: true,
                    ),
                  ],
                )),
          ),
          Container(
            color: Colors.red,
            height: 78,
          ),
          Container(
            color: Colors.red,
            height: 78,
          ),
          Container(
            color: Colors.red,
            height: 78,
          ),
        ],
      )),
    );
  }
}
