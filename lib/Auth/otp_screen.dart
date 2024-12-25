import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:macromasterai/CommonScreen.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/InputTextField.dart';
import 'package:macromasterai/Constants/bounce_button.dart';
import 'package:macromasterai/Constants/fade_in_animation.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final verify = TextEditingController();
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
          child: Column(
            children: [
              FadeInAnimation(
                delay: 1.2,
                child: Row(
                  children: [
                    const PoppinsTextStyle(
                        text: "Enter the",
                        textSize: 22,
                        textColor: Colors.black,
                        isBold: false),
                    SizedBox(
                      width: widgetWidth(10),
                    ),
                    const PoppinsTextStyle(
                        text: "Otp",
                        textSize: 30,
                        textColor: Colors.black,
                        isBold: true),
                    SizedBox(
                      width: widgetWidth(10),
                    ),
                    SizedBox(
                      width: widgetWidth(1),
                    ),
                    const PoppinsTextStyle(
                        text: "!",
                        textSize: 22,
                        textColor: Colors.black,
                        isBold: false),
                  ],
                ),
              ),
              SizedBox(
                height: widgetHeight(50),
              ),
              FadeInAnimation(
                delay: 1.4,
                child: MyTextField(
                  controller: verify,
                  labelText: "otp",
                  obscureText: false,
                  iconTextField: const Icon(Icons.message_outlined),
                ),
              ),
              SizedBox(
                height: widgetHeight(60),
              ),
              FadeInAnimation(
                delay: 1.4,
                child: BounceButton(
                    onTap: () async {
                      try {
                        PhoneAuthCredential credential =
                            await PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode: verify.text.toString());
                        FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CommonScreenSelector()),
                                ));
                      } catch (ex) {
                        log(ex.toString() as num);
                      }
                    },
                    text: "Verify OTP",
                    wHeight: widgetHeight(70),
                    wWidth: widgetWidth(210),
                    containerColor: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
