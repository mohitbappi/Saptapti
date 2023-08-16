library global;

import 'dart:io';

import 'package:flutter/material.dart';

const String baseURL = "https://kolisaptapadi.in/Api/";
const String getReligion = 'get_religion_table';
const String mothertongue = 'mothertongue_table';
const String subCast = 'get_subcast';
const String familyCity = 'get_famaliy_city';
const String familyVillage = 'get_famaliy_village';
const String manglik = 'get_manglik';
const String star = 'get_star';
const String moonsign = 'get_moonsign';
const String login = 'login';
const String maratialStatus = 'maratial_status';
const String eatinghabbit = 'eatning_habit';
const String smokinghabbit = 'smoking_habit';
const String drinkingHabbit = 'get_drinking_habit';
const String bodyType = 'get_bodytype';
const String skinTone = 'get_skintone';
const String familyState = 'get_state_user';
const String education = 'get_education';
const String employee = 'get_employee';
const String occupation = 'get_occupation';
const String designation = 'get_designtation';
const String village = 'get_famaliy_village';
const String register = 'register';
const String contactUs = 'get_contactus';

String selemothertongue = '';
String seleSubcast = '';
String seleCity = '';
String seleState = '';
String seleEducation = '';
String seleOccupation = '';
String seleDesignation = '';
String weight = '';
String feet = '';
String inch = '';

DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();

String gender = 'Male';
String mobileNo = '';
String firstName = '';
String lastName = '';
String email = '';
String password = '';
String motherName = '';
String fatherName = '';
String gautra = '';
String faimilyCity = '';
String faimilyVillage = '';
String selectedManglik = '';
String selectedStar = '';
String sselectedHoroscope = '';
String profileFor = '';
String dob = '';
String selectedMaritStatus = '';
String selectEatinghabbit = '';
String selectDrinkinghabbit = '';
String selectSmokinghabbit = '';
String selectedBodyType = '';
String selectedSkinTon = '';
String myState = '';
String myCity = '';
String selectEducation = '';
String selectedEmployee = '';
String selectedOccupation = '';
String userVillage = '';

String selectedDesignation = '';

String companyName = '';
String annualIncome = '';
String fatherOccupation = '';
String motherOccupation = '';
File? image;
