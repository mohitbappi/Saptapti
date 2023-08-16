import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/Auth/loginSreen.dart';
import 'package:saptapti/Screens/Auth/register2.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/global.dart';
import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;

import '../../Controller/register4Controller.dart';
import '../../Controller/registerController.dart';

String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp regExp = RegExp(patttern);
String emailPatttern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp emailRegExp = RegExp(emailPatttern);

class Register1 extends StatefulWidget {
  Register1({Key? key}) : super(key: key);

  @override
  State<Register1> createState() => _Register1State();
}

registerController controller = registerController();
Register4Controller reg4 = Register4Controller();

String gender = 'male';

class _Register1State extends State<Register1> {
  TextEditingController mobileNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  bool _isError = false;

  @override
  void initState() {
    super.initState();
  }

  bool checkValidation() {
    return ((mobileNo.text.trim().isNotEmpty &&
            regExp.hasMatch(mobileNo.text)) &&
        (mail.text.trim().isNotEmpty && emailRegExp.hasMatch(mail.text)) &&
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        password.text.isNotEmpty);
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
              : Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
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
                    Positioned(
                      top: 20,
                      right: MediaQuery.of(context).size.width * 0.17,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Personal details',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'We will find the best match for you quickly',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
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
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              util().simpleText("Gender"),
                              RadioListTile(
                                title: const Text("Male"),
                                value: "male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text("Female"),
                                value: "female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),

                              util().simpleText('Mobile Number'),
                              //Colors.black(),
                              util().inputTextfield(
                                hint: 'Mobile Number',
                                label: 'Mobile Number',
                                keybordType: TextInputType.number,
                                controller: mobileNo,
                                errorMessage: (_isError &&
                                        (mobileNo.text.isEmpty ||
                                            !regExp.hasMatch(mobileNo.text)))
                                    ? 'Please enter valid mobile number'
                                    : '',
                              ),
                              const SizedBox(),
                              util().simpleText("First Name"),
                              util().inputTextfield(
                                hint: 'First Name',
                                label: 'First Name',
                                controller: firstName,
                                errorMessage:
                                    (_isError && firstName.text.isEmpty)
                                        ? 'Please enter first name'
                                        : '',
                              ),
                              const SizedBox(),
                              util().simpleText("Last Name"),
                              util().inputTextfield(
                                hint: 'Last Name',
                                label: 'Last Name',
                                controller: lastName,
                                errorMessage:
                                    (_isError && lastName.text.isEmpty)
                                        ? 'Please enter last name'
                                        : '',
                              ),
                              const SizedBox(),
                              util().simpleText("Email Address"),
                              util().inputTextfield(
                                hint: 'Last Name',
                                label: 'Email Address',
                                controller: mail,
                                errorMessage: (_isError &&
                                        (mail.text.isEmpty ||
                                            !emailRegExp.hasMatch(mail.text)))
                                    ? 'Please enter valid email'
                                    : '',
                              ),
                              const SizedBox(),
                              util().simpleText("Password"),
                              util().inputTextfield(
                                hint: 'Password',
                                label: 'Password',
                                controller: password,
                                errorMessage:
                                    (_isError && password.text.isEmpty)
                                        ? 'Please enter password'
                                        : '',
                              ),
                              const SizedBox(height: 33),
                              InkWell(
                                onTap: () async {
                                  print(
                                      'checkValidation=== ${checkValidation()}');
                                  if (checkValidation()) {
                                    setState(() {
                                      _isError = false;
                                    });
                                    await SharedPrefs.saveUseMobile(
                                        mobileNo.text);
                                    await SharedPrefs.saveUseFname(
                                        firstName.text);
                                    await SharedPrefs.saveUseLname(
                                        lastName.text);
                                    await SharedPrefs.saveUseemail(mail.text);
                                    await SharedPrefs.saveUsePassword(
                                        password.text);

                                    print(reg4.fname);
                                    Get.to(Register2());
                                  } else {
                                    setState(() {
                                      _isError = true;
                                    });
                                  }
                                },
                                child: util().simpleButton(
                                    500.0, "Save & Continue", Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 20,
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
