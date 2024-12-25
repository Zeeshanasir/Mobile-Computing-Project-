import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';
import 'package:macromasterai/Screens/ChatBot.dart';
import 'package:macromasterai/Screens/DetailsPage.dart';
import 'package:macromasterai/Screens/HomePage.dart';
import 'package:macromasterai/Screens/ProfilePage.dart';

class CommonScreenSelector extends StatefulWidget {
  const CommonScreenSelector({super.key});

  @override
  State<CommonScreenSelector> createState() => _CommonScreenSelectorState();
}

class _CommonScreenSelectorState extends State<CommonScreenSelector> {
  int index = 0;
  final screens = [
    const HomePage(),
    const ChatBot(),
    const CalorieCalculator(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => {
            setState(() {
              this.index = index;
            }),
          },
          height: widgetHeight(80),
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                selectedIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                selectedIcon: Icon(
                  Icons.settings_suggest_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                label: 'ChatBot'),
            NavigationDestination(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.grey,
                ),
                selectedIcon: Icon(
                  Icons.dashboard_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                label: 'Details'),
            NavigationDestination(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                selectedIcon: Icon(
                  Icons.person_outline,
                  color: Colors.red,
                  size: 30,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
