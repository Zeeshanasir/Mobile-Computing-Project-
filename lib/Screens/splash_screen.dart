import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:macromasterai/Auth/widgetTree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void initState() {
    super.initState();
    checkForConnection();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      // If internet is available, navigate to the WidgetTree screen
      if (result != ConnectivityResult.none) {
        Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const WidgetTree())
        );
      }
    }) as StreamSubscription<ConnectivityResult>;
  }

  checkForConnection() async {
    var status = await (Connectivity().checkConnectivity());
    if (status == ConnectivityResult.none) {
      // Stay on the current screen as there's no internet
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WidgetTree())
      );
    }
  }

  @override
  void dispose() {
    // Cancel the connectivity subscription when the widget is disposed
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/Internet-Access-Error-removebg-preview.png'),
      ),
    );
  }
}
