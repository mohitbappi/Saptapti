import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/global.dart' as global;

import '../Model/motherTongueModel.dart';

class Register2Controller extends GetxController {
  RxBool isLoading = false.obs;

  String selectedMaratialStatus = '';
  String selectedEatingHabbit = '';
  String selectedSmokingHabbit = '';
  String selectedDrinkingHabbit = '';
  String selectedBodyType = '';
  String selectedSkinTone = '';
  String selectedvillage = '';

  City? selectedCity;

  List<String> maratialStatus = [];
  List<String> eatingHabbit = [];
  List<String> smokingHabbit = [];
  List<String> drinkingHabbit = [];
  List<String> bodyType = [];
  List<String> skinTone = [];
  List<City> city = [];
  List<dynamic> village = [];

  @override
  void onInit() async {
    await getEatinghabbit();
    await getMaratialStatus();
    await getDrinkinghabbit();
    await getSmokinghabbit();
    await getSkinTone();
    await getBodyType();
    await getVillage();
    await getCity();
    super.onInit();
  }

  getEatinghabbit() async {
    isLoading.value = true;
    // maratialStatus = [];
    try {
      var url = Uri.parse(global.baseURL + global.eatinghabbit);
      var response = await http.get(url);
      if (response.statusCode == 200 && eatingHabbit.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          eatingHabbit.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedEatingHabbit = eatingHabbit[1];
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

  getMaratialStatus() async {
    isLoading.value = true;
    // maratialStatus = [];
    try {
      var url = Uri.parse(global.baseURL + global.maratialStatus);
      var response = await http.get(url);
      if (response.statusCode == 200 && maratialStatus.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          maratialStatus.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedMaratialStatus = maratialStatus[0];
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

  getDrinkinghabbit() async {
    isLoading.value = true;
    // maratialStatus = [];
    try {
      var url = Uri.parse(global.baseURL + global.drinkingHabbit);
      var response = await http.get(url);
      if (response.statusCode == 200 && drinkingHabbit.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          drinkingHabbit.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedDrinkingHabbit = drinkingHabbit[0];
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

  getSmokinghabbit() async {
    isLoading.value = true;
    // maratialStatus = [];
    try {
      var url = Uri.parse(global.baseURL + global.smokinghabbit);
      var response = await http.get(url);
      if (response.statusCode == 200 && smokingHabbit.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          smokingHabbit.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedSmokingHabbit = smokingHabbit[0];
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

  getSkinTone() async {
    isLoading.value = true;
    // maratialStatus = [];
    try {
      var url = Uri.parse(global.baseURL + global.skinTone);
      var response = await http.get(url);
      if (response.statusCode == 200 && skinTone.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          skinTone.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedSkinTone = skinTone[1];
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

  getBodyType() async {
    isLoading.value = true;
    // maratialStatus = [];
    try {
      var url = Uri.parse(global.baseURL + global.bodyType);
      var response = await http.get(url);
      if (response.statusCode == 200 && bodyType.isEmpty) {
        var data = json.decode(response.body);
        for (var item in data['response']) {
          bodyType.add(item.toString());
        }
        // manglik.addAll(data['response']);
        selectedBodyType = bodyType[1];
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
      selectedvillage = val;
      print(selectedvillage);

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
}
