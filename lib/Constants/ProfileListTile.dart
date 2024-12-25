import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:macromasterai/Constants/Constants.dart';
import 'package:macromasterai/Constants/utils/dimensions.dart';

class ProfileMenuButton extends StatelessWidget {
  final IconData awesomeIcon;
  final String text;
  final bool endIcon;
  final Color textColor;
  final VoidCallback onPress;

  const ProfileMenuButton(
      {super.key, required this.awesomeIcon,
      required this.text,
      required this.endIcon,
      required this.textColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.withOpacity(0.03),
      onTap: onPress,
      contentPadding: EdgeInsets.only(left: widgetWidth(30), right: widgetWidth(30)),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.red),
        child: Icon(
          awesomeIcon,
          color: Colors.white,
        ),
      ),
      title: PoppinsTextStyle(
          text: text, textSize: 17, textColor: textColor, isBold: false),
      trailing: (endIcon == true)
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                color: Colors.grey,
                size: 18,
              ),
            )
          : null,
    );
  }
}
