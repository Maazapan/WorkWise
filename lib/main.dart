import 'package:employments/models/screens/login/companie_page.dart';
import 'package:employments/models/screens/login/login_page.dart';
import 'package:employments/models/screens/login/register_login_page.dart';
import 'package:employments/models/screens/offers/create/offer_create_page.dart';
import 'package:employments/models/screens/offers/favorites/offer_favorite_page.dart';

import 'package:employments/models/screens/offers/offer_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WorkWise app',
      home: LoginPage(),
      //  home: CompaniePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
