import 'dart:async';
import 'dart:convert';

import 'package:attendanceapp/Screens/SiteHeader/WorkerList/model/worklistmodel.dart';
import 'package:attendanceapp/Screens/sample.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../CommenFiles/functions.dart';
import '../../../../CommenFiles/getXcontroller.dart';
import '../../../Admin/FacilityDetails/View/FacilityDetails.dart';
import '../../../UserListAddSiteHeader/model/SiteHeadListModel.dart';
import '../model/SinglehospitalModel.dart';
import '../model/Siteheadmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSiteHeadController extends GetxController {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  Map<String, List<SiteheadModel>> siteheadData = {};

  bool Loading = true;
  TextEditingController searchController = TextEditingController();
  bool passwordVisible = false;
  var dropname = "";
  final RxList<String> images = [
    "assets/images/1.png",
  ].obs;
  var data = [];
  List<SiteheadModel> results = [];
  var timepicker = "";
  String lat = "";
  String long = "";
  RxBool loader = false.obs;
  RxBool refreshLoader = false.obs;

  var isLoading = true.obs;
  RxBool isdiable = false.obs;

  ///postmethodapi////
  Future<void> addPostapi() async {
    String url =
        "https://mobileappapi.onrender.com/api/sitehead/create"; // Replace with your API endpoint

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "FirstName": FirstNameController.text,
          "LastName": LastNameController.text,
          "MobileNumber": MobileNumberController.text,
          "Field": FieldController.text,
          "FieldSiteName": FieldSiteNamerController.text,
          "Password": EnterPasswordController.text,
          "ConfirmPassword": ConfirmPasswordController.text,
          "Image": "img1.jpg".toString()
        }), // Convert object to JSON string
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        siteheadgetApi();
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  ////getmethod///

  Future<Map<String, List<SiteheadModel>>> siteheadgetApi(
      {String? query}) async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/sitehead/all'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<SiteheadModel>>(
                key,
                List<SiteheadModel>.from(
                    value.map((x) => SiteheadModel.fromMap(x)))));

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          final filteredSiteheads = siteheads.map((key, value) {
            final filteredList = value
                .where((site) =>
                    site.firstName
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.lastName.toLowerCase().contains(query.toLowerCase()) ||
                    site.field.toLowerCase().contains(query.toLowerCase()) ||
                    site.fieldSiteName
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .toList();
            return MapEntry(key, filteredList);
          });

          return filteredSiteheads;
        }

        return siteheads;
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Failed to load data: $e\n$stackTrace');
      throw Exception('Failed to load data: $e\n$stackTrace');
    }
  }

  Future<void> SiteheadUpdateapi(
    int siteheadid,
  ) async {
    String url =
        "https://mobileappapi.onrender.com/api/sitehead/update/$siteheadid"; // Update API URL

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": siteheadid,
          "FirstName": FirstNameController.text,
          "LastName": LastNameController.text,
          "MobileNumber": MobileNumberController.text,
          "Field": FieldController.text,
          "FieldSiteName": FieldSiteNamerController.text,
          "Password": EnterPasswordController.text,
          "ConfirmPassword": ConfirmPasswordController.text,
          "Image": "img1.jpg".toString()
        }), // Convert model to JSON
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item update added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        siteheadgetApi();
        print("✅ Update Successful for ID: $siteheadid");
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
