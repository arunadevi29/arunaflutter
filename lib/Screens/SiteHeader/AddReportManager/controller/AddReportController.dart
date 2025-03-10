import 'dart:convert';

import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/ReportManagerModel.darrt.dart';

class AddReportController extends GetxController {
  bool passwordVisible = false;

  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();

  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final RxList<String> images = [
    "assets/images/1.png",
  ].obs;
  Map<String, List<ReportManagers>> reportmanagerData = {};
  var dropname = "";

  var _currentSelectedItem;
  List _studentList = ["sdfsd", "sdfsdf"];

  var timepicker = "";
  String lat = "";
  String long = "";

  // Position? position;
  bool isLoading = false;

  // Editfunction///

  ///postmethodapi////
  Future<void> addreportmanagerPostapi() async {
    String url =
        "https://mobileappapi.onrender.com/api/reportmanager/create"; // Replace with your API endpoint

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
          "Password": EnterPasswordController.text,
          "ConfirmPassword": ConfirmPasswordController.text,
          "Image": "img5.png".toString()
        }), // Convert object to JSON string
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        reportmanagergetapi();
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

  Future<Map<String, List<ReportManagers>>> reportmanagergetapi(
      {String? query}) async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/reportmanager/all'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<ReportManagers>>(
                key,
                List<ReportManagers>.from(
                    value.map((x) => ReportManagers.fromMap(x)))));

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          final filteredSiteheads = siteheads.map((key, value) {
            final filteredList = value
                .where((site) =>
                    site.firstName!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.lastName!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.mobileNumber!
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .toList();
            // final filteredList = value.where((site) {
            //   bool matches = site.firstName!
            //           .toLowerCase()
            //           .contains(query.toLowerCase()) ||
            //       site.lastName!.toLowerCase().contains(query.toLowerCase()) ||
            //       site.mobileNumber!
            //           .toLowerCase()
            //           .contains(query.toLowerCase());
            //
            //   if (matches) {
            //     // ✅ Apply image filter only for matching results
            //     site.image = true.toString();
            //   }
            //
            //   return matches;
            // }).toList();
            return MapEntry(key, filteredList);
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

  cleaner() {
    FirstNameController.clear();
    LastNameController.clear();
    MobileNumberController.clear();
    EnterPasswordController.clear();
    ConfirmPasswordController.clear();
  }

  void editrepot(BuildContext context, int id, String firstName,
      String lastName, String mobileNumber, String? image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit ReportManager"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: addReportController.FirstNameController,
                  decoration: InputDecoration(labelText: "First Name")),
              TextField(
                  controller: addReportController.LastNameController,
                  decoration: InputDecoration(labelText: "Last Name")),
              TextField(
                  maxLength: 10,
                  controller: addReportController.MobileNumberController,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                  )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null ||
                    addReportController.FirstNameController.text.isEmpty ||
                    addReportController.LastNameController.text.isEmpty ||
                    addReportController.MobileNumberController.text.isEmpty) {
                  Get.snackbar("Error", "⚠ Please fill all fields!",
                      backgroundColor: Colors.red, colorText: Colors.white);
                  return;
                }

                await updatereportapi(
                    id, lastName, firstName, mobileNumber, image.toString());

                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> updatereportapi(int reportid, String firstName, String lastName,
      String mobileNumber, String? image) async {
    String url =
        "https://mobileappapi.onrender.com/api/reportmanager/update/$reportid";

    final Map<String, dynamic> requestBody = {
      "id": reportid,
      "FirstName": FirstNameController.text,
      "LastName": LastNameController.text,
      "MobileNumber": MobileNumberController.text,
      "Password": EnterPasswordController.text,
      "ConfirmPassword": ConfirmPasswordController.text,
      "Image": "img1.jpg".toString()
    };

    print("📩 Sending Update Request: ${jsonEncode(requestBody)}");

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print("🔍 Response Status Code: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "✅ Shift updated successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
        reportmanagergetapi();
        print("✅ Update Successful for ID: $reportid"); // Reload updated data
      } else {
        Get.snackbar("Error", "❌ Failed to update shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> reportmanagerUpdateapi(int reportid) async {
    String url =
        "https://mobileappapi.onrender.com/api/reportmanager/update/$reportid"; // Update API URL

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": reportid,
          "FirstName": FirstNameController.text,
          "LastName": LastNameController.text,
          "MobileNumber": MobileNumberController.text,
          "Password": EnterPasswordController.text,
          "ConfirmPassword": ConfirmPasswordController.text,
          "Image": "img1.jpg".toString()
        }), // Convert model to JSON
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item update added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        reportmanagergetapi();
        print("Failed to update item: ${response.body}");
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
