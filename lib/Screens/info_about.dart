import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';

class AboutOurSection extends StatelessWidget {
  const AboutOurSection({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const PoppinsTextStyle(
            text: "Information",
            textSize: 19,
            textColor: Colors.black,
            isBold: true),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: widgetHeight(48),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: widgetWidth(20)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: widgetWidth(260)),
                  child: const MontSerratTextStyle(
                      text: "About Us",
                      textSize: 25,
                      textColor: Colors.black,
                      isBold: true),
                ),
                SizedBox(
                  height: widgetHeight(15),
                ),
                const PoppinsTextStyle(
                    text:
                        "Welcome to MacroMaster, your revolutionary companion in achieving your health and fitness goals! Our cutting-edge AI technology is designed to personalize your nutrition and exercise journey, making healthy living simpler and more effective.",
                    textSize: 15,
                    textColor: Colors.grey,
                    isBold: false),
                SizedBox(
                  height: widgetHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.only(right: widgetWidth(50)),
                  child: const MontSerratTextStyle(
                      text: "Personalized Meal Planning",
                      textSize: 22,
                      textColor: Colors.black,
                      isBold: true),
                ),
                SizedBox(
                  height: widgetHeight(15),
                ),
                const PoppinsTextStyle(
                    text:
                        "Say goodbye to generic diet plans! Our AI-driven system creates customized meal plans tailored to your unique body type, dietary needs, and fitness goals. Whether you're an ectomorph, mesomorph, or endomorph, diabetic, or simply looking to maintain a healthy lifestyle, we've got you covered.",
                    textSize: 15,
                    textColor: Colors.grey,
                    isBold: false),
                    SizedBox(
                  height: widgetHeight(30),
                ),
                    Padding(
                  padding: EdgeInsets.only(right: widgetWidth(50)),
                  child: const MontSerratTextStyle(
                      text: "Customized Workout Plans",
                      textSize: 22,
                      textColor: Colors.black,
                      isBold: true),
                ),
                SizedBox(
                  height: widgetHeight(15),
                ),
                const PoppinsTextStyle(
                    text:
                        "Achieve your fitness goals with workout plans personalized for you. Whether you want to build muscle, burn fat, or just stay fit and toned, our AI suggests the best workout splits for your week, including chest & triceps, back & biceps, leg days, and more.",
                    textSize: 15,
                    textColor: Colors.grey,
                    isBold: false),
                    SizedBox(
                  height: widgetHeight(30),
                ),
                    Padding(
                  padding: EdgeInsets.only(right: widgetWidth(110)),
                  child: const MontSerratTextStyle(
                      text: "Supplement Guidance",
                      textSize: 22,
                      textColor: Colors.black,
                      isBold: true),
                ),
                SizedBox(
                  height: widgetHeight(15),
                ),
                const PoppinsTextStyle(
                    text:
                        "Navigate the world of dietary supplements with ease. Our AI suggests the most suitable supplements like protein powders, BCAAs, EAAs, and more, based on your individual requirements.",
                    textSize: 15,
                    textColor: Colors.grey,
                    isBold: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
