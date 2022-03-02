import 'package:flutter/material.dart';
import 'package:pazar/classes/language.dart';
import 'package:pazar/localization/language_constants.dart';
import 'package:pazar/main.dart';
import 'package:pazar/model/user.dart';
import 'package:pazar/services/auth.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/widget.dart';
import 'package:pazar/utils/images.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static String tag = '/Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  int pnts = 0;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

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
                            user.email,
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
                          text(
                              // 'total points : 0',
                              getTranslated(context, 'total_points')! + '$pnts',
                              fontFamily: fontBold,
                              fontSize: 19.0,
                              textColor: Colors.grey[800],
                              textTitleCase: true),
                          text(
                            getTranslated(context, 'note'),
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
                                  child: text(getTranslated(context, 'rate_us'),
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
                          Material(
                            color: Colors.transparent,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const ShowBottomSheetLang();
                                    },
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.translate,
                                        color: colorAccentBlue,
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: 168,
                                        child: text(
                                            getTranslated(context, 'languages'),
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
                              ),
                              color: Colors.transparent,
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
                                  child: text(
                                      getTranslated(context, 'new_versions'),
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
                SizedBox(
                  height: 40,
                  width: 160,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      primary: Colors.red,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {
                      _auth.signOut();
                    },
                    child: text(getTranslated(context, 'logout'),
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

class ShowBottomSheetLang extends StatelessWidget {
  const ShowBottomSheetLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _changeLanguage(Language language) async {
      Locale newLocale = await setLocale(language.languageCode);
      Pazar.setLocale(context, newLocale);
    }

    return Container(
      height: 170,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Material(
                child: InkWell(
                  onTap: () {
                    _changeLanguage(Language(1, "English", "en"));
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.transparent,
                    // width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: SizedBox(
                              width: 70,
                              height: 35,
                              child: svgPicture2(ic_flag_us)),
                        ),
                        text(getTranslated(context, 'english'),
                            fontFamily: fontBold, fontSize: textSizeMLarge),
                      ],
                    ),
                  ),
                ),
                color: Colors.transparent,
              ),
            ),
            Expanded(
              flex: 1,
              child: Material(
                child: InkWell(
                  onTap: () {
                    _changeLanguage(Language(2, "FRANCAIS", "fr"));
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: SizedBox(
                          width: 70,
                          height: 35,
                          child: svgPicture2(
                            ic_flag_fr,
                          ),
                        ),
                      ),
                      text(getTranslated(context, 'french'),
                          fontFamily: fontBold, fontSize: textSizeMLarge),
                    ],
                  ),
                ),
                color: Colors.transparent,
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.03,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(getTranslated(context, 'cancel'),
                          textColor: Colors.white,
                          fontFamily: fontBold,
                          fontSize: textSizeMLarge)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
