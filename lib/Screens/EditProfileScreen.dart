import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:macromasterai/Auth/LoginScreen.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/bounce_button.dart';
import 'package:macromasterai/Constants/fade_in_animation.dart';
import 'package:macromasterai/Constants/info_container.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:macromasterai/Screens/UserProfileDetails.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? name;
  String? email;
  String? city;
  String? mobileNumber;
  String? age;
  String? password;

  final editNameController = TextEditingController();
  final editEmailController = TextEditingController();
  final editPasswordController = TextEditingController();
  final editMobileNumberController = TextEditingController();

  void signoutTheUser() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginPage()), // Replace with your login screen widget
    );
  }

  fetch() async {
    User? userInfo = FirebaseAuth.instance.currentUser;
    if (userInfo != null) {
      try {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userInfo.uid)
            .get();
        Map<String, dynamic>? data = userData.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            email = data["Email"];
            name = data["Name"];
            age = data["Age"];
            mobileNumber = data["PhoneNumber"];
            city = data["City"];
            password = data["Password"];
          });
        }
      } catch (e) {
        //
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const UserInfoDetails()), // Replace with your login screen widget
              );
            },
            icon: const Icon(Icons.arrow_back)),
        title: const PoppinsTextStyle(
            text: 'Edit Profile',
            textSize: 18,
            textColor: Colors.black,
            isBold: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: widgetHeight(30),
              left: widgetWidth(30),
              right: widgetWidth(30)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: widgetHeight(180),
                    width: widgetWidth(180),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Image(
                      image: AssetImage('images/avatar-removebg-preview.png'),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    bottom: 5,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: widgetHeight(50),
              ),
              FadeInAnimation(
                delay: 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DisplayInfo(
                      dIname: name,
                      boldBoolean: false,
                      dIwidth: 170,
                      dIheight: 140,
                      cardName: "Name",
                    ),
                    DisplayInfo(
                      dIname: age,
                      boldBoolean: false,
                      dIwidth: 160,
                      dIheight: 140,
                      cardName: "Age",
                    ),
                  ],
                ),
              ),
              SizedBox(height: widgetHeight(30)),
              FadeInAnimation(
                delay: 1.4,
                child: DisplayInfo(
                  dIname: email,
                  boldBoolean: false,
                  dIwidth: 350,
                  dIheight: 180,
                  cardName: "Email",
                ),
              ),
              SizedBox(height: widgetHeight(30)),
              FadeInAnimation(
                delay: 1.6,
                child: DisplayInfo(
                  dIname: mobileNumber,
                  boldBoolean: false,
                  dIwidth: 350,
                  dIheight: 150,
                  cardName: "Mobile Number",
                ),
              ),
              SizedBox(height: widgetHeight(30)),
              FadeInAnimation(
                delay: 1.8,
                child: DisplayInfo(
                  dIname: city,
                  boldBoolean: false,
                  dIwidth: 350,
                  dIheight: 150,
                  cardName: "City",
                ),
              ),
              SizedBox(height: widgetHeight(30)),
              FadeInAnimation(
                delay: 2.0,
                child: DisplayInfo(
                  dIname: password,
                  boldBoolean: false,
                  dIwidth: 350,
                  dIheight: 150,
                  cardName: "Password",
                ),
              ),
              SizedBox(
                height: widgetHeight(40),
              ),
              FadeInAnimation(
                delay: 2.2,
                child: BounceButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfile()));
                    },
                    text: "Edit Profile",
                    wHeight: widgetHeight(80),
                    wWidth: widgetWidth(300),
                    containerColor: Colors.red),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              FadeInAnimation(
                delay: 2.2,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widgetWidth(90), right: widgetWidth(90)),
                  child: const Divider(
                    height: 10,
                    thickness: 2,
                  ),
                ),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              FadeInAnimation(
                delay: 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PoppinsTextStyle(
                        text: 'Logout from the app?',
                        textSize: 15,
                        textColor: Colors.grey,
                        isBold: true),
                    BounceButton(
                        onTap: () {
                          signoutTheUser();
                        },
                        text: "Logout",
                        wHeight: widgetHeight(60),
                        wWidth: widgetWidth(100),
                        containerColor: Colors.red)
                  ],
                ),
              ),
              SizedBox(
                height: widgetHeight(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: widgetWidth(90), right: widgetWidth(90)),
                child: const Divider(
                  height: 10,
                  thickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
