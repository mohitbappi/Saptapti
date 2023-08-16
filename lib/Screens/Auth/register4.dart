import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saptapti/Model/motherTongueModel.dart';

import 'package:saptapti/color.dart' as color;
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/util.dart';

import '../../Controller/register4Controller.dart';

class Register4 extends StatefulWidget {
  const Register4({super.key});

  @override
  State<Register4> createState() => _Register4State();
}

Register4Controller controller = Get.put(Register4Controller());

class _Register4State extends State<Register4> {
  late TextEditingController company = TextEditingController();
  late TextEditingController income = TextEditingController();
  late TextEditingController fatherOcc = TextEditingController();
  late TextEditingController motherOcc = TextEditingController();
  @override
  void initState() {
    super.initState();

    setState(() {
      image;
    });
  }

  File? image;

  Future pickImage(src) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if (image == null) return;
      final imageTemp = File(image.path);
      global.image = imageTemp;

      this.image = imageTemp;
      setState(() {});
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'asset/image/couple3.jpg',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 330,
                            bottom: 120,
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
                          const Positioned(
                            top: 50,
                            left: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Education',
                                  style: TextStyle(
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Details',
                                  style: TextStyle(
                                      fontSize: 31,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                                    '4',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40)),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Education",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: color.body),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<Education>(
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: 30,
                                              ),
                                              value:
                                                  controller.selectedEducation,
                                              onChanged:
                                                  (Education? education) {
                                                setState(() {
                                                  controller.selectedEducation =
                                                      education;
                                                });
                                              },
                                              isExpanded: true,
                                              items: controller.education
                                                  .map((Education city) {
                                                return DropdownMenuItem<
                                                    Education>(
                                                  value: city,
                                                  child:
                                                      Text(city.education_name),
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
                                        "Employee in",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: color.body),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                                  controller.selectedEmployee,
                                              onChanged: (val) {
                                                setState(() {
                                                  controller.selectedEmployee =
                                                      val!;
                                                });
                                              },
                                              isExpanded: true,
                                              items: controller.empoloyee
                                                  .map((item) {
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
                                        "Occupation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: color.body),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<Occupation>(
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: 30,
                                              ),
                                              value:
                                                  controller.selectedOccupation,
                                              onChanged:
                                                  (Occupation? occupation) {
                                                setState(() {
                                                  controller
                                                          .selectedOccupation =
                                                      occupation;
                                                });
                                              },
                                              isExpanded: true,
                                              items: controller.occupation
                                                  .map((Occupation occupation) {
                                                return DropdownMenuItem<
                                                    Occupation>(
                                                  value: occupation,
                                                  child: Text(occupation
                                                      .occupation_name),
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
                                        "Designation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: color.body),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<Designation>(
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: 30,
                                              ),
                                              value: controller
                                                  .selectedDesignation,
                                              onChanged:
                                                  (Designation? designation) {
                                                setState(() {
                                                  controller
                                                          .selectedDesignation =
                                                      designation;
                                                  global.seleDesignation =
                                                      designation!
                                                          .designation_name
                                                          .toString();
                                                });
                                              },
                                              isExpanded: true,
                                              items: controller.designation.map(
                                                  (Designation designation) {
                                                return DropdownMenuItem<
                                                    Designation>(
                                                  value: designation,
                                                  child: Text(designation
                                                      .designation_name),
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
                                        "Company name?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      util().inputTextfield(
                                          hint: 'Company name',
                                          label: 'Company name',
                                          controller: company),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "What is your annual income?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      util().inputTextfield(
                                          hint: '',
                                          label: 'annualincome',
                                          controller: income),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Your Father occupation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      util().inputTextfield(
                                          hint: '',
                                          label: 'Father occupation',
                                          controller: fatherOcc),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Your Mother occupation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      util().inputTextfield(
                                        hint: '',
                                        label: 'Mother occupation',
                                        controller: motherOcc,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      image == null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                const Text(
                                                  "Upload your pic",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                        title: "image From",
                                                        backgroundColor: color
                                                            .body,
                                                        titleStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .white),
                                                        middleTextStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .white),
                                                        content: Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                pickImage(
                                                                    ImageSource
                                                                        .camera);
                                                                Get.back();
                                                              },
                                                              child: util()
                                                                  .simpleButton(
                                                                      200.0,
                                                                      "From Camera",
                                                                      color
                                                                          .body1),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                pickImage(
                                                                    ImageSource
                                                                        .gallery);
                                                                Get.back();
                                                              },
                                                              child: util()
                                                                  .simpleButton(
                                                                      200.0,
                                                                      "From gallery",
                                                                      color
                                                                          .body1),
                                                            ),
                                                          ],
                                                        ));
                                                    // Get.to(Register4());
                                                  },
                                                  child: util().simpleButton(
                                                      100.0,
                                                      "Upload",
                                                      Colors.red),
                                                ),
                                              ],
                                            )
                                          : Align(
                                              alignment: Alignment.center,
                                              child: CircleAvatar(
                                                radius: 40,
                                                backgroundImage: FileImage(
                                                    image!,
                                                    scale: 1.0),
                                              ),
                                            ),
                                      // Text(image!.path.split('/').last),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          global.selectEducation = controller
                                              .selectedEducation!.education_name
                                              .toString();
                                          global.selectedEmployee = controller
                                              .selectedEmployee
                                              .toString();
                                          global.selectedOccupation = controller
                                              .selectedOccupation!
                                              .occupation_name
                                              .toString();
                                          global.seleDesignation = controller
                                              .selectedDesignation!
                                              .designation_name
                                              .toString();

                                          global.companyName =
                                              company.text.trim();
                                          global.annualIncome =
                                              income.text.trim();
                                          global.fatherOccupation =
                                              fatherOcc.text.trim();
                                          global.motherOccupation =
                                              motherOcc.text.trim();
                                          await controller
                                              .postRegister(context);
                                          // Get.to(HomeEptyUser());
                                        },
                                        child: util().simpleButton(500.0,
                                            "Save & Continue", Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ], //childen
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
