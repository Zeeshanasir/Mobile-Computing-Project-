import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int kcal;

  const FoodCard({super.key, 
    required this.imagePath,
    required this.name,
    required this.kcal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetHeight(225),
      width: widgetWidth(220),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: widgetHeight(19)),
                child: Container(
                  height: widgetHeight(200),
                  width: widgetWidth(210),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(imagePath),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: widgetWidth(150), top: widgetHeight(30)),
                child: Container(
                  height: widgetHeight(50),
                  width: widgetWidth(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.orange,
                      size: 15,
                    ),
                    onPressed: () {
                      // Handle favorite icon tap
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: widgetHeight(10),
          ),
          Padding(
            padding: EdgeInsets.only(right: widgetWidth(70)),
            child: PoppinsTextStyle(
                text: name,
                textSize: 15,
                textColor: Colors.black,
                isBold: true),
          ),
          Padding(
            padding: EdgeInsets.only(left: widgetWidth(14), top: widgetHeight(4)),
            child: Row(
              children: [

                const Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.orange,
                ),
                PoppinsTextStyle(
                    text: '$kcal kcal',
                    textSize: 17,
                    textColor: Colors.grey,
                    isBold: false),
              ],
            ),
          )
        ],
      ),
    );
  }
}
