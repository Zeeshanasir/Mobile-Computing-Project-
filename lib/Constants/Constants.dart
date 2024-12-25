import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';


const Color whiteContainerColor = Color(0xffffffff);
const Color appBackgroundColor = Color(0xfff9f9f9);
const Color appThemeColor = Colors.red;



class PoppinsTextStyle extends StatelessWidget{
  final bool isBold;
  final String text;
  final double textSize;
  final Color textColor;

  const PoppinsTextStyle({super.key, 
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.isBold
  });

  @override
  Widget build (BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: 'Poppins',
        fontWeight: (isBold==true) ? FontWeight.bold : FontWeight.normal
      ),
  );
  }
}

class MontSerratTextStyle extends StatelessWidget{
  final bool isBold;
  final String text;
  final double textSize;
  final Color textColor;

  const MontSerratTextStyle({super.key, 
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.isBold
  });

  @override
  Widget build (BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: 'Montserrat',
        fontWeight: (isBold==true) ? FontWeight.bold : FontWeight.normal
      ),
  );
  }
}



class textInTheBox extends StatelessWidget {
  final String text;
  final String numbers;

  const textInTheBox({super.key, required this.text, required this.numbers});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PoppinsTextStyle(
            text: text, textSize: 16, textColor: Colors.black, isBold: true),
        const SizedBox(
          height: 6,
        ),
        PoppinsTextStyle(
            text: numbers, textSize: 19, textColor: Colors.grey, isBold: false),
      ],
    );
  }
}

class Div extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widgetWidth(10), bottom: widgetHeight(10)),
      child: const SizedBox(
        height: 50,
        child: VerticalDivider(
          color: Colors.grey,
          thickness: 1.5,
        ),
      ),
    );
  }
}

