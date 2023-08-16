import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/util.dart';

class AcceptedController extends GetxController {
  RxBool isLoading = false.obs;
  List accepted = [].obs;

  @override
  void onInit() async {
    await getAccepted();
    isLoading.value = false;
    super.onInit();
  }

  getAccepted() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/connect_accepted");

      String id = await SharedPrefs.getUserId() ?? "";
      var map = Map<String, dynamic>();
      map['user_id'] = id;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        accepted = [];
        var responseData = json.decode(response.body);
        isLoading.value = false;

        accepted.addAll(responseData['response']);
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
}
