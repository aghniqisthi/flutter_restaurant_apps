import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/listpage.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: FlutterSplashScreen.gif(
          gifPath: "assets/splash.gif",
          gifWidth: MediaQuery.of(context).size.width,
          gifHeight: MediaQuery.of(context).size.height,
          backgroundColor: Colors.white,
          nextScreen: ListPage(),
          duration: const Duration(seconds: 2),
        )
      );
  }
}
