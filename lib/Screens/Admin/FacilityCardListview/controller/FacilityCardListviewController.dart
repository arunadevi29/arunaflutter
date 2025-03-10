import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../widgets/AppBarSample.dart';
import '../model/fieldstatemodel.dart';

class FacilityCardListviewController extends GetxController {
  List Hospital = [
    "Appolo",
    "East Coast Hospitals",
    "JIPMER Hospital",
    "A.G. Padmavati's Hospital Ltd"
  ];

  bool Loading = false;
  TextEditingController searchController = TextEditingController();
  Map<String, List<Fieldstatemodel>> fieldstateData = {};
  final RxList<String> images = [
    "assets/images/hopital1.png",
  ].obs;
  List<String> image = [
    "assets/images/hopital1.png",
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  List<Fieldstatemodel> facilities = [];
  RxBool refreshLoader = false.obs;

  Cleaner() {
    facilityAddListItemsController.FieldSiteNameController.text = "";
  }

  ///edit option//////

  void editFieldstate(
      BuildContext context,
      final String fieldId,
      final String fieldName,
      final double latitude,
      final double longitude,
      final double proximity,
      final String headName,
      final String mobileNumber,
      final String? fieldImage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Facility"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller:
                      facilityAddListItemsController.FieldSiteNameController,
                  decoration: InputDecoration(labelText: "First Name")),
              // TextField(
              //     decoration: InputDecoration(
              //         labelText:
              //             "${facilityAddListItemsController.lat.trim()}")),
              // TextField(
              //     // controller: facilityAddListItemsController.LatitudeController,
              //     decoration: InputDecoration(
              //         labelText:
              //             "${facilityAddListItemsController.long.trim()}")),
              // TextField(
              //     //controller: facilityAddListItemsController.MobileNumberController,
              //     decoration: InputDecoration(
              //         labelText:
              //             "${facilityAddListItemsController.distance.toString()}")),
              // TextField(
              //     controller:
              //         facilityAddListItemsController.MobileNumberController,
              //     decoration: InputDecoration(labelText: "Field Site Name")),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                facilityCardListviewController.updateFieldStateApi(fieldId);
                // facilityUpdateapi(
                //     nameController.text, imageController.text, id);
                Navigator.pop(context); // Close the dialog after updating
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  String? Siteheadname;
  var fieldState = <Map<String, dynamic>>[].obs;
  final List<String> workTypeOptions = ["Anandhi", "Mani", "John"];
  List<Map<String, dynamic>> fieldStateList = [];
  List<Map<String, dynamic>> filteredList = [];

  Future<void> addFieldStateApi() async {
    String url = "https://mobileappapi.onrender.com/api/fieldstate/create";
    refreshLoader.value = true;
    if (Siteheadname == null ||
        facilityAddListItemsController.CategeryController.text.isEmpty ||
        facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
        facilityAddListItemsController.MobileNumberController.text.isEmpty ||
        facilityAddListItemsController.lat == null ||
        facilityAddListItemsController.long == null ||
        facilityAddListItemsController.distance == null) {
      print("⚠ Please fill all fields!");
      return;
    }

    final Map<String, dynamic> requestBody = {
      "Category": facilityAddListItemsController.CategeryController.text.trim(),
      "FieldName":
          facilityAddListItemsController.FieldSiteNameController.text.trim(),
      "Latitude": facilityAddListItemsController.lat.trim(),
      "Longitude": facilityAddListItemsController.long.trim(),
      "Proximity": facilityAddListItemsController.distance.toString(),
      "HeadName": Siteheadname,
      "MobileNumber":
          facilityAddListItemsController.MobileNumberController.text.trim(),
      "FieldImage": "image_url.jpg".toString()
    };

    // print("📩 Sending Request: ${jsonEncode(requestBody)}");
    print("object");
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json", // Must be JSON type
        },
        body: jsonEncode(requestBody), // ✅ Convert map to JSON string
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("object1");
        print("✅ Facility added successfully! Status: ${response.statusCode}");
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
        // fieldStateList.add(requestBody);
        // filteredList.assignAll(fieldStateList);
        //
        // print("🆕 Updated List: ${fieldStateList}");
        refreshLoader.value = false;
      } else {
        Get.snackbar("Error", "❌ Failed to add Field: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  ///get method///////
  Future<Map<String, List<Fieldstatemodel>>> fieldstategetApi(
      {String? query}) async {
    refreshLoader.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/fieldstate/all'),
      );

      if (response.statusCode == 200) {
        print("sathya");
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<Fieldstatemodel>>(
                key,
                List<Fieldstatemodel>.from(
                    value.map((x) => Fieldstatemodel.fromJson(x)))));

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          final filteredSiteheads = siteheads.map((key, value) {
            final filteredList = value
                .where((site) =>
                    site.fieldName!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.fieldImage!
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .toList();
            return MapEntry(key, filteredList);
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

  var fieldList = <Map<String, dynamic>>[].obs;

  // Future<void> addFieldstatepostapi(
  //   final int id,
  //   final int? fieldId,
  //   final String fieldName,
  //   final double latitude,
  //   final double longitude,
  //   final double proximity,
  //   final String headName,
  //   final String mobileNumber,
  //   final String fieldImage,
  // ) async {
  //   final url =
  //       Uri.parse("https://mobileappapi.onrender.com/api/facility/create");
  //
  //   final Map<String, dynamic> requestBody = {
  //     "id": id,
  //     "FieldName": fieldName,
  //     "FieldImage": fieldImage,
  //     "latitude": latitude,
  //     "longitude": longitude,
  //     "proximity": proximity,
  //     "headName": headName,
  //     "mobileNumber": mobileNumber,
  //     "fieldId": fieldId,
  //   };
  //
  //   print("📩 Sending Request: $requestBody");
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(requestBody),
  //     );
  //
  //     print("🔍 Response Status Code: ${response.statusCode}");
  //     print("🔍 Response Body: ${response.body}");
  //
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       fieldList.add(requestBody); // Add new field to the list
  //       Get.snackbar("Success", "✅ Item added successfully!",
  //           backgroundColor: Colors.green, colorText: Colors.white);
  //     } else {
  //       Get.snackbar("Error", "❌ Failed to add field: ${response.body}",
  //           backgroundColor: Colors.red, colorText: Colors.white);
  //     }
  //   } catch (e) {
  //     print("⚠ Error: $e");
  //     Get.snackbar("Error", "⚠ API Error: $e",
  //         backgroundColor: Colors.red, colorText: Colors.white);
  //   }
  // }
  Future<void> updateFieldStateApi(String fieldId) async {
    String url =
        "https://mobileappapi.onrender.com/api/fieldstate/update/$fieldId";
    refreshLoader.value = true;

    if (Siteheadname == null ||
        facilityAddListItemsController.CategeryController.text.isEmpty ||
        facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
        facilityAddListItemsController.MobileNumberController.text.isEmpty ||
        facilityAddListItemsController.lat == null ||
        facilityAddListItemsController.long == null ||
        facilityAddListItemsController.distance == null) {
      print("⚠ Please fill all fields!");
      refreshLoader.value = false;
      return;
    }

    final Map<String, dynamic> requestBody = {
      "Category": facilityAddListItemsController.CategeryController.text.trim(),
      "FieldName":
          facilityAddListItemsController.FieldSiteNameController.text.trim(),
      "Latitude": facilityAddListItemsController.lat.toString(),
      "Longitude": facilityAddListItemsController.long.toString(),
      "Proximity": facilityAddListItemsController.distance.toString(),
      "HeadName": Siteheadname,
      "MobileNumber":
          facilityAddListItemsController.MobileNumberController.text.trim(),
      "FieldImage": "image_url.jpg".toString()
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
            "✅ Facility updated successfully! Status: ${response.statusCode}");
        Get.snackbar("Success", "✅ Item updated successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "❌ Failed to update Field: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      refreshLoader.value = false;
    }
  }

  Future<void> fieldstateUpdateapi(int id) async {
    refreshLoader.value = true;
    String url =
        "https://mobileappapi.onrender.com/api/fieldstate/update/$id"; // Update API URL
    if (Siteheadname == null ||
        facilityAddListItemsController.CategeryController.text.isEmpty ||
        facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
        facilityAddListItemsController.MobileNumberController.text.isEmpty ||
        facilityAddListItemsController.lat == null ||
        facilityAddListItemsController.long == null ||
        facilityAddListItemsController.distance == null) {
      print("⚠ Please fill all fields!");
      return;
    }

    final Map<String, dynamic> requestBody = {
      "Category": facilityAddListItemsController.CategeryController.text.trim(),
      "FieldName":
          facilityAddListItemsController.FieldSiteNameController.text.trim(),
      "Latitude": facilityAddListItemsController.lat.trim(),
      "Longitude": facilityAddListItemsController.long.trim(),
      "Proximity": facilityAddListItemsController.distance.toString(),
      "HeadName": Siteheadname,
      "MobileNumber":
          facilityAddListItemsController.MobileNumberController.text.trim(),
      "FieldImage": "image_url.jpg".toString()
    };

    print("📩 Sending Request: ${jsonEncode(requestBody)}");
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      print("📩 Sent Request: ${jsonEncode(requestBody)}");
      print("🔄 Response Code: ${response.statusCode}");
      print("🔄 Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
            "✅ Facility updated successfully! Status: ${response.statusCode}");
        Get.snackbar("Success", "✅ Item updated successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        print("❌ Update Failed: ${response.body}");
        Get.snackbar("Error", "❌ Failed to update Field: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print("⚠ Exception: $e");
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      refreshLoader.value = false;
    }
  }
}
// Future<void> addFieldStatepostApi(String fieldName, String fieldImage) async {
//   String url = "https://mobileappapi.onrender.com/api/fieldstate/create";
//
//   if (Siteheadname == null ||
//       facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
//       facilityAddListItemsController.MobileNumberController.text.isEmpty ||
//       facilityAddListItemsController.lat == null ||
//       facilityAddListItemsController.long == null ||
//       facilityAddListItemsController.distance == null) {
//     print("⚠ Please fill all fields!");
//     return;
//   }
//
//   final Map<String, dynamic> requestBody = {
//     "FieldName": fieldName.trim(),
//     "Latitude": facilityAddListItemsController.lat.toString().trim(),
//     "Longitude": facilityAddListItemsController.long.toString().trim(),
//     "Proximity": facilityAddListItemsController.distance.toString(),
//     "HeadName": Siteheadname,
//     "MobileNumber":
//         facilityAddListItemsController.MobileNumberController.text.trim(),
//     "FieldImage": "image_url.jpg"
//   };
//
//   print("📩 Sending Request: ${jsonEncode(requestBody)}");
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(requestBody),
//     );
//
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       // ✅ Updates the UI after adding an item
//       fieldStateList.add(requestBody);
//
//       Get.snackbar("Success", "✅ Item added successfully!",
//           backgroundColor: Colors.green, colorText: Colors.white);
//
//       print("🆕 Updated List: $fieldStateList");
//     } else {
//       Get.snackbar("Error", "❌ Failed to add field: ${response.body}",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   } catch (e) {
//     Get.snackbar("Error", "⚠ API Error: $e",
//         backgroundColor: Colors.red, colorText: Colors.white);
//   }
// }
// Future<void> addFacility() async {
//   String url =
//       "https://mobileappapi.onrender.com/api/fieldstate/create"; // Replace with correct API URL
//
//   final Map<String, dynamic> requestBody = {
//     "Category": facilityAddListItemsController.CategeryController.text.trim(),
//     "FieldName":
//         facilityAddListItemsController.FieldSiteNameController.text.trim(),
//     "Latitude": facilityAddListItemsController.lat.trim(),
//     // Must be a number
//     "Longitude": facilityAddListItemsController.long.trim(),
//     // Must be a number
//     "Proximity": facilityAddListItemsController.distance.toString(),
//     // Must be a number
//     "HeadName": Siteheadname,
//     "MobileNumber":
//         facilityAddListItemsController.MobileNumberController.text,
//     "FieldImage": "school.png".toString()
//   };
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(requestBody),
//     );
//
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       print("✅ Facility added successfully!");
//     } else {
//       print("❌ Failed to add facility. Status Code: ${response.statusCode}");
//       print("📥 API Response: ${response.body}");
//     }
//   } catch (e) {
//     print("⚠ Error adding facility: $e");
//   }
// }
//
// Future<void> addFacilitys() async {
//   String url = "https://mobileappapi.onrender.com/api/fieldstate/create";
//
//   // Validate fields before sending request
//   if (Siteheadname == null ||
//       facilityAddListItemsController.CategeryController.text.isEmpty ||
//       facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
//       facilityAddListItemsController.MobileNumberController.text.isEmpty ||
//       facilityAddListItemsController.lat == null ||
//       facilityAddListItemsController.long == null ||
//       facilityAddListItemsController.distance == null) {
//     print("⚠ Please fill all fields!");
//     return;
//   }
//
//   final Map<String, dynamic> requestBody = {
//     "Category": facilityAddListItemsController.CategeryController.text.trim(),
//     "FieldName":
//         facilityAddListItemsController.FieldSiteNameController.text.trim(),
//     "Latitude": facilityAddListItemsController.lat,
//     // ✅ No .trim(), should be a number
//     "Longitude": facilityAddListItemsController.long,
//     // ✅ No .trim(), should be a number
//     "Proximity": facilityAddListItemsController.distance,
//     // ✅ Should be a number
//     "HeadName": Siteheadname,
//     "MobileNumber":
//         facilityAddListItemsController.MobileNumberController.text.trim(),
//     "FieldImage": "school.png"
//   };
//
//   // print("📩 Sending Request: ${jsonEncode(requestBody)}");
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(requestBody),
//     );
//
//     print(
//         "📥 API Response: ${response.body}"); // Print full response for debugging
//
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       print("✅ Facility added successfully!");
//     } else {
//       print("❌ Failed to add facility. Status Code: ${response.statusCode}");
//       print("📥 API Response: ${response.body}");
//     }
//   } catch (e) {
//     print("⚠ Error adding facility: $e");
//   }
// }
// Future<void> addFieldstateapi() async {
//   String url = "https://mobileappapi.onrender.com/api/fieldstate/create";
//   if (Siteheadname == null ||
//       facilityAddListItemsController.distance == null ||
//       facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
//       facilityAddListItemsController.MobileNumberController.text.isEmpty ||
//       facilityAddListItemsController.lat.isEmpty ||
//       facilityAddListItemsController.long.isEmpty) {
//     print("⚠ Please fill all fields!");
//     return;
//   }
//
//   final Map<String, dynamic> requestBody = {
//     "FieldName":
//         facilityAddListItemsController.FieldSiteNameController.text.trim(),
//     "Latitude": facilityAddListItemsController.lat.trim(),
//     "Longitude": facilityAddListItemsController.long.trim(),
//     "Proximity": facilityAddListItemsController.distance.toString(),
//     "HeadName": Siteheadname,
//     "MobileNumber":
//         facilityAddListItemsController.MobileNumberController.text.trim(),
//     "FieldImage": "image_url.jpg".toString()
//   };
//
//   // var bodyData = jsonEncode({
//   //   "FieldName":
//   //       facilityAddListItemsController.FieldSiteNameController.text.trim(),
//   //   "Latitude": facilityAddListItemsController.lat.trim(),
//   //   "Longitude": facilityAddListItemsController.long.trim(),
//   //   "Proximity": facilityAddListItemsController.distance.toString(),
//   //   "MobileNumber":
//   //       facilityAddListItemsController.MobileNumberController.text.trim(),
//   //   "FieldImage": "image_url.jpg".toString()
//   // });
//
//   print("Sending Request: $requestBody"); // ✅ Debugging request body
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: requestBody,
//     );
//
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       print("Field added successfully!");
//     } else {
//       print("Failed to add field. Status: ${response.statusCode}");
//       print("Response: ${response.body}");
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }
// final List<Map<String, dynamic>> FirstList = [
//   {
//     "image": "assets/images/first.png",
//     "name": "Hospital",
//     "des": "3 Hospital",
//   },
//   {
//     "image": "assets/images/second.png",
//     "name": "Autdiotorium",
//     "des": "3 Autdiotorium",
//   },
//   {
//     "image": "assets/images/third.png",
//     "name": "College",
//     "des": "3 College",
//   },
// ];
// List NewFieldsList = [];
// int index = 0;
//
// bool isSwitched = false;
