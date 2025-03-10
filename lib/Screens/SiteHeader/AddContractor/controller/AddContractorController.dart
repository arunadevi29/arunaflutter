import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../CommenFiles/getXcontroller.dart';
import '../model/contractormodel.dart';

class AddContractorController extends GetxController {
  bool passwordVisible = false;
  RxBool refreshLoader = false.obs;
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  Map<String, List<Contractorsmodel>> ContractorData = {};
  var dropname = "";

  var _currentSelectedItem;
  List _studentList = ["sdfsd", "sdfsdf"];

  var timepicker = "";
  String lat = "";
  String long = "";

  // Position? position;
  bool isLoading = false;

  cleaner() {
    FirstNameController.clear();
    LastNameController.clear();
    MobileNumberController.clear();
    EnterPasswordController.clear();
    ConfirmPasswordController.clear();
  }

  void editcontractor(BuildContext context, int id, String firstName,
      String lastName, String mobileNumber, String? image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit contractor"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: addContractorController.FirstNameController,
                  decoration: InputDecoration(labelText: "First Name")),
              TextField(
                  controller: addContractorController.LastNameController,
                  decoration: InputDecoration(labelText: "Last Name")),
              TextField(
                  maxLength: 10,
                  controller: addContractorController.MobileNumberController,
                  decoration: InputDecoration(labelText: "Mobile Number")),
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
                    addContractorController.FirstNameController.text.isEmpty ||
                    addContractorController.LastNameController.text.isEmpty ||
                    addContractorController
                        .MobileNumberController.text.isEmpty) {
                  Get.snackbar("Error", "⚠ Please fill all fields!",
                      backgroundColor: Colors.red, colorText: Colors.white);
                  return;
                }

                await updatecontractor(
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

  Future<void> updatecontractor(int id, String firstName, String lastName,
      String mobileNumber, String? image) async {
    String url = "https://mobileappapi.onrender.com/api/contractor/update/$id";

    final Map<String, dynamic> requestBody = {
      "id": id,
      "FirstName": FirstNameController.text,
      "LastName": LastNameController.text,
      "MobileNumber": MobileNumberController.text,
      "Field": FieldController.text,
      "FieldSiteName": FieldSiteNamerController.text,
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
        contractorgetapi();
        print("✅ Update Successful for ID: $id"); // Reload updated data
      } else {
        Get.snackbar("Error", "❌ Failed to update shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  ///postmethodapi////
  Future<void> addcontractorPostapi() async {
    String url =
        "https://mobileappapi.onrender.com/api/contractor/create"; // Replace with your API endpoint
    refreshLoader.value = true;
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

        contractorgetapi();
        refreshLoader.value = false;
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

  Future<Map<String, List<Contractorsmodel>>> contractorgetapi(
      {String? query}) async {
    refreshLoader.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/contractor/all'),
      );

      if (response.statusCode == 200) {
        print("object");
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<Contractorsmodel>>(
                key,
                List<Contractorsmodel>.from(
                    value.map((x) => Contractorsmodel.fromMap(x)))));

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
            //return MapEntry(key, filteredList);
          });

          return filteredSiteheads;
        }
        refreshLoader.value = false;
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

  Future<void> ContractorUpdateapi(int id) async {
    String url =
        "https://mobileappapi.onrender.com/api/contractor/update/$id"; // Update API URL
    refreshLoader.value = true;
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": id,
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

        contractorgetapi();

        print("Failed to update item: ${response.body}");
        refreshLoader.value = false;
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
