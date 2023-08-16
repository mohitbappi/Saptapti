import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/util.dart';

class ConnectionSentController extends GetxController {
  RxBool isLoading = false.obs;
  List connect = [].obs;
  List tabIndex = [true, false, false];
  @override
  void onInit() {
    getConnect();
    isLoading.value = false;
    super.onInit();
  }

  getConnect() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/connect_sent");

      String id = await SharedPrefs.getUserId() ?? "";
      var map = Map<String, dynamic>();
      map['user_id'] = id;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        connect = [];
        var responseData = json.decode(response.body);
        isLoading.value = false;

        connect.addAll(responseData['response']);
      } else {
        return response.body;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
    isLoading.value = false;
  }

  sendUpdate(option, context) async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/reject_request");
      String id = await SharedPrefs.getUserId() ?? "";
      var map = Map<String, dynamic>();
      map['request_id'] = id;
      map['is_accepted'] = option;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        util().showSnackBar(context, responseData['message'], Colors.green);
      } else {
        return response.body;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }
}
