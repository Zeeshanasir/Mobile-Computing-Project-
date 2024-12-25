import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:macromasterai/CommonScreen.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/ListImages.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:macromasterai/Screens/CalculateOrScd.dart';
import 'package:macromasterai/Screens/UserProfileDetails.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? age;
  String? weight;
  String? height;

  final List<Color> gradientColor = [
    const Color(0xffFF0000),
    const Color(0xffffffff)
  ];

  // Add variables for BMI calculator
  double bmi = 0.0;
  String bmiCategory = '';
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

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
            age = data["Age"];
            weight = data["Weight"];
            height = data["Height"];
          });
        }
      } catch (e) {
        //
      }
    }
  }

  void calculateBMI() {
    // Get weight and height input
    double weightInput = double.tryParse(_weightController.text) ?? 0.0;
    double heightInput = double.tryParse(_heightController.text) ?? 0.0;

    // BMI Formula: weight (kg) / height (m) ^ 2
    if (weightInput > 0 && heightInput > 0) {
      double heightInMeters = heightInput / 100; // Convert cm to meters
      setState(() {
        bmi = weightInput / (heightInMeters * heightInMeters);
        bmiCategory = getBMICategory(bmi);
      });
    }
  }

  String getBMICategory(double bmiValue) {
    if (bmiValue < 18.5) {
      return 'Underweight';
    } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
      return 'Healthy';
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Padding(
        padding: EdgeInsets.only(
            top: widgetHeight(48),
            right: widgetWidth(15),
            left: widgetHeight(15)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CommonScreenSelector()));
                      },
                    ),
                  ),
                  const PoppinsTextStyle(
                      text: 'Profile',
                      textSize: 18,
                      textColor: Colors.black,
                      isBold: true),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserInfoDetails()));
                    },
                    child: Hero(
                      tag: 'avatarHero',
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60)),
                          child: Image.asset(
                              'images/avatar-removebg-preview.png')),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widgetHeight(40),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Schedule()));
                },
                child: Container(
                  height: widgetHeight(273),
                  width: widgetWidth(386),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: widgetWidth(23), left: widgetWidth(23)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PoppinsTextStyle(
                                text: 'Age',
                                textSize: 17,
                                textColor: Colors.black,
                                isBold: true),
                            Padding(
                              padding: EdgeInsets.only(top: widgetHeight(10)),
                              child: Container(
                                height: widgetHeight(45),
                                width: widgetWidth(90),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red),
                                child: Center(
                                  child: PoppinsTextStyle(
                                      text: '$age years',
                                      textSize: 16,
                                      textColor: Colors.white,
                                      isBold: true),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: widgetWidth(280)),
                        child: PoppinsTextStyle(
                            text: '$weight kg',
                            textSize: 22,
                            textColor: Colors.grey,
                            isBold: false),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: widgetWidth(10)),
                        child: Container(
                          height: widgetHeight(160),
                          width: widgetWidth(450),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: LineChart(LineChartData(
                              minX: 0,
                              maxX: 10,
                              minY: 0,
                              maxY: 4,
                              titlesData: const FlTitlesData(show: false),
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                    spots: [
                                      const FlSpot(0, 4),
                                      const FlSpot(1.3, 2.3),
                                      const FlSpot(3, 3.5),
                                      const FlSpot(4, 2.7),
                                      const FlSpot(5, 2.9),
                                      const FlSpot(5.4, 2.7),
                                      const FlSpot(6, 3.5),
                                      const FlSpot(6.3, 2.7),
                                      const FlSpot(6.5, 2.5),
                                      const FlSpot(6.8, 2),
                                      const FlSpot(7, 2.5),
                                      const FlSpot(7.3, 1),
                                      const FlSpot(7.4, 2.5),
                                      const FlSpot(7.6, 1.5),
                                      const FlSpot(8, 1.7),
                                      const FlSpot(9, 1),
                                      const FlSpot(9.4, 1.5),
                                      const FlSpot(9.7, 1.2)
                                    ],
                                    isCurved: true,
                                    color: Colors.red,
                                    barWidth: 4,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(
                                        show: true,
                                        gradient: LinearGradient(
                                            colors: gradientColor
                                                .map((color) =>
                                                    color.withOpacity(0.3))
                                                .toList())))
                              ])),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // BMI Calculator Section
              SizedBox(height: widgetHeight(40)),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PoppinsTextStyle(
                        text: 'BMI Calculator',
                        textSize: 18,
                        textColor: Colors.black,
                        isBold: true),
                    SizedBox(height: widgetHeight(10)),
                    // Height input field
                    TextField(
                      controller: _heightController,
                      decoration: InputDecoration(
                          labelText: 'Enter your height (cm)',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: widgetHeight(10)),
                    // Weight input field
                    TextField(
                      controller: _weightController,
                      decoration: InputDecoration(
                          labelText: 'Enter your weight (kg)',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: widgetHeight(20)),
                    ElevatedButton(
                      onPressed: calculateBMI,
                      child: const Text('Calculate BMI'),
                    ),
                    SizedBox(height: widgetHeight(20)),
                    // BMI Result and Meter
                    if (bmi > 0)
                      Column(
                        children: [
                          Text(
                            'BMI: ${bmi.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Status: $bmiCategory',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                          SizedBox(
                            height: widgetHeight(20),
                          ),
                          // BMI Meter: Here I have used a simple circular progress indicator
                          CircularProgressIndicator(
                            value: (bmi / 40).clamp(0.0, 1.0),
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              bmi < 18.5
                                  ? Colors.red
                                  : bmi <= 24.9
                                      ? Colors.green
                                      : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
