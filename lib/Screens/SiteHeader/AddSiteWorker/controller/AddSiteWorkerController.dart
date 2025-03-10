import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/addworkmodel.dart';
import '../view/SiteHeadAddSiteWorkerScreen.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class AddSiteWorkerController extends GetxController {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  String Assoicate = assoicatedrop.first;
  String work = worktypedrop.first;
  var dropname = "";
  bool passwordVisible = false;
  List<List<String>> dropdownOptions = [
    ["Option 1", "Option 2", "Option 3"],
    ["Apple", "Banana", "Mango"],
    ["Red", "Green", "Blue"]
  ];
  List<String> dropdownValues = [];
  var timepicker = "";
  String lat = "";
  String long = "";

  // Position? position;
  bool isLoading = false;

// Fetch data from API
}
