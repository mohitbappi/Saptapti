import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/util.dart';

class ConnectReceivedController extends GetxController {
  RxBool isLoading = false.obs;
  List request = [].obs;
  List tabIndex = [true, false, false, false];
  @override
  void onInit() async {
    isLoading.value = false;
    super.onInit();
  }

  sendUpdate(option, context, id) async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/reject_request");
      var map = <String, dynamic>{};
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
