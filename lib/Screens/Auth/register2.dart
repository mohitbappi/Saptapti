import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Model/motherTongueModel.dart';
import 'package:saptapti/Screens/Auth/register3.dart';
import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;
import 'package:saptapti/global.dart' as global;

import '../../Controller/register2Controller.dart';

class Register2 extends StatefulWidget {
  Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

Register2Controller controller = Get.put(Register2Controller());

class _Register2State extends State<Register2> {
  late TextEditingController weight;
  late TextEditingController feet;
  late TextEditingController inch;
  final Register2Controller controller = Get.put(Register2Controller());
  String check = 'Unmarried';

  @override
  void initState() {
    super.initState();

    weight = TextEditingController();
    feet = TextEditingController();
    inch = TextEditingController();
    getdata();
  }

  getdata() async {
    await controller.getEatinghabbit();
    await controller.getMaratialStatus();
    await controller.getDrinkinghabbit();
    await controller.getSmokinghabbit();
    await controller.getSkinTone();
    await controller.getBodyType();
    await controller.getVillage();
    await controller.getCity();
  }

  @override
  void dispose() {
    weight.dispose();
    feet.dispose();
    inch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Stack(
                    children: [
                      Image.asset(
                        'asset/image/couple4.jpg',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 330,
                        bottom: 150,
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
                  top: 20,
                  left: MediaQuery.of(context).size.width * 0.17,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Food and',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Life Style',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              decoration: BoxDecoration(
                  // border: Border.all(),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70.0),
                      topRight: Radius.circular(70.0)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundColor: color.body,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Your marital status?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
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
                                        value:
                                            controller.selectedMaratialStatus,
                                        onChanged: (val) {
                                          setState(() {
                                            controller.selectedMaratialStatus =
                                                val!;
                                          });
                                        },
                                        isExpanded: true,
                                        items: controller.maratialStatus
                                            .map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item.toString()),
                                          );
                                        }).toList(),
                                      ),
                                    )),
                              ),

                              //habits
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Your eating habit?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
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
                                      value: controller.selectedEatingHabbit
                                          .toString(),
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedEatingHabbit =
                                              val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items:
                                          controller.eatingHabbit.map((item) {
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
                              const Text(
                                "Your smoking habit?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
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
                                      value: controller.selectedSmokingHabbit,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedSmokingHabbit =
                                              val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items:
                                          controller.smokingHabbit.map((item) {
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
                              const Text(
                                "Your drinking habit?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
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
                                      value: controller.selectedDrinkingHabbit,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedDrinkingHabbit =
                                              val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items:
                                          controller.drinkingHabbit.map((item) {
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
                              const Text(
                                "Your Body type?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
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
                                      value: controller.selectedBodyType,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedBodyType = val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.bodyType.map((item) {
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
                              const Text(
                                "Your Skin tone?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
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
                                      value: controller.selectedSkinTone,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedSkinTone = val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.skinTone.map((item) {
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
                              const Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              util().inputTextfield(
                                  hint: 'weight',
                                  label: 'weight',
                                  keybordType: TextInputType.number,
                                  controller: weight),
                              const SizedBox(
                                height: 10,
                              ),
                              util().simpleText('Height (Feet ,Inch)'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: util().inputTextfield(
                                        hint: 'Feet',
                                        label: 'Feet',
                                        keybordType: TextInputType.number,
                                        controller: feet),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: util().inputTextfield(
                                        hint: 'Inch',
                                        label: 'Inch',
                                        keybordType: TextInputType.number,
                                        controller: inch),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Where Do You live?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Select your city",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                      value: controller.selectedvillage,
                                      onChanged: (val) {
                                        setState(() {
                                          controller.selectedvillage = val!;
                                        });
                                      },
                                      isExpanded: true,
                                      items: controller.village.map((item) {
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
                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: color.body),
                              //     borderRadius:
                              //         BorderRadius.circular(10.0),
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 8.0),
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton<String>(
                              //         icon: const Icon(
                              //           Icons.keyboard_arrow_down_sharp,
                              //           size: 30,
                              //         ),
                              //         value: controller.selectedvillage,
                              //         onChanged: (val) {
                              //           setState(() {
                              //             controller.selectedvillage =
                              //                 val!;
                              //           });
                              //         },
                              //         isExpanded: true,
                              //         items: controller.village
                              //             .map((item) {
                              //           return DropdownMenuItem<String>(
                              //             value: item,
                              //             child: Text(item.toString()),
                              //           );
                              //         }).toList(),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  global.selectedMaritStatus =
                                      controller.selectedMaratialStatus;
                                  global.selectEatinghabbit =
                                      controller.selectedEatingHabbit;
                                  global.selectDrinkinghabbit =
                                      controller.selectedDrinkingHabbit;
                                  global.selectSmokinghabbit =
                                      controller.selectedSmokingHabbit;
                                  global.selectedBodyType =
                                      controller.selectedBodyType;
                                  global.selectedSkinTon =
                                      controller.selectedSkinTone;
                                  global.weight = weight.text.trim();
                                  global.feet = feet.text.trim();
                                  global.inch = inch.text.trim();
                                  global.userVillage =
                                      controller.selectedvillage;
                                  // global.myState = controller
                                  //     .selectedState!.state_name;
                                  global.myCity =
                                      controller.selectedCity!.id.toString();

                                  Get.to(Register3());
                                },
                                child: util().simpleButton(
                                    500.0, "Save & Continue", Colors.blueGrey),
                              ),
                            ],
                          ),
                  ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
