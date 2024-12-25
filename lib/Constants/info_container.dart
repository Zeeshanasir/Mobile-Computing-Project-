
import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';

class DisplayInfo extends StatefulWidget {
  final String? dIname;
  final bool boldBoolean;
  final double dIwidth;
  final double dIheight;
  final String? cardName;

  DisplayInfo(
      {super.key,
      required this.dIname,
      required this.boldBoolean,
      required this.dIwidth,
      required this.cardName,
      required this.dIheight});

  @override
  State<DisplayInfo> createState() => _DisplayInfoState();
}

class _DisplayInfoState extends State<DisplayInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widgetWidth(25), vertical: widgetHeight(20)),
      height: widgetHeight(widget.dIheight),
      width: widgetWidth(widget.dIwidth),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0, // soften the shadow
            spreadRadius: 0.6, //extend the shadow
            offset: Offset(
              5, // Move to right 5 horizontally
              5, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.cardName.toString()} :",
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: widgetHeight(20),),
          Padding(
            padding: EdgeInsets.only(left: widgetWidth(20)),
            child: Center(
              child: PoppinsTextStyle(
                  text: widget.dIname ?? '...',
                  textSize: 20,
                  textColor: Colors.black,
                  isBold: widget.boldBoolean),
            ),
          ),
        ],
      ),
    );
  }
}
