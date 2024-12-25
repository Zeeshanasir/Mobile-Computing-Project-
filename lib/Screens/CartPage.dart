import 'package:flutter/material.dart';
import 'package:macromasterai/CommonScreen.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/IngredientsContainer.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:macromasterai/Screens/ChatBot.dart';

class Cart extends StatelessWidget {
  final String? vname;
  final String? image;
  final String? cal;
  final String? fat;
  final String? protein;
  final String? carbs;
  Cart(
      {super.key,
        this.image,
        this.cal,
        this.fat,
        this.protein,
        this.carbs,
        this.vname});

  @override
  Widget build(BuildContext context) {
    final hasData = (image != null &&
        cal != null &&
        fat != null &&
        protein != null &&
        protein != null &&
        carbs != null);
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: hasData
          ? Padding(
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CommonScreenSelector()));
                      },
                    ),
                  ),
                  const PoppinsTextStyle(
                      text: 'Details',
                      textSize: 20,
                      textColor: Colors.black,
                      isBold: true),
                  Container(
                    height: 40,
                    width: 40,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(200)),
                child: PoppinsTextStyle(
                    text: vname.toString(),
                    textSize: 12,
                    textColor: Colors.black,
                    isBold: true),
              ),
              SizedBox(
                height: widgetHeight(10),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(260)),
                child: Container(
                  child: Image.asset('images/Score.png'),
                ),
              ),
              SizedBox(
                height: widgetHeight(16),
              ),
              Row(
                children: [
                  SizedBox(
                    // color: Colors.grey,
                    height: widgetHeight(200),
                    width: widgetWidth(200),
                    child: Image.asset(
                        image.toString()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: widgetHeight(10), left: widgetHeight(6)),
                    child: Column(
                      children: [
                        const PoppinsTextStyle(
                            text: 'Calories',
                            textSize: 15,
                            textColor: Colors.black,
                            isBold: true),
                        SizedBox(
                          height: widgetHeight(8),
                        ),
                        PoppinsTextStyle(
                            text: '${cal.toString()} kcal',
                            textSize: 14,
                            textColor: Colors.black,
                            isBold: false),
                        SizedBox(
                          height: widgetHeight(29),
                        ),
                        const PoppinsTextStyle(
                            text: 'Protein',
                            textSize: 15,
                            textColor: Colors.black,
                            isBold: true),
                        SizedBox(
                          height: widgetHeight(8),
                        ),
                        PoppinsTextStyle(
                            text: '${protein.toString()} g',
                            textSize: 14,
                            textColor: Colors.black,
                            isBold: false),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: widgetWidth(50), bottom: widgetHeight(22)),
                    child: Column(
                      children: [
                        const PoppinsTextStyle(
                            text: 'Fat',
                            textSize: 15,
                            textColor: Colors.black,
                            isBold: true),
                        SizedBox(
                          height: widgetHeight(8),
                        ),
                        PoppinsTextStyle(
                            text: '${fat.toString()} g',
                            textSize: 14,
                            textColor: Colors.black,
                            isBold: false),
                        SizedBox(
                          height: widgetHeight(29),
                        ),
                        const PoppinsTextStyle(
                            text: 'Carbs',
                            textSize: 15,
                            textColor: Colors.black,
                            isBold: true),
                        SizedBox(
                          height: widgetHeight(8),
                        ),
                        PoppinsTextStyle(
                            text: '${carbs.toString()} g',
                            textSize: 14,
                            textColor: Colors.black,
                            isBold: false),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: widgetHeight(21),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(280)),
                child: const PoppinsTextStyle(
                    text: 'About Food',
                    textSize: 16,
                    textColor: Colors.black,
                    isBold: true),
              ),
              SizedBox(
                height: widgetHeight(11),
              ),
              const PoppinsTextStyle(
                text:
                "Duis vestibulum risus nec sem auctor, sita amet fermentum odio mollis. Vivamus eleifend, food a non volutpat venenatis, neque elit viver healthy augue, in accumsan orci diam et augue. Nunc a sodales iaculis congue. Nullam vita food salmon laoreet, maximus sapien nec, sollicitudin dolor. Nunc interdum fermentum dolor nec an tempus. Nullam pellentesque odio id libero bibendum, id sagittis leo vulputate. Donec odio eros, healthy sollicitudin ut quam ut, suscipit aliquet neque.",
                textColor: Colors.grey,
                textSize: 15,
                isBold: false,
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(280)),
                child: const PoppinsTextStyle(
                    text: 'Ingredients',
                    textSize: 16,
                    textColor: Colors.black,
                    isBold: true),
              ),
              SizedBox(
                height: widgetHeight(19),
              ),
              SizedBox(
                height: widgetHeight(100),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      List<Color> colours = [
                        const Color(0xffe4f3f1),
                        const Color(0xffffebdb),
                        const Color(0xfff5f9fa),
                        const Color(0xffffffff)
                      ];
                      List<String> ingredientImagePath = [
                        'images/avocado-minimalism-pink-wallpaper-preview-removebg-preview.png',
                        'images/tomato-removebg-preview.png',
                        'images/carrot-removebg-preview.png',
                        'images/brocoli-removebg-preview.png'
                      ];
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IngredientsContainer(
                            containerColor: colours[index],
                            imagePath: ingredientImagePath[index]),
                      );
                    }),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChatBot()));
                },
                child: Container(
                  height: widgetHeight(70),
                  width: widgetWidth(386),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red),
                  child: const Center(
                    child: PoppinsTextStyle(
                        text: 'Chat with AI Bot',
                        textSize: 15,
                        textColor: Colors.white,
                        isBold: true),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : Padding(
          padding: EdgeInsets.only(
              top: widgetHeight(48),
              right: widgetWidth(15),
              left: widgetHeight(15)),
          child: const Center(
              child: PoppinsTextStyle(
                  text: "Please select an item from the Food list",
                  textSize: 17,
                  textColor: Colors.grey,
                  isBold: true))),
    );
  }
}
