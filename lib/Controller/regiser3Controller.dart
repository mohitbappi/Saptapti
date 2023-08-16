import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/global.dart' as global;

import '../Model/motherTongueModel.dart';

class Register3Controller extends GetxController {
  RxBool isLoading = false.obs;

  String selectedManglik = '';
  String selectedStar = '';
  String selectedVillage = '';

  City? selectedCity;
  String selectedHoroscope = 'Yes';

  List<City> city = [];
  List<String> star = [];
  List<String> manglik = [];
  List<String> village = [];

  List<String> horoscope = [
    "Yes",
    "No",
  ];

  @override
  void onInit() async {
    await getCity();
    await getManglik();
    await getStar();
    await getVillage();
    isLoading.value = false;
    super.onInit();
  }

  getVillage() async {
    isLoading.value = true;
    try {
      var url = Uri.parse(global.baseURL + global.familyVillage);
      var response = await http.get(url);
      if (response.statusCode == 200 && village.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          village.add(item);
        }
        // village = data['response'];
      } else {
        print('Failed to fetch religion table');
      }
      String val = village[0];
      selectedVillage = val;
      print(selectedVillage);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  getCity() async {
    isLoading.value = true;
    try {
      var url = Uri.parse(global.baseURL + global.familyCity);
      var response = await http.get(url);
      if (response.statusCode == 200 && city.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          city.add(City(
            id: int.parse(item['id']),
            status: item['status'],
            city_name: item['city_name'],
            country_id: item['country_id'],
            state_id: item['state_id'],
            is_deleted: item['is_deleted'],
          ));
        }
        selectedCity = city[0];
        isLoading.value = false;
      } else {
        isLoading.value = false;

        print('Failed to fetch religion table');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  getStar() async {
    isLoading.value = true;
    // star = [];
    try {
      var url = Uri.parse(global.baseURL + global.star);
      var response = await http.get(url);
      if (response.statusCode == 200 && star.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          star.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedStar = star[0];
        isLoading.value = false;
      } else {
        isLoading.value = false;

        print('Failed to fetch religion table');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  getManglik() async {
    isLoading.value = true;
    manglik = [];
    try {
      var url = Uri.parse(global.baseURL + global.manglik);
      var response = await http.get(url);
      if (response.statusCode == 200 && manglik.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          manglik.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedManglik = manglik[0];
        isLoading.value = false;
      } else {
        isLoading.value = false;

        print('Failed to fetch religion table');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
