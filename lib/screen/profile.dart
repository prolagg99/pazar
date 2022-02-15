import 'package:flutter/material.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static String tag = '/Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 72,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorAccentBlue,
                        ),
                        child: const Icon(Icons.person, color: Colors.white),
                        alignment: Alignment.center,
                      ),
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
            Column(
              children: [
                const SizedBox(height: 18),
                Container(
                  height: 72,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text('total points : 0',
                              fontFamily: fontBold,
                              fontSize: 19.0,
                              textColor: Colors.grey[800],
                              textTitleCase: true),
                          text(
                            'note: every point grant you 1 free of charge delivery',
                            fontFamily: fontBold,
                            fontSize: 10.0,
                            textColor: colorAccentGreen,
                            isLongText: true,
                            isCentered: true,
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: colorAccentBlue,
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 168,
                                  child: text('rate us',
                                      fontFamily: fontBold,
                                      textColor: Colors.grey[800],
                                      textTitleCase: true),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: colorAccentBlue,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.translate,
                                  color: colorAccentBlue,
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 168,
                                  child: text('languages',
                                      fontFamily: fontBold,
                                      textColor: Colors.grey[800],
                                      textTitleCase: true),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: colorAccentBlue,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 22,
                                  width: 22,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorAccentBlue,
                                  ),
                                  child: const Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      size: 18,
                                      color: Colors.white),
                                  alignment: Alignment.center,
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 168,
                                  child: text('new version',
                                      fontFamily: fontBold,
                                      textColor: Colors.grey[800],
                                      textTitleCase: true),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: colorAccentBlue,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 26),
                Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: text('logout',
                        fontFamily: fontBold,
                        fontSize: textSizeSMedium,
                        textColor: Colors.white),
                  ),
                ),
              ],
            ),
            Container(height: MediaQuery.of(context).size.width * 0.38),
          ],
        ),
      )),
    );
  }
}
