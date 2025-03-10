// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../CommenFiles/getXcontroller.dart';
// import '../../FacilityCardListview/model/fieldstatemodel.dart';
//
// class AddNewFieldController extends GetxController {
//   List Hospital = [
//     "Appolo",
//     "East Coast Hospitals",
//     "JIPMER Hospital",
//     "A.G. Padmavati's Hospital Ltd"
//   ];
//
//   bool Loading = false;
//   TextEditingController searchController = TextEditingController();
//   Map<String, List<Fieldstatemodel>> fieldstateData = {};
//   final RxList<String> images = [
//     "assets/images/hopital1.png",
//   ].obs;
//   List<String> image = [
//     "assets/images/hopital1.png",
//   ];
//   TextEditingController nameController = TextEditingController();
//   TextEditingController imageController = TextEditingController();
//   List<Fieldstatemodel> facilities = [];
//
//   ///Search///
//   void searchFacility(String query) {
//     if (query.isEmpty) {
//       filteredList.assignAll(fieldState); // Show all if search is empty
//     } else {
//       filteredList.assignAll(
//         fieldState.where((item) => item["FieldName"]
//             .toString()
//             .toLowerCase()
//             .contains(query.toLowerCase())),
//       );
//     }
//   }
//
//   // Function to add facility and update search list
//   void addFacility(Map<String, dynamic> newFacility) {
//     fieldState.add(newFacility);
//     fieldState.refresh();
//     fieldState.assignAll(fieldState); // Update filtered list
//   }
//
//   ///edit option//////
//
//   void editFieldstate(
//       BuildContext context,
//       int siteheadid,
//       final String fieldName,
//       final double latitude,
//       final double longitude,
//       final double proximity,
//       final String headName,
//       final String mobileNumber,
//       final String? fieldImage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Edit Facility"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                   controller:
//                       facilityAddListItemsController.FieldSiteNameController,
//                   decoration: InputDecoration(labelText: "First Name")),
//               TextField(
//                   decoration: InputDecoration(
//                       labelText:
//                           "${facilityAddListItemsController.lat.trim()}")),
//               TextField(
//                   // controller: facilityAddListItemsController.LatitudeController,
//                   decoration: InputDecoration(
//                       labelText:
//                           "${facilityAddListItemsController.long.trim()}")),
//               TextField(
//                   //controller: facilityAddListItemsController.MobileNumberController,
//                   decoration: InputDecoration(
//                       labelText:
//                           "${facilityAddListItemsController.distance.toString()}")),
//               TextField(
//                   controller:
//                       facilityAddListItemsController.MobileNumberController,
//                   decoration: InputDecoration(labelText: "Field Site Name")),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog
//               },
//               child: Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 addSiteHeadController.SiteheadUpdateapi(siteheadid);
//                 // facilityUpdateapi(
//                 //     nameController.text, imageController.text, id);
//                 Navigator.pop(context); // Close the dialog after updating
//               },
//               child: Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   String? Siteheadname;
//   var fieldState = <Map<String, dynamic>>[].obs;
//   final List<String> workTypeOptions = ["Anandhi", "Mani", "John"];
//   List<Map<String, dynamic>> fieldStateList = [];
//   List<Map<String, dynamic>> filteredList = [];
//
//   // Future<void> addFieldStatepostApi(String fieldName, String fieldImage) async {
//   //   String url = "https://mobileappapi.onrender.com/api/fieldstate/create";
//   //
//   //   if (Siteheadname == null ||
//   //       facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
//   //       facilityAddListItemsController.MobileNumberController.text.isEmpty ||
//   //       facilityAddListItemsController.lat == null ||
//   //       facilityAddListItemsController.long == null ||
//   //       facilityAddListItemsController.distance == null) {
//   //     print("⚠ Please fill all fields!");
//   //     return;
//   //   }
//   //
//   //   final Map<String, dynamic> requestBody = {
//   //     "FieldName": fieldName.trim(),
//   //     "Latitude": facilityAddListItemsController.lat.toString().trim(),
//   //     "Longitude": facilityAddListItemsController.long.toString().trim(),
//   //     "Proximity": facilityAddListItemsController.distance.toString(),
//   //     "HeadName": Siteheadname,
//   //     "MobileNumber":
//   //         facilityAddListItemsController.MobileNumberController.text.trim(),
//   //     "FieldImage": "image_url.jpg"
//   //   };
//   //
//   //   print("📩 Sending Request: ${jsonEncode(requestBody)}");
//   //
//   //   try {
//   //     final response = await http.post(
//   //       Uri.parse(url),
//   //       headers: {"Content-Type": "application/json"},
//   //       body: jsonEncode(requestBody),
//   //     );
//   //
//   //     if (response.statusCode == 201 || response.statusCode == 200) {
//   //       // ✅ Updates the UI after adding an item
//   //       fieldStateList.add(requestBody);
//   //
//   //       Get.snackbar("Success", "✅ Item added successfully!",
//   //           backgroundColor: Colors.green, colorText: Colors.white);
//   //
//   //       print("🆕 Updated List: $fieldStateList");
//   //     } else {
//   //       Get.snackbar("Error", "❌ Failed to add field: ${response.body}",
//   //           backgroundColor: Colors.red, colorText: Colors.white);
//   //     }
//   //   } catch (e) {
//   //     Get.snackbar("Error", "⚠ API Error: $e",
//   //         backgroundColor: Colors.red, colorText: Colors.white);
//   //   }
//   // }
//
//   Future<void> addFieldStateApi() async {
//     String url = "https://mobileappapi.onrender.com/api/fieldstate/create";
//
//     if (Siteheadname == null ||
//         facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
//         facilityAddListItemsController.MobileNumberController.text.isEmpty ||
//         facilityAddListItemsController.lat == null ||
//         facilityAddListItemsController.long == null ||
//         facilityAddListItemsController.distance == null) {
//       print("⚠ Please fill all fields!");
//       return;
//     }
//
//     final Map<String, dynamic> requestBody = {
//       "FieldName":
//           facilityAddListItemsController.FieldSiteNameController.text.trim(),
//       "Latitude": facilityAddListItemsController.lat.trim(),
//       "Longitude": facilityAddListItemsController.long.trim(),
//       "Proximity": facilityAddListItemsController.distance.toString(),
//       "HeadName": Siteheadname,
//       "MobileNumber":
//           facilityAddListItemsController.MobileNumberController.text.trim(),
//       "FieldImage": "image_url.jpg".toString()
//     };
//
//     print("📩 Sending Request: ${jsonEncode(requestBody)}");
//
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {
//           "Content-Type": "application/json", // Must be JSON type
//         },
//         body: jsonEncode(requestBody), // ✅ Convert map to JSON string
//       );
//
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         Get.snackbar("Success", "✅ Item added successfully!",
//             backgroundColor: Colors.green, colorText: Colors.white);
//         fieldStateList.add(requestBody);
//         filteredList.assignAll(fieldStateList);
//
//         print("🆕 Updated List: ${fieldStateList}");
//       } else {
//         Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
//             backgroundColor: Colors.red, colorText: Colors.white);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "⚠ API Error: $e",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   }
//
//   ///get method///////
//   Future<Map<String, List<Fieldstatemodel>>> fieldstategetApi(
//       {String? query}) async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://mobileappapi.onrender.com/api/fieldstate/all'),
//       );
//
//       if (response.statusCode == 200) {
//         print("sathya");
//         final Map<String, dynamic> jsonData = jsonDecode(response.body);
//
//         final siteheads = jsonData.map((key, value) =>
//             MapEntry<String, List<Fieldstatemodel>>(
//                 key,
//                 List<Fieldstatemodel>.from(
//                     value.map((x) => Fieldstatemodel.fromJson(x)))));
//
//         // ✅ Filtering based on query
//         if (query != null && query.isNotEmpty) {
//           final filteredSiteheads = siteheads.map((key, value) {
//             final filteredList = value
//                 .where((site) =>
//                     site.fieldName!
//                         .toLowerCase()
//                         .contains(query.toLowerCase()) ||
//                     site.fieldImage!
//                         .toLowerCase()
//                         .contains(query.toLowerCase()))
//                 .toList();
//             return MapEntry(key, filteredList);
//           });
//
//           return filteredSiteheads;
//         }
//
//         return siteheads;
//       } else {
//         throw Exception(
//             'Failed to load data. Status code: ${response.statusCode}');
//       }
//     } catch (e, stackTrace) {
//       print('Failed to load data: $e\n$stackTrace');
//       throw Exception('Failed to load data: $e\n$stackTrace');
//     }
//   }
//
//   var fieldList = <Map<String, dynamic>>[].obs;
//
//   Future<void> addFieldstatepostapi(String fieldName, String fieldImage) async {
//     final url =
//         Uri.parse("https://mobileappapi.onrender.com/api/facility/create");
//
//     final Map<String, dynamic> requestBody = {
//       "FieldName": fieldName,
//       "FieldImage": fieldImage
//     };
//
//     print("📩 Sending Request: $requestBody");
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestBody),
//       );
//
//       print("🔍 Response Status Code: ${response.statusCode}");
//       print("🔍 Response Body: ${response.body}");
//
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         fieldList.add(requestBody); // Add new field to the list
//         Get.snackbar("Success", "✅ Item added successfully!",
//             backgroundColor: Colors.green, colorText: Colors.white);
//       } else {
//         Get.snackbar("Error", "❌ Failed to add field: ${response.body}",
//             backgroundColor: Colors.red, colorText: Colors.white);
//       }
//     } catch (e) {
//       print("⚠ Error: $e");
//       Get.snackbar("Error", "⚠ API Error: $e",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   }
//
//   Future<void> fieldstateUpdateapi(int id) async {
//     String url =
//         "https://mobileappapi.onrender.com/api/fieldstate/update/$id"; // Update API URL
//     if (Siteheadname == null ||
//         facilityAddListItemsController.FieldSiteNameController.text.isEmpty ||
//         facilityAddListItemsController.MobileNumberController.text.isEmpty ||
//         facilityAddListItemsController.lat == null ||
//         facilityAddListItemsController.long == null ||
//         facilityAddListItemsController.distance == null) {
//       print("⚠ Please fill all fields!");
//       return;
//     }
//
//     final Map<String, dynamic> requestBody = {
//       "FieldName":
//           facilityAddListItemsController.FieldSiteNameController.text.trim(),
//       "Latitude": facilityAddListItemsController.lat.trim(),
//       "Longitude": facilityAddListItemsController.long.trim(),
//       "Proximity": facilityAddListItemsController.distance.toString(),
//       "HeadName": Siteheadname,
//       "MobileNumber":
//           facilityAddListItemsController.MobileNumberController.text.trim(),
//       "FieldImage": "image_url.jpg".toString()
//     };
//
//     print("📩 Sending Request: ${jsonEncode(requestBody)}");
//     try {
//       final response = await http.put(Uri.parse(url),
//           headers: {
//             "Content-Type": "application/json",
//           },
//           body: jsonEncode(requestBody));
//       if (response.statusCode == 200) {
//         Get.snackbar("Success", "✅ Item update added successfully!",
//             backgroundColor: Colors.green, colorText: Colors.white);
//         print("✅ Update Successful for ID: $id");
//         fieldstategetApi();
//       } else {
//         Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
//             backgroundColor: Colors.red, colorText: Colors.white);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "⚠ API Error: $e",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   }
// }
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/FieldStateModelData.dart';

class AddNewFieldController extends GetxController {
  Future<List<Fieldstatemodeldata>> fetchFieldStateapi() async {
    final response = await http
        .get(Uri.parse("https://mobileappapi.onrender.com/api/fieldstate/all"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> facilities =
          data['facilities']; // Extract "facilities" array

      return facilities
          .map((json) => Fieldstatemodeldata.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to load facilities");
    }
  }
}
