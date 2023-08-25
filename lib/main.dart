import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/homeScreen.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'Screens/Home/homeEmptyUser.dart';

String token = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  token = '';
  token = await SharedPrefs.getToken() ?? "";
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
