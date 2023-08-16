import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Controller/loginController.dart';
import 'package:saptapti/Screens/Auth/registerScreen.dart';
import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;

import '../../SharedPrefs/sharedprefs.dart';
import '../Home/home2.dart';
import '../homeScreen.dart';

String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp regExp = RegExp(patttern);

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController mobile = TextEditingController();
TextEditingController password = TextEditingController();

LoginController controller = LoginController();

class _LoginScreenState extends State<LoginScreen> {
  String mobileno = '';
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      mobileno;
    });
  }

  bool checkValidation() {
    if (mobile.text.trim().isEmpty || !regExp.hasMatch(mobile.text)) {
      return false;
    } else if (password.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: InkWell(
            onTap: () {
              Get.to(RegisterScreen());
            },
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: color.body3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have An Account?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: color.body2),
                  )
                ],
              ),
            ),
          ),
          body: CustomPaint(
            painter: ShapesPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: MediaQuery.of(context).size.height * 0.45,
                    child: Image.asset(
                      'asset/image/couple4.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      // margin: EdgeInsets.symmetric(horizontal: 20.0),
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: color.body,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(100))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Mobile Number",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          util().inputTextfield(
                            hint: "mobile",
                            label: "mobile",
                            controller: mobile,
                            Picon: Icons.phone_android_outlined,
                            errorMessage: (_isError &&
                                    (mobile.text.isEmpty ||
                                        !regExp.hasMatch(mobile.text)))
                                ? 'Please enter valid mobile number'
                                : '',
                            errorColor: Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          util().inputTextfield(
                            hint: "Password",
                            label: "Password",
                            password: true,
                            errorMessage: (_isError && password.text.isEmpty)
                                ? 'Please enter password'
                                : '',
                            keybordType: TextInputType.streetAddress,
                            controller: password,
                            Picon: Icons.key,
                            errorColor: Colors.white,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              if (checkValidation()) {
                                setState(() {
                                  _isError = false;
                                });
                                var responseData = await controller.login(
                                    mobile.text.trim(),
                                    password.text.trim(),
                                    context);

                                if (responseData['status']) {
                                  await SharedPrefs.saveToken(
                                      responseData['response']['token']);
                                  await SharedPrefs.saveGender(
                                      responseData['response']['gender']);
                                  await SharedPrefs.saveStateId(
                                      responseData['response']['state_id']);
                                  await SharedPrefs.saveCityId(
                                      responseData['response']['city']);
                                  await SharedPrefs.saveUserId(
                                      responseData['response']['user_id']);

                                  Get.offAll(HomeScreen());

                                  util().showSnackBar(
                                      context, "WelCome Back", Colors.green);
                                } else {
                                  util().showSnackBar(context,
                                      responseData['message'], Colors.red);
                                }
                              } else {
                                setState(() {
                                  _isError = true;
                                });
                              }
                            },
                            child: util().simpleButton(
                                MediaQuery.of(context).size.width,
                                "LOGIN",
                                color.body),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Center(
                              child: InkWell(
                                  child: Text(
                            "Forgot password?",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ))),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('asset/image/logo.jpeg'))),
                ],
              ),
            ),
          )),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // set the paint color to be white
    paint.color = Colors.white;

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);

    paint.color = Colors.yellow;

    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);

    // set the color property of the paint
    paint.color = Colors.deepOrange;

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 75.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
