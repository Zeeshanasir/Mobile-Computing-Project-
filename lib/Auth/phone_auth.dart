import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:macromasterai/Auth/otp_screen.dart';
// import 'package:macromasterai/Auth/otp_screen.dart';
import 'package:macromasterai/Constants/InputTextField.dart';
import 'package:macromasterai/Constants/bounce_button.dart';
import 'package:macromasterai/Constants/fade_in_animation.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  final otpVerification = TextEditingController(); 
  
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: widgetHeight(200)),
          child: Column(
            children: [
              Hero(
                  tag: 'MacroAi',
                  child: SizedBox(
                    height: widgetHeight(170),
                    width: widgetWidth(170),
                    child: Image.asset('images/macromsaster.png.png'),
                  )),
              SizedBox(
                height: widgetHeight(60),
              ),
              FadeInAnimation(
                delay: 1.2,
                child: MyTextField(
                  controller: otpVerification,
                  labelText: "Mobile Number",
                  obscureText: false,
                  iconTextField: const Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: widgetHeight(60),
              ),
              FadeInAnimation(
                delay: 1.4,
                child: BounceButton(
                    onTap: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted: (PhoneAuthCredential credential) {

                        },
                        verificationFailed: (FirebaseAuthException ex) {

                        },
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId,)));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {

                        },
                        phoneNumber: otpVerification.text.toString());
                    },
                    text: "Verify Phone Number",
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