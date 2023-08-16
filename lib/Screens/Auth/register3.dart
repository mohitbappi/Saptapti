import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;

import '../../Controller/regiser3Controller.dart';
import '../../Model/motherTongueModel.dart';
import 'register4.dart';
import 'package:saptapti/global.dart' as global;

class Register3 extends StatefulWidget {
  Register3({Key? key}) : super(key: key);

  @override
  State<Register3> createState() => _Register3State();
}

Register3Controller controller = Get.put(Register3Controller());

class _Register3State extends State<Register3> {
  late TextEditingController fatherName = TextEditingController();
  late TextEditingController motherName = TextEditingController();
  late TextEditingController gautra = TextEditingController();
  bool _isError = false;

  @override
  void initState() {
    super.initState();
  }

  bool checkValidation() {
    return (fatherName.text.isNotEmpty && motherName.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: MediaQuery.of(context).size.height * 0.60,
                      child: Stack(
                        children: [
                          Image.asset(
                            'asset/image/couple5.jpg',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 330,
                            bottom: 220,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: 15,
                        child: const Text(
                          "Horoscope",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: color.black),
                        )),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.75,
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0)),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundColor: color.body,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              util().simpleText('Where does your family live?'),
                              util().simpleText('Select you city'),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.body),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<City>(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                      ),
                                      value: controller.selectedCity,
                                      onChanged: (City? city) {
                                        setState(() {
                                          controller.selectedCity = city;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.city.map((City city) {
                                        return DropdownMenuItem<City>(
                                          value: city,
                                          child: Text(city.city_name),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.body),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                      ),
                                      value: controller.selectedVillage,
                                      onChanged: (village) {
                                        setState(() {
                                          controller.selectedVillage = village!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.village.map((village) {
                                        return DropdownMenuItem<String>(
                                          value: village,
                                          child: Text(village),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              util().simpleText("Father Name"),
                              const SizedBox(
                                height: 10,
                              ),
                              util().inputTextfield(
                                hint: 'father Name',
                                label: 'father Name',
                                controller: fatherName,
                                errorMessage:
                                    (_isError && fatherName.text.isEmpty)
                                        ? 'Please enter father name'
                                        : '',
                              ),
                              util().simpleText("Mother Name"),
                              const SizedBox(
                                height: 10,
                              ),
                              util().inputTextfield(
                                hint: 'Mother Name',
                                label: 'Mother Name',
                                controller: motherName,
                                errorMessage:
                                    (_isError && motherName.text.isEmpty)
                                        ? 'Please enter mother name'
                                        : '',
                              ),
                              util().simpleText("Horoscope details?"),
                              const SizedBox(
                                height: 10,
                              ),
                              util().simpleText("Select manglik?"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.body),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                      ),
                                      value: controller.selectedManglik,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedManglik = val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.manglik.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item.toString()),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              util().simpleText("Star?"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.body),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                      ),
                                      value: controller.selectedStar,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedStar = val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.star.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item.toString()),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              util().simpleText("Select horoscope"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.body),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                      ),
                                      value: controller.selectedHoroscope,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedHoroscope = val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.horoscope.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item.toString()),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              util().simpleText("Gothra"),
                              const SizedBox(
                                height: 10,
                              ),
                              util().inputTextfield(
                                  hint: "Gothra",
                                  label: "Gothra",
                                  controller: gautra),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  if (checkValidation()) {
                                    setState(() {
                                      _isError = false;
                                    });
                                    global.faimilyCity =
                                        controller.selectedCity!.city_name;
                                    global.faimilyVillage =
                                        controller.selectedVillage.toString();
                                    global.fatherName = fatherName.text.trim();
                                    global.motherName = motherName.text.trim();
                                    global.selectedManglik =
                                        controller.selectedManglik;
                                    global.selectedStar =
                                        controller.selectedStar;
                                    global.sselectedHoroscope =
                                        controller.selectedHoroscope;

                                    global.gautra = gautra.text.trim();

                                    print(global.selectedManglik);
                                    Get.to(Register4());
                                  } else {
                                    setState(() {
                                      _isError = true;
                                    });
                                  }
                                },
                                child: util().simpleButton(
                                    500.0, "Save & Continue", Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
