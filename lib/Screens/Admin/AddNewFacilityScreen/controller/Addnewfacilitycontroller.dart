// import 'dart:convert';
// import 'dart:io';
//
// import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
//
// import '../model/facilitymodeldata.dart';
//
// class Addnewfacilitycontroller extends GetxController {
//   var facilityList = <Map<String, dynamic>>[].obs; // Observable list
//   var filteredList = <Map<String, dynamic>>[].obs;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController imageController = TextEditingController();
//   var textController = TextEditingController();
//   var isLoading = false.obs;
//   var selectedImage = Rx<File?>(null);
//   bool visible = false;
//
//   // 📌 Pick Image Function
//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       selectedImage.value = File(pickedFile.path);
//     }
//   }
//
//   ///edit option//////
//
//   void editFacility(
//       BuildContext context, int id, String currentName, String currentImage) {
//     TextEditingController nameController =
//         TextEditingController(text: currentName);
//     TextEditingController imageController =
//         TextEditingController(text: currentImage);
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Edit Facility"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: "Facility Name"),
//               ),
//               TextField(
//                 controller: imageController,
//                 decoration: InputDecoration(labelText: "Facility Image URL"),
//               ),
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
//                 updateFacility("3", "Mall", "devi");
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
//   Future<void> addFacilitypostapi(String fieldName, String fieldImage) async {
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
//         facilityList.add(requestBody);
//         facilityList.refresh(); // ✅ Refresh UI in GetX
//         filteredList.assignAll(facilityList);
//         // Add new field to the list
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
//   var facilityLists = <FacilityModel>[].obs;
//   var Loading = false.obs;
//
//   final String baseUrl = "https://mobileappapi.onrender.com/api/facility";
//
//   /// ✅ **1. GET Method (Fetch All Facilities)**
//   Future<void> fetchFacilities() async {
//     isLoading(true);
//     try {
//       final response = await http.get(Uri.parse(baseUrl));
//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body);
//         FacilityModel facilityData = FacilityModel.fromJson(jsonData);
//
//         // if (facilityData.field != null) {
//         //   // facilityList.assignAll();
//         // } else {
//         //   facilityList.clear(); // If null, clear the list
//         // }
//       } else {
//         Get.snackbar("Error", "Failed to fetch data: ${response.body}");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "API Error: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   /// ✅ **2. POST Method (Add Facility)**
//   Future<void> addFacility(String fieldName, String fieldImage) async {
//     final url = Uri.parse("$baseUrl/create");
//
//     final Map<String, dynamic> requestBody = {
//       "FieldName": fieldName,
//       "FieldImage": fieldImage
//     };
//
//     try {
//       isLoading(true);
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         // Refresh UI with new data
//         fetchFacilities();
//         Get.snackbar("Success", "✅ Facility added successfully!");
//       } else {
//         Get.snackbar("Error", "❌ Failed to add facility: ${response.body}");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "⚠ API Error: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   /// ✅ **3. UPDATE Method (Edit Facility)**
//   Future<void> updateFacility(
//       String id, String fieldName, String fieldImage) async {
//     final url = Uri.parse("$baseUrl/update/$id");
//
//     final Map<String, dynamic> requestBody = {
//       "FieldName": fieldName,
//       "FieldImage": fieldImage
//     };
//
//     try {
//       isLoading(true);
//       final response = await http.put(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 200) {
//         // Refresh UI with updated data
//         fetchFacilities();
//         Get.snackbar("Success", "✅ Facility updated successfully!");
//       } else {
//         Get.snackbar("Error", "❌ Failed to update facility: ${response.body}");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "⚠ API Error: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void searchFacility(String query) {
//     if (query.isEmpty) {
//       filteredList.assignAll(facilityList); // Show all if search is empty
//     } else {
//       filteredList.assignAll(
//         facilityList.where((item) => item["FieldName"]
//             .toString()
//             .toLowerCase()
//             .contains(query.toLowerCase())),
//       );
//     }
//   }
//
// // Function to add facility and update search list
// // void addFacility(Map<String, dynamic> newFacility) {
// //   facilityList.add(newFacility);
// //   facilityList.refresh();
// //   filteredList.assignAll(facilityList); // Update filtered list
// // }
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/facilitymodeldata.dart';

class Addnewfacilitycontroller extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController entryController = TextEditingController();
  Set<int> disabledItems = {};
  TextEditingController searchController = TextEditingController();
  List<FacilityModels> allFacilities = [];
  List<FacilityModels> filteredFacilities = [];

  // 🟢 Fetch Facilities (GET Method)
  Future<List<FacilityModels>> fetchFacilities() async {
    final response = await http
        .get(Uri.parse("https://mobileappapi.onrender.com/api/facility/all"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> fields = data['Field']; // Extract "Field" array

      return fields.map((json) => FacilityModels.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load facilities");
    }
  }

  // 🔵 Add Facility (POST Method)
  Future<bool> addFacility(FacilityModels facility) async {
    final response = await http.post(
      Uri.parse("https://mobileappapi.onrender.com/api/facility/create"),
      // Replace with actual API endpoint
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "FieldName": facility.fieldName,
        "FieldImage": facility.fieldImage,
        "EntryCount": facility.entryCount,
      }),
    );

    if (response.statusCode == 201) {
      return true; // Successfully added
    } else {
      print("Error: ${response.body}");
      return false; // Failed to add
    }
  }
}
