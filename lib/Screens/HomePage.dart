import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:macromasterai/Auth/LoginScreen.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/FoodCard.dart';
import 'package:macromasterai/Constants/ListImages.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:macromasterai/Screens/CartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  void signoutTheUser() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Replace with your login screen widget
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Padding(
        padding: EdgeInsets.only(top: widgetHeight(48), right: widgetWidth(15), left: widgetHeight(15)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
                        Icons.logout_outlined,
                        color: Colors.red,
                        size: 20,
                      ),
                      onPressed: () {
                        signoutTheUser();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: widgetWidth(110)),
                    child: const PoppinsTextStyle(
                        text: 'Home',
                        textSize: 20,
                        textColor: Colors.black,
                        isBold: true),
                  ),
                ],
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              // Search bar

              SizedBox(
                height: widgetHeight(210),
                width: widgetWidth(370),
                child: Row(
                  children: [
                    SizedBox(
                      height: widgetHeight(10),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              color: Color(0xfff2f2f2),
                            ),
                            child: Padding(
                              padding:
                              EdgeInsets.only(top: widgetHeight(20), right: widgetWidth(30)),
                              child: Column(
                                children: [
                                  const PoppinsTextStyle(
                                      text: 'Healthy Foods for you',
                                      textSize: 15,
                                      textColor: Colors.black,
                                      isBold: true),
                                  Padding(
                                    padding: EdgeInsets.only(top: widgetHeight(8), left: widgetWidth(15)),
                                    child: const Text(
                                      "Etiam in ex nec lobortis food luctus. Etiam iaculis healthy.",
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: widgetHeight(10), right: widgetWidth(20)),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: widgetHeight(60),
                                        width: widgetWidth(160),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            color: Colors.red),
                                        child: const Center(
                                          child: PoppinsTextStyle(
                                              text: 'See all food',
                                              textSize: 14,
                                              textColor: Colors.white,
                                              isBold: true),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))),
                    Container(
                        height: widgetHeight(209),
                        width: widgetWidth(130),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Color(0xfff2f2f2),
                        ),
                        child: SizedBox(
                          child: Image.asset(
                              'images/greek-salad-caesar-salad-pasta-salad-recipe-salad-b86a44511c6f08ab49a6a0817f278be2 1.png'),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(280)),
                child: const PoppinsTextStyle(
                    text: 'New Food',
                    textSize: 18,
                    textColor: Colors.black,
                    isBold: true),
              ),
              SizedBox(
                height: widgetHeight(33),
              ),
              SizedBox(
                height: widgetHeight(320),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagePathFood.length,
                    itemBuilder: (BuildContext context, int index) {

                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(
                              vname: imageName[index],
                              image: imagePathFood[index],
                              cal: kcalories[index].toString(),
                              protein: kproteins[index].toString(),
                              fat: kfat[index].toString(),
                              carbs: kcarbs[index].toString(),
                            )));
                          },
                          child: FoodCard(
                              imagePath: imagePathFood[index],
                              name: imageName[index],
                              kcal: kcalories[index]),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 224),
                child: PoppinsTextStyle(
                    text: 'Popular Food',
                    textSize: 18,
                    textColor: Colors.black,
                    isBold: true),
              ),
              SizedBox(
                height: widgetHeight(19),
              ),
              Padding(
                padding: EdgeInsets.only(left: widgetWidth(8)),
                child: ListTile(
                  tileColor: const Color(0xffffffff),
                  leading: Container(
                    height: widgetHeight(120),
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Image.asset('images/Mask3.png'),
                  ),
                  title: const PoppinsTextStyle(
                      text: 'Seasonal Salad',
                      textSize: 14,
                      textColor: Colors.black,
                      isBold: true),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PoppinsTextStyle(
                          text: 'Nunc fringilla, nibh ac malesu.',
                          textSize: 13,
                          textColor: Colors.grey,
                          isBold: false),
                      SizedBox(
                        height: widgetHeight(4),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 7),
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_fire_department_outlined,
                              color: Colors.orange,
                            ),
                            PoppinsTextStyle(
                                text: '130 kcal',
                                textSize: 12,
                                textColor: Colors.grey,
                                isBold: false),
                            SizedBox(
                              width: 65,
                            ),
                            PoppinsTextStyle(
                                text: '\$14.50',
                                textSize: 12,
                                textColor: Colors.grey,
                                isBold: false),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
