import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int selected = 0;

  Widget RadioButtonGroup(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide.none),
        backgroundColor: (selected == index)
            ? MaterialStateProperty.all(Colors.white)
            : MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            );
          },
        ),
      ),
      child: PoppinsTextStyle(
          text: text,
          textSize: 15,
          textColor: (selected == index) ? Colors.red : Colors.grey,
          isBold: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: widgetHeight(48)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: widgetWidth(15)),
                    child: Container(
                      height: 40,
                      width: 40,
                      // color: Colors.white,
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  const PoppinsTextStyle(
                      text: 'Details',
                      textSize: 18,
                      textColor: Colors.white,
                      isBold: true),
                  Padding(
                    padding: EdgeInsets.only(right: widgetWidth(15)),
                    child: Container(
                      height: 40,
                      width: 40,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.share_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widgetHeight(36),
              ),
              const Padding(
                padding: EdgeInsets.only(),
                child: PoppinsTextStyle(
                    text: 'Vitamins & Minerals',
                    textSize: 19,
                    textColor: Colors.white,
                    isBold: true),
              ),
              SizedBox(
                height: widgetHeight(19),
              ),
              Stack(
                children: [
                  Container(
                    height: widgetHeight(110),
                    width: widgetHeight(550),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: widgetWidth(25), top: widgetHeight(16)),
                      child: Row(
                        children: [
                          const textInTheBox(
                            text: 'Vitamin D',
                            numbers: '86',
                          ),
                          Div(),
                          SizedBox(
                            width: widgetWidth(8),
                          ),
                          const textInTheBox(
                            text: 'Vitamin C',
                            numbers: '94',
                          ),
                          Div(),
                          SizedBox(
                            width: widgetWidth(5),
                          ),
                          const textInTheBox(
                            text: 'Vitamin E',
                            numbers: '43',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              Container(
                height: widgetHeight(940),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: widgetHeight(30),
                      ),
                      child: Container(
                        height: widgetHeight(80),
                        width: widgetWidth(386),
                        decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioButtonGroup('Vitamin', 1),
                            SizedBox(
                              width: widgetWidth(10),
                            ),
                            RadioButtonGroup('Nutrition', 2),
                            SizedBox(
                              width: widgetWidth(10),
                            ),
                            RadioButtonGroup('Minerals', 3),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widgetHeight(30),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: widgetWidth(15), right: widgetWidth(15)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsTextStyle(
                              text: 'Schedule',
                              textSize: 18,
                              textColor: Colors.black,
                              isBold: true),
                          PoppinsTextStyle(
                              text: 'Today',
                              textSize: 16,
                              textColor: Colors.orange,
                              isBold: true),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: widgetHeight(10),
                    ),
                    SizedBox(
                      height: widgetHeight(740),
                      width: widgetWidth(400),
                      child: SfCalendar(
                        headerHeight: 50,
                        view: CalendarView.day,
                        todayHighlightColor: Colors.red,
                      ),
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

// class ScheduleContainerForLong extends StatelessWidget {
//   final String imagePath;
//   final String text;

//   ScheduleContainerForLong({required this.imagePath, required this.text});

//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 170,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: const Color(0xffd6eae6)),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 4, left: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image(
//               image: AssetImage(
//                 imagePath,
//               ),
//               fit: BoxFit.cover,
//             ),
//             Text(
//               text,
//               style: const TextStyle(
//                   color: Colors.grey,
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ScheduleContainerForShort extends StatelessWidget {
//   final String imagePath;
//   final String text;

//   ScheduleContainerForShort({required this.imagePath, required this.text});

//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 130,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: const Color(0xffd6eae6)),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 23, left: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image(
//               image: AssetImage(
//                 imagePath,
//               ),
//               fit: BoxFit.cover,
//             ),
//             Text(
//               text,
//               style: const TextStyle(
//                   color: Colors.grey,
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }