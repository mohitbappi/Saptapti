import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/util.dart';

import '../Screens/Home/home2.dart';

class GetMatchesController extends GetxController {
  RxBool isLoading = false.obs;
  List matches = [].obs;
  List tabIndex = [true, false, false];
  @override
  void onInit() {
    getDefaultMatches();
    super.onInit();
  }

  // updateTabIndex(ind){
  //   tabIndex[ind] = true
  // }

  sendRequest(toID, context) async {
    isLoading.value = true;
    String uID = await SharedPrefs.getUserId();
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/send_request");

      var map = Map<String, dynamic>();
      map['from_user_id'] = uID;
      map['to_user_id'] = toID;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        await getDefaultMatches();
        return responseData['message'];
      } else {
        return response.body;
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }

  getDefaultMatches() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/defalut_match");
      String gender = await SharedPrefs.getGender() ?? "";
      String id = await SharedPrefs.getUserId() ?? "";
      var map = Map<String, dynamic>();
      map['id'] = id;
      map['gender'] = gender;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        matches = [];
        var responseData = json.decode(response.body);

        matches.addAll(responseData['response']);
      } else {
        return response.body;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }

  getMatches() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/get_matches");

      var response = await http.post(url);

      if (response.statusCode == 200) {
        matches = [];
        var responseData = json.decode(response.body);

        matches.addAll(responseData['response']);
      } else {
        return response.body;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }

  getNearMe() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/get_nearby_match");
      String cityId = await SharedPrefs.getCityId() ?? "";
      String stateId = await SharedPrefs.getStateId() ?? "";
      String gender = await SharedPrefs.getGender() ?? "";
      var map = Map<String, dynamic>();
      map['state_id'] = stateId;
      map['city_id'] = cityId;
      map['gender'] = gender;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        matches = [];
        var responseData = json.decode(response.body);

        matches.addAll(responseData['response']);
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
