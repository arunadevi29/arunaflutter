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

  var timepicker = "";
  String lat = "";
  String long = "";

  // Position? position;
  bool? isLoading;

// Fetch data from API


}
