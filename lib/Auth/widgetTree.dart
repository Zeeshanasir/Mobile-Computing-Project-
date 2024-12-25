import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:macromasterai/Auth/LoginScreen.dart';
import 'package:macromasterai/CommonScreen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
Widget build(BuildContext context) {
  return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show a simple loading indicator while waiting for the stream
        return Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasData) {
        // User is signed in
        return CommonScreenSelector();
      } else {
        // User is not signed in
        return LoginPage();
      }
    },
  );
}

}