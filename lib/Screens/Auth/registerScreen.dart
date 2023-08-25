import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:saptapti/Controller/registerController.dart';
import 'package:saptapti/Model/motherTongueModel.dart';
import 'package:saptapti/Screens/Auth/register1.dart';
import 'package:saptapti/main.dart';
import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;
import 'package:saptapti/global.dart' as global;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

registerController controller = Get.put(registerController());

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    getData();
    setState(() {
      global.selectedDate;
      global.selectedTime;
    });
    controller.onInit();
    super.initState();
  }

  getData() async {
    await controller.getSubCast();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        global.selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month, now.day);
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: firstDate,
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      if (pickedDate != null) {
        setState(() {
          global.selectedDate;
        });
        _selectTime(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        // const Positioned(
        //   top: 0,
        //   right: 0,
        //   left: 0,
        //   bottom: 600,
        //   child: Icon(Icons.arrow_back_ios),
        // ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: MediaQuery.of(context).size.height * 0.60,
          child: Stack(
            children: [
              Image.asset(
                'asset/image/couple3.jpg',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 330,
                bottom: 230,
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
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: const Radius.circular(40)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Profile Create for ",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 30,
                                ),
                                value: controller.selectedReligion,
                                onChanged: (val) {
                                  setState(() {
                                    controller.selectedReligion = val!;
                                  });
                                },
                                isExpanded: true,
                                items: controller.religionTableData.map((item) {
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
                          "Date Of Birth",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(color: color.body),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: global.selectedDate != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(DateFormat.yMd()
                                              .format(DateTime.parse(global
                                                  .selectedDate
                                                  .toString()))
                                              .toString()),
                                          Text(MaterialLocalizations.of(context)
                                              .formatTimeOfDay(
                                                  global.selectedTime)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      )
                                    : Text('Select'),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const Text(
                        //   "Mother Tongue",
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Text(controller.selectedmothertongue),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: color.body),
                        //     borderRadius: BorderRadius.circular(10.0),
                        //   ),
                        //   child: Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(horizontal: 8.0),
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton<Language>(
                        //         icon: const Icon(
                        //           Icons.keyboard_arrow_down_sharp,
                        //           size: 30,
                        //         ),
                        //         value: controller.selectedmothertongue,
                        //         onChanged: (Language? selectedLanguage) {
                        //           setState(() {
                        //             controller.selectedmothertongue =
                        //                 selectedLanguage;
                        //             global.selemothertongue =
                        //                 selectedLanguage!.name.toString();
                        //             print(global.selemothertongue);
                        //           });
                        //         },
                        //         isExpanded: true,
                        //         items: controller.languages
                        //             .map((Language language) {
                        //           return DropdownMenuItem<Language>(
                        //             value: language,
                        //             child: Text(language.name),
                        //           );
                        //         }).toList(),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // const Text(
                        //   "Religion",
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),

                        const Text(
                          "Sub-Cast",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(color: color.body),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Subcast>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 30,
                                ),
                                value: controller.selectedSubcast,
                                onChanged: (Subcast? subcast) {
                                  setState(() {
                                    controller.selectedSubcast = subcast;
                                    global.seleSubcast = controller
                                        .selectedSubcast!.subcaste_id
                                        .toString();
                                  });
                                },
                                isExpanded: true,
                                items:
                                    controller.subCast.map((Subcast subcast) {
                                  return DropdownMenuItem<Subcast>(
                                    value: subcast,
                                    child: Text(subcast.caste_name),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.saveContinue(context);
                          },
                          child: util().simpleButton(
                              500.0, "Save & Continue", Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ])),
    );
  }
}
