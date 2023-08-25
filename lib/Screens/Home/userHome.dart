import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/Auth/contact_us.dart';
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/Screens/Home/Inbox/inbox.dart';
import 'package:saptapti/Screens/Home/homeEmptyUser.dart';
import 'package:saptapti/Screens/Home/payment.dart';
import 'package:saptapti/Screens/homeScreen.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/color.dart' as color;
import 'package:saptapti/util.dart';
import 'package:image_picker/image_picker.dart';

import '../../Controller/userHomeController.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

List<dynamic> privacy = [
  "Public",
  "Private",
];
String selectedPrivacy = "Public";

UserHomeController controller = Get.put(UserHomeController());

class _UserHomeState extends State<UserHome> {
  String _userName = '';
  String _userProfilePhoto = '';

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final userName = await SharedPrefs.getUserName();
    final userProfilePhoto = await SharedPrefs.getUserProfile();

    setState(() {
      _userName = userName;
      _userProfilePhoto = userProfilePhoto;
    });
  }

  Future pickImage(src) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if (image == null) return;
      final imageTemp = File(image.path);

      await controller.uploadUserProfile(imageTemp);
      setState(() {
        _userProfilePhoto = controller.imageUrl;
      });
      await SharedPrefs.saveUserProfile(controller.imageUrl);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _onNavigate({int index = 0}) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(
          tabIndex: 2,
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                          color: color.body1,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: "image From",
                                      backgroundColor: color.body,
                                      titleStyle:
                                          const TextStyle(color: Colors.white),
                                      middleTextStyle:
                                          const TextStyle(color: Colors.white),
                                      content: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              pickImage(ImageSource.camera);
                                              Get.back();
                                            },
                                            child: util().simpleButton(200.0,
                                                "From Camera", color.body1),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              pickImage(ImageSource.gallery);
                                              Get.back();
                                            },
                                            child: util().simpleButton(200.0,
                                                "From gallery", color.body1),
                                          ),
                                        ],
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage: _userProfilePhoto.isEmpty
                                      ? NetworkImage(
                                          controller.userStatus['imageurl'])
                                      : NetworkImage(_userProfilePhoto),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                _userName,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.edit_note_sharp,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const VerticalDivider(
                                    color: Colors.white,
                                    thickness: 3,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: color.darkGrey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 30,
                                          ),
                                          value: selectedPrivacy,
                                          onChanged: (val) {
                                            controller.changePrivacy(
                                                val == "Private" ? 1 : 0);
                                            setState(() {
                                              selectedPrivacy = val!;
                                            });
                                          },
                                          isExpanded: true,
                                          items: privacy.map((item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item.toString()),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Account Type ${controller.userStatus['payment_status']}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.28,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              util().simpleText("MEMBERSHIP PLAN"),
                              util().simpleText(
                                  "Benifits of premium Memebership Plan"),
                              Container(
                                width: 200,
                                height: 80,
                                // color: Colors.grey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.local_play_rounded),
                                        util()
                                            .simpleText("View profile picture")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.local_play_rounded),
                                        util()
                                            .simpleText("View Contact Details")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.local_play_rounded),
                                        util().simpleText("Chat")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => const PaymentScreen(),
                                    ),
                                  );
                                },
                                child: util().simpleButton(
                                    200.0, "Go Premium", color.body1),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          color: Colors.black.withOpacity(0.7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Connection Sent",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () => _onNavigate(index: 2),
                                child: const Text(
                                  "View More Connect",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          color: Colors.black.withOpacity(0.7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Viewed My profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () => _onNavigate(index: 3),
                                child: const Text(
                                  "View More",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          color: Colors.black.withOpacity(0.7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Connect Received",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: _onNavigate,
                                child: const Text(
                                  "View More",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Quick Links",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              const ContactUsScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.support_agent,
                                            color: color.body,
                                          ),
                                          Text(
                                            "Customer Support",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: color.body,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await SharedPrefs.removeUser();
                                      Get.offAll(HomeEptyUser());
                                    },
                                    child: Container(
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.logout_outlined,
                                            color: color.body,
                                          ),
                                          Text(
                                            "Log Out",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: color.body,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          )),
    );
  }
}
