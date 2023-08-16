import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/util.dart';

import '../Screens/Home/home2.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  login(mobile, pass, ctx) async {
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/login");

      var map = Map<String, dynamic>();
      map['mobile'] = mobile.toString();
      map['password'] = pass.toString();

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        return responseData;
      } else {
        return json.decode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
