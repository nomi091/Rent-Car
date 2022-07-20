import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/screens/Admin/Add_New_Property/listProperty.dart';
import 'package:rent_house/screens/Admin/Widgets/dropDownRadio.dart';
import 'package:rent_house/screens/Explore/Explore.dart';
import 'package:rent_house/screens/Home/details/details.dart';
import 'package:rent_house/screens/Home/home.dart';
import 'package:rent_house/screens/Liked/liked.dart';
import 'package:rent_house/screens/LoginSignUp/View/signup.dart';
import 'package:rent_house/screens/Navigation/navBar.dart';
import 'package:rent_house/screens/Setting/setting.dart';
import 'package:rent_house/test2.dart';
import 'package:rent_house/testScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/LoginSignUp/View/login.dart';

// @dart=2.9
var token;
Future<void> main() async {
  runApp(const MyApp());
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  print("tokenmain" + token);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.`
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/Navbar", page: () => const LandingPage()),
          GetPage(name: "/home", page: () => Home()),
          GetPage(name: "/liked", page: () => Liked()),
          GetPage(name: "/Explore", page: () => Explore()),
          GetPage(name: "/Setting", page: () => Setting()),
          GetPage(name: "/detail", page: () => const Detail()),
          GetPage(name: "/signup", page: () => const SignupScreen()),
          GetPage(name: "/Navbar", page: () => const Navbar()),
          GetPage(name: "/login", page: () => LoginScreen()),
        ],
        // initialRoute: "/Navbar",
        home: (token == null) ? ListProperty() : Navbar());
  }
}
