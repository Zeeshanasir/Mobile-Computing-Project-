import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:macromasterai/Auth/LoginScreen.dart';
// import 'package:macromasterai/Auth/widgetTree.dart';
import 'package:macromasterai/Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBZI7-PueGwDO-9jqGSbLJDnE8HBUuCD1Y",
          authDomain: "macromasterai-8e840.firebaseapp.com",
          projectId: "macromasterai-8e840",
          storageBucket: "macromasterai-8e840.firebasestorage.app",
          messagingSenderId: "235138271555",
          appId: "1:235138271555:ios:8de4c180fbb43ea080c7f6",
          measurementId: null,
          databaseURL: null),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
