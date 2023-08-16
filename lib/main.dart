import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/Screens/Auth/register2.dart';
import 'package:saptapti/Screens/Auth/register4.dart';
import 'package:saptapti/Screens/Home/home2.dart';
import 'package:saptapti/Screens/homeScreen.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/global.dart';

import 'Screens/Auth/register1.dart';
import 'Screens/Auth/register3.dart';
import 'Screens/Auth/registerScreen.dart';
import 'package:saptapti/color.dart' as color;

import 'Screens/Home/homeEmptyUser.dart';

String token = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  token = '';
  token = await SharedPrefs.getToken() ?? "";
  print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Koli Spatapadi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito',
      ),
      home: token == "" ? HomeEptyUser() : HomeScreen(),
    );
  }
}
