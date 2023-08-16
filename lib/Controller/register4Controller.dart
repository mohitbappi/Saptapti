import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/util.dart';

import '../Model/motherTongueModel.dart';
import '../Screens/Home/home2.dart';

class Register4Controller extends GetxController {
  RxBool isLoading = false.obs;
  List<Education> education = [];
  List<Occupation> occupation = [];
  List<Designation> designation = [];
  List<String> empoloyee = [];

  Education? selectedEducation;
  Occupation? selectedOccupation;
  Designation? selectedDesignation;
  String selectedEmployee = '';
  String mobile = '';
  String fname = '';
  String lname = '';
  String mail = '';
  String pass = '';
  String gender = 'male';

  @override
  void onInit() async {
    updateLoading(true);
    await getEducation();
    await getEmployee();
    await getOcuupation();
    await getDesignation();
    updateLoading(false);
    super.onInit();
  }

  updateLoading(val) {
    isLoading.value = val;
  }

  getPrefData() async {
    mobile = await SharedPrefs.getUserMobile();
    fname = await SharedPrefs.getUserFname();
    lname = await SharedPrefs.getUserLname();
    mail = await SharedPrefs.getUseremail();
    pass = await SharedPrefs.getUserPassword();
  }

  getEducation() async {
    try {
      var url = Uri.parse(global.baseURL + global.education);
      var response = await http.get(url);
      if (response.statusCode == 200 && education.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          education.add(Education(
            id: int.parse(item['id']),
            status: item['status'],
            education_name: item['education_name'],
            is_deleted: item['is_deleted'],
          ));
        }
        selectedEducation = education[0];
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getEmployee() async {
    empoloyee = [];
    try {
      var url = Uri.parse(global.baseURL + global.employee);
      var response = await http.get(url);
      if (response.statusCode == 200 && empoloyee.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          empoloyee.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedEmployee = empoloyee[0];
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getOcuupation() async {
    try {
      var url = Uri.parse(global.baseURL + global.occupation);
      var response = await http.get(url);
      if (response.statusCode == 200 && occupation.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          occupation.add(Occupation(
            id: int.parse(item['id']),
            occupation_name: item['occupation_name'],
            status: item['status'],
            is_deleted: item['is_deleted'],
          ));
        }
        selectedOccupation = occupation[0];
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getDesignation() async {
    try {
      var url = Uri.parse(global.baseURL + global.designation);
      var response = await http.get(url);
      if (response.statusCode == 200 && designation.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          designation.add(Designation(
            id: int.parse(item['id']),
            designation_name: item['designation_name'],
            status: item['status'],
            is_deleted: item['is_deleted'],
          ));
        }
        selectedDesignation = designation[0];
      } else {
        print('Failed to fetch religion table');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  postRegister(ctx) async {
    await getPrefData();
    print(global.seleDesignation);
    print(global.subCast);

    // String lang = selectedmothertongue!.name.toString();
    // String subCas = selectedSubcast!.caste_name.toString();
    // String stat = selectedState!.state_name.toString();
    // String cit = selectedState!.state_name.toString();
    // String edu = selectedEducation!.education_name.toString();
    // String occ = selectedOccupation!.occupation_name.toString();
    // String des = selectedDesignation!.designation_name.toString();
    try {
      var url = Uri.parse(global.baseURL + global.register);

      var map = <String, String>{};
      map['profile_by'] = global.profileFor;
      map['birthdate'] = global.dob;
      map['mtongue_name'] = "Gujarati";
      map['caste_name'] = 'koli';
      map['subcaste_name'] = global.seleSubcast;
      map['gender'] = gender;
      map['mobile'] = mobile;
      map['firstname'] = fname;
      map['lastname'] = lname;
      map['email'] = mail;
      map['password'] = pass;

      map['marital_status'] = global.selectedMaritStatus.toString();
      map['eating'] = global.selectEatinghabbit.toString();
      map['smoke'] = global.selectSmokinghabbit.toString();
      map['drink'] = global.selectDrinkinghabbit.toString();
      map['bodytype'] = global.selectedBodyType.toString();
      map['skintone'] = global.selectedSkinTon.toString();

      map['weight'] = global.weight.toString();
      map['height'] = global.feet + global.inch;
      map['state'] = "Gujarat";
      map['city'] = global.myCity;
      if (global.userVillage != 'select village') {
        map['village'] = global.userVillage;
      }
      map['father_name'] = global.fatherName.toString();
      map['mother_name'] = global.motherName.toString();

      map['education_name'] = global.selectEducation;
      map['employee_in'] = global.selectedEmployee.toString();
      map['occupation'] = global.selectedOccupation;
      map['designation'] = global.seleDesignation;
      map['famliy_city'] = global.faimilyCity;
      if (global.faimilyVillage != 'select village') {
        map['famliy_village'] = global.faimilyVillage;
      }

      map['manglik'] = global.selectedManglik;
      map['star'] = global.selectedStar;
      map['horoscope'] = global.sselectedHoroscope;
      map['gothra'] = global.gautra;
      map['moonsign'] = '';

      // var response = await http.post(url, body: map);
      final request = http.MultipartRequest('POST', url);
      request.headers.addAll({"cookie": "humans_21909=1"});
      if (global.image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
              "profile_image", global.image!.path),
        );
      }
      request.fields.addAll(map);

      final res = await request.send();

      final response = await http.Response.fromStream(res);
      final responseData = json.decode(response.body);

      if (responseData['status'] == false) {
        util().showSnackBar(ctx, responseData['message'], Colors.red);
      } else {
        util().showSnackBar(ctx, responseData['message'], Colors.green);

        Get.to(LoginScreen());
      }
      return responseData;
    } catch (e) {
      print(e.toString());
    }
  }
}
