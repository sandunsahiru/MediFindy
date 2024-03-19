import 'package:flutter/material.dart';




//import 'pages/home.dart';
import 'pages/welcome_page.dart';
//import 'pages/sign_in_sign_up_page.dart';
//import 'pages/user_sign_up.dart';
//import 'pages/pharmacy_sign_up.dart';
//import 'pages/user_login.dart';
//import 'pages/pharmacy_login.dart';
//import 'pages/pharmacy_list.dart';
//import 'pages/about_pharmacy.dart';
//import 'pages/reviews_and_rating.dart';
//import 'pages/special_request.dart';
//import 'pages/settings.dart';
//import 'pages/account.dart';
//import 'pages/password_security.dart';
//import 'pages/about.dart';
//import 'pages/privacy_policy.dart';
//import 'pages/Terms_of_use.dart';
//import 'pages/search_medicines.dart';
//import 'pages/location.dart';
//import 'pages/location_2.dart';
//import 'pages/location_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}