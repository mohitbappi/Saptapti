import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String valueSharedPreferences = '';

// Write DATA
  static Future<bool> saveUserName(name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('name', name);
  }

  static Future<bool> saveUserProfile(url) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('profilePhoto', url);
  }

  static Future<bool> saveUseMobile(mobile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('mobile', mobile);
  }

  static Future<bool> saveUseFname(fname) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('fname', fname);
  }

  static Future<bool> saveUseLname(lname) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('lname', lname);
  }

  static Future<bool> saveUseemail(email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('email', email);
  }

  // static Future<bool> saveUsePass(pass) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return await sharedPreferences.setString('pass', pass);
  // }

  static Future<bool> saveUsePassword(password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('password', password);
  }

  static Future<bool> saveToken(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('token', token);
  }

  static Future<bool> saveStateId(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('stateId', id);
  }

  static Future<bool> saveCityId(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('cityId', id);
  }

  static Future<bool> saveGender(gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('gender', gender);
  }

  static Future<bool> saveUserId(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('id', id);
  }

// Read Data

  static Future getStateId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('stateId');
  }

  static Future getCityId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('cityId');
  }

  static Future getGender() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('gender');
  }

  static Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('name');
  }

  static Future getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('profilePhoto');
  }

  static Future getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('id');
  }

  static Future getUserMobile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('mobile');
  }

  static Future getUserFname() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('fname');
  }

  static Future getUserLname() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('lname');
  }

  static Future getUseremail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('email');
  }

  static Future getUserPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('password');
  }

  static Future getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  static Future removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.remove('token');
    return sharedPreferences.remove('name');
  }
}
