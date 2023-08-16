import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/util.dart';

import '../Model/motherTongueModel.dart';
import '../Screens/Auth/register1.dart';

class registerController extends GetxController {
  String selectedReligion = 'Self';

  String selectedMoonsign = '';

  Language? selectedmothertongue;
  Subcast? selectedSubcast;

  RxBool isLoading = false.obs;
  DateTime dob = DateTime.now();

  List<dynamic> religionTableData = ["Self", "Son", "relative", "Causin"];

  List<Language> languages = [];
  List<Subcast> subCast = [];

  List<String> moonsign = [];

  @override
  void onInit() async {
    // await getMothertongue();

    await getSubCast();
    super.onInit();
  }

  saveContinue(ctx) {
    if (selectedReligion != '' || selectedSubcast != null) {
      global.profileFor = selectedReligion;
      global.dob =
          (global.selectedDate.toString() + global.selectedTime.toString());
      // global.selemothertongue = selectedmothertongue!.name.toString();
      global.seleSubcast = selectedSubcast!.caste_name.toString();
      Get.to(Register1());
    } else {
      util().showSnackBar(ctx, "Please fill all field", Colors.red);
    }
    // if (selectedReligion != '' &&
    //     selectedDate != '' &&
    //     selectedTime != '' &&
    //     selectedmothertongue != null &&
    //     selectedSubcast != null) {
    //   Get.to(Register1());
    // }
  }

  getMoonsign() async {
    isLoading.value = true;
    moonsign = [];
    try {
      var url = Uri.parse(global.baseURL + global.moonsign);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          moonsign.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedMoonsign = moonsign[0];
        isLoading.value = false;
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

//----Regiter method
  // getMothertongue() async {
  //   isLoading.value = true;
  //   try {
  //     var url = Uri.parse(global.baseURL + global.mothertongue);
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       for (var item in data['response']) {
  //         languages.add(
  //             Language(id: int.parse(item['id']), name: item['mtongue_name']));
  //       }
  //       selectedmothertongue = languages[0];
  //       isLoading.value = false;
  //     } else {
  //       isLoading.value = false;

  //       print('Failed to fetch religion table');
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     print(e.toString());
  //   }
  // }

  getSubCast() async {
    isLoading.value = true;
    try {
      var url = Uri.parse(global.baseURL + global.subCast);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          subCast.add(Subcast(
              subcaste_id: int.parse(item['subcaste_id']),
              caste_name: item['caste_name']));
        }
        selectedSubcast = subCast[0];
        isLoading.value = false;
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  getReligion() async {
    isLoading.value = true;
    try {
      isLoading.value = false;

      var url = Uri.parse(global.baseURL + global.getReligion);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        religionTableData = data['religion_table'];
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
