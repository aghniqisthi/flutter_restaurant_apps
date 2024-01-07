import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/detailpage.dart';
import 'package:flutter_restaurant_apps/restaurant_response.dart';
import 'package:flutter_restaurant_apps/splashscreen.dart';

import 'listpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/listpage' : (context) => ListPage(),
        '/detail': (context) => DetailPage(
            ModalRoute.of(context)?.settings.arguments as RestaurantsItem
        ),
      },
    );
  }
}

