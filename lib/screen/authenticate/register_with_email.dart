// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pazar/screen/loading.dart';
import 'package:pazar/services/auth.dart';
import 'package:pazar/utils/colors.dart';
import 'package:pazar/utils/constant.dart';
import 'package:pazar/utils/extension.dart';
import 'package:pazar/utils/images.dart';
import 'package:pazar/utils/widget.dart';

class RegisterWithEmail extends StatefulWidget {
  final Function toggleView;
  const RegisterWithEmail({Key? key, required this.toggleView})
      : super(key: key);

  @override
  _RegisterWithEmailState createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorAccentGreen);
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Container(
                            // color: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  height: 280,
                                  child: svgPicture2(img_auth),
                                ),
                                // const Image(image: AssetImage(img_register)),
                                const SizedBox(height: 12.0),
                                text(
                                  'welcome',
                                  isLongText: true,
                                  isCentered: true,
                                  fontSize: 32.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70.0),
                                  child: text(
                                    'before enjoying our services Please register first',
                                    isLongText: true,
                                    isCentered: true,
                                    fontFamily: fontLight,
                                    fontSize: textSizeSMedium,
                                    textColor: Colors.grey[600],
                                  ),
                                ),
                              ],
                            )),
                        Form(
                          key: _formKey,
                          child: Container(
                            // color: Colors.purple,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 50.0),
                            child: Column(
                              children: <Widget>[
                                // const SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter an email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: colorAccentGreen),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (val) => val!.length < 6
                                      ? 'Enter a password 6+ chars long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  obscureText: true,
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'password',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: colorAccentGreen),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                SizedBox(
                                  height: 40,
                                  width: 160,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.zero,
                                        primary: colorAccentGreen,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .registerWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              loading = false;
                                              error =
                                                  'Please supply a valid email';
                                            });
                                          }
                                        }
                                      },
                                      child: text(
                                        'register',
                                        fontFamily: fontBold,
                                        fontSize: textSizeSMedium,
                                        textColor: Colors.white,
                                      )),
                                ),
                                const SizedBox(height: 12.0),
                                Text(
                                  error,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 14.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60.0),
                                // width: 180,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      primary: colorAccentLightGreen,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    onPressed: () {
                                      _auth.signOut();
                                    },
                                    child: text(
                                      'are you delivery ?',
                                      fontFamily: fontBold,
                                      // fontSize: textSizeMedium,
                                      textColor: colorAccentGreen,
                                    )),
                              ),
                              const SizedBox(height: 12.0),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'you have already registered ? ',
                                      style: const TextStyle(
                                        fontFamily: fontLight,
                                        fontSize: textSizeSMedium,
                                        letterSpacing: 0.25,
                                        color: Colors.grey,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Sign in',
                                            style: const TextStyle(
                                              fontFamily: fontMeduim,
                                              fontSize: textSizeSMedium,
                                              letterSpacing: 0.25,
                                              color: colorAccentGreen,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                widget.toggleView();
                                                print('Login Text Clicked');
                                              }),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
