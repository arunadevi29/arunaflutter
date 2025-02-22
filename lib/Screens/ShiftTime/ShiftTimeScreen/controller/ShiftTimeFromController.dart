import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../CommenFiles/functions.dart';
import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../widgets/AppBarSample.dart';
import '../model/ShiftTimeModel.dart';

class ShifttimeformController extends GetxController {
  TextEditingController SelectWorkTypeController = TextEditingController();
  TextEditingController SelectShiftController = TextEditingController();
  TextEditingController FromshiftController = TextEditingController();
  TextEditingController ToshiftController = TextEditingController();
  String SelectWorkTypedrop = 'House Keepping';
  String SelectShiftdrop = 'First Shift';
  var dropname = "";
  RxBool loader = false.obs;
  RxString date = "".obs;
  RxString time = "".obs;

  RxBool refreshLoader = false.obs;
  final RxString randomImage = "".obs;
  RxString selectedId = "".obs;

  SampleItem? selectedItem;

  var items = [
    'House Keepping',
    'Security',
    'watchman',
  ];
  var Shifts = [
    'First Shift',
    'Second Shift',
    'Night Shift',
  ];
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  File? image;
  String? dateTime;

  // Function to capture an image using the camera
  Future<void> captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      // Get current date and time
      dateTime = DateTime.now().toString();
    }
  }

  var shifttimeApiData = ShiftTimeModel().obs;

  Future<void> postData() async {
    print('WorkType ${SelectWorkTypeController.text}');
    print('ShiftName ${SelectShiftController.text}');
    print('ShiftFrom ${FromshiftController.text}');
    print('ShiftTo ${ToshiftController.text}');
    // print('userId ${memberId}');
    try {
      final response = await http.post(
        Uri.parse('https://mobileappapi.onrender.com/api/shift/create'),
        // Change this to your actual API
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
        // body: {
        //   "WorkType": SelectWorkTypeController.text,
        //   "ShiftName": SelectShiftController.text,
        //   "ShiftFrom": FromshiftController.text,
        //   "ShiftTo": ToshiftController.text,
        //   "user_id": "user_id"
        // },
        body: jsonEncode({
          "WorkType": "House Keeping",
          "ShiftName": "Morning Shift",
          "ShiftFrom": "08:00:00",
          "ShiftTo": "16:00:00",
          "user_id": "user_id"
        }),
      );

      if (response.statusCode == 201) {
        print("Data added successfully: ${response.body}");
        eventListApi();
      } else {
        print("Failed with status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // eventListApi() async {

  eventListApi() async {
    final response = await http
        .get(Uri.parse('https://mobileappapi.onrender.com/api/shift/all'));

    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var shifttime = ShiftTimeModel.fromJson(responseJson);
      print(shifttime);
      print(responseJson);
    } else {
      print("error!");
    }

    return responseJson;
  }
}
