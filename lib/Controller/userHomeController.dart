import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/util.dart';

import '../Screens/Home/home2.dart';

class UserHomeController extends GetxController {
  RxBool isLoading = false.obs;
  var userStatus;
  var imageUrl;

  @override
  void onInit() {
    userpremiumOrFree();
    super.onInit();
  }

  changePrivacy(status) async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/private_profile");
      String uId = await SharedPrefs.getUserId() ?? "";

      var map = Map<String, dynamic>();
      map['id'] = uId;
      map['private'] = status.toString();

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData);
        // userStatus = responseData;
        print(responseData);
      } else {
        return response.body;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }

  userpremiumOrFree() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/check_premium_free");
      String uId = await SharedPrefs.getUserId() ?? "";

      var map = Map<String, dynamic>();
      map['id'] = "197"; //uId;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        userStatus = responseData;
        print(responseData);
      } else {
        return response.body;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }

  uploadUserProfile(File image) async {
    isLoading.value = true;
    try {
      var url = Uri.parse(global.baseURL + global.uploadProfilePhoto);
      String uId = await SharedPrefs.getUserId();

      var map = <String, String>{};
      map['user_id'] = uId;

      final request = http.MultipartRequest('POST', url);
      request.files.add(
        await http.MultipartFile.fromPath("p_image", image.path),
      );

      request.fields.addAll(map);

      final res = await request.send();

      final response = await http.Response.fromStream(res);
      final responseData = json.decode(response.body);

      imageUrl = responseData['image_url'];
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
