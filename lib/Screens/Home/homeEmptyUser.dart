import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/Auth/contact_us.dart';
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/Screens/Auth/registerScreen.dart';
import 'package:saptapti/Screens/Auth/tnc_privacy.dart';

import '../../util.dart';
import 'package:saptapti/color.dart' as color;

class HomeEptyUser extends StatefulWidget {
  const HomeEptyUser({super.key});

  @override
  State<HomeEptyUser> createState() => _Register5State();
}

class _Register5State extends State<HomeEptyUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 70,
          color: color.body,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ContactUsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Contact us | ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const TncAndPrivacyScreen(
                            headerTitle: 'Terms and Conditions',
                            isTnc: true,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Terms & Conditions | ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const TncAndPrivacyScreen(
                            headerTitle: 'Privacy',
                            isTnc: false,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Privacy | ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Faq",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                "Copyright 2023 By kolisaptapadi.All Right",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Reserved",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'asset/image/logo.jpeg',
                      width: 80.0,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: const Text(
                            "login",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: color.body1),
                          ),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterScreen());
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: color.body1),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Image.asset(
                'asset/image/couple4.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: color.body),
                child: const Column(
                  children: [
                    Text(
                      "A trusted place for the young men and women of",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "Our society to find their favorite life partner",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        Text(
                          "Register today for free",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        Text(
                          "Meet your partner",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    InkWell(
                      child: util().simpleButton(
                        300.0,
                        "Let's find your match",
                        color.body,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'asset/image/couple4.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                // height: 250,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: const Column(
                  children: [
                    Text(
                      "WHY CHOOSE KOLI SAPTAPADI",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "kolisaptapadi. is emerging as one of india's most trusted Application for matchmaking services and is remarkably known for being the koli community's most deserving matchmarking application.",
                      style: TextStyle(
                        fontSize: 20,
                        color: color.body,
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "This website will be helful for parents who are lookin for the perfect life partner for their daughter or son.it will help youngsters to find their parfect life partner this website is for koli community only.",
                      style: TextStyle(fontSize: 20, color: color.body),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Text(
                    "How It Work",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.account_circle_outlined,
                              size: 35, color: color.body),
                          Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color.body),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.badge_outlined,
                              size: 35, color: color.body),
                          Text(
                            "Browse Profiles",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color.body),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.autorenew_sharp,
                              size: 35, color: color.body),
                          Text(
                            "Connect",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color.body),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.compare_arrows_rounded,
                              size: 35, color: color.body),
                          Text(
                            "Interact",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color.body),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Text(
                  //   "Browse Profiles",
                  //   style:
                  //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   "Connect",
                  //   style:
                  //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   "Interact",
                  //   style:
                  //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
