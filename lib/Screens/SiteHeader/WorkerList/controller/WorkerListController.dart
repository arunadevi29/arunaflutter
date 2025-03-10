import 'dart:convert';

import 'package:attendanceapp/Screens/SiteHeader/AddSiteWorker/model/addworkmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../Admin/FacilityCardDetails/view/Facilities_Screen.dart';
import 'package:http/http.dart' as http;

import '../../../ContractorAddWorker/view/ContractorAddWorkerScreen.dart';
import '../model/worklistmodel.dart';

class WorkerListController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  String Assoicate = assoicatedrop.first;
  String work = worktypedrop.first;

  bool passwordVisible = false;
  Set<int> disabledItems = {};
  TextEditingController searchController = TextEditingController();
  final RxList<String> images = [
    "assets/images/1.png",
  ].obs;
  Map<String, List<Worklistmodel>> workData = {};
  final List<String> workTypes = ["Electrician", "Plumber", "Driver"];
  final List<String> Assoicates = ["Ram", "Anand", "Mani"];
  bool Loading = true;

  //
  // void editItem(int index, context) {
  //   HospitalNameController.text = foundUsers[index]['name'];
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(
  //         'Edit Item',
  //         style: TextStyle(
  //             color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
  //       ),
  //       content: TextField(
  //         controller: HospitalNameController,
  //         decoration: InputDecoration(
  //           label: const Text(
  //             "Hospital",
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(15),
  //             // borderSide: BorderSide.none,
  //           ),
  //           fillColor: Color(0xfff5f7fa).withOpacity(0.1),
  //           // fillColor: Colors.white54,
  //           filled: true,
  //           // prefixIcon: const Icon(Icons.person),
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             'Cancel',
  //             style: TextStyle(
  //                 color: Colors.blue,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             foundUsers[index]['name'] = HospitalNameController.text;
  //
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             'Save',
  //             style: TextStyle(
  //                 color: Colors.blue,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  String data = "";

  cleaner() {
    firstNameController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
    ConfirmPasswordController.clear();
  }

  ///Edit///
  void edit(BuildContext context, int? Id, String workType, String firstName,
      String lastName, String mobileNumber, String work, String? image) {
    // TextEditingController fromTimeController =
    //     TextEditingController(text: firstName);
    // TextEditingController toTimeController =
    //     TextEditingController(text: lastName);
    String? selectedWorkType = workType;
    String? Selectwork = work;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Worker"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Work Type",
                  border: OutlineInputBorder(),
                ),
                value: workerListController.workTypes.contains(selectedWorkType)
                    ? selectedWorkType
                    : null, // Ensure valid value
                items: workerListController.workTypes
                    .toSet()
                    .toList()
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value.isNotEmpty ? value : null,
                    // Ensure non-null value
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  selectedWorkType = newValue;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Work",
                  border: OutlineInputBorder(),
                ),
                value:
                    workerListController.Assoicates.contains(selectedWorkType)
                        ? selectedWorkType
                        : null, // Ensure valid value
                items: workerListController.Assoicates.toSet()
                    .toList()
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value.isNotEmpty ? value : null,
                    // Ensure non-null value
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  selectedWorkType = newValue;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (Id == null ||
                    selectedWorkType == null ||
                    Selectwork == null) {
                  Get.snackbar("Error", "⚠ Please fill all fields!",
                      backgroundColor: Colors.red, colorText: Colors.white);
                  return;
                }

                await updatework(Id, selectedWorkType!, Selectwork, firstName,
                    mobileNumber, lastName, image.toString());

                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> updatework(int Id, String workType, String firstName,
      String lastName, String mobileNumber, String work, String image) async {
    String url = "https://mobileappapi.onrender.com/api/worker/update/$Id";

    final Map<String, dynamic> requestBody = {
      "WorkType": workType,
      "Work": work,
      "FirstName": firstName, // ✅ Include this field
      "LastName": lastName, // ✅ Include this if required
      "MobileNumber": mobileNumber, // ✅ Include this if required
      "Image": image
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
        worklistapi();
        print("✅ Update Successful for ID: $Id"); // Reload updated data
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
  String? selectedWork; // Work Dropdown selection
  String? selectedWorkType; // Work Type Dropdown selection

  final List<String> workOptions = [
    "Security",
    "Driver",
    "Electrician",
    "Plumber"
  ];
  final List<String> workTypeOptions = ["Anandhi", "Mani", "John"];

  // 🌟 Send Data to API
  Future<void> addPostapi() async {
    if (selectedWork == null ||
        selectedWorkType == null ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        mobileNumberController.text.isEmpty) {
      print("⚠ Please fill all fields!");
      return;
    }

    final Map<String, dynamic> requestBody = {
      "FirstName": firstNameController.text.trim(),
      "LastName": lastNameController.text.trim(),
      "MobileNumber": mobileNumberController.text.trim(),
      "Work": selectedWork,
      "WorkType": selectedWorkType,
      "Image": "img1.jpg" // Static image name for now
    };

    try {
      var response = await http.post(
        Uri.parse("https://mobileappapi.onrender.com/api/worker/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      String responseBody = response.body;
      print("📩 API Response: $responseBody");
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        worklistapi();
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  final String apiUrl =
      "https://mobileappapi.onrender.com/api/worker/all"; // Replace with your actual API URL

  Future<Map<String, List<Worklistmodel>>> worklistapi({String? query}) async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/worker/all'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        Map<String, List<Worklistmodel>> separatedData = {};

        jsonData.forEach((key, value) {
          if (value is List) {
            separatedData[key] =
                value.map((item) => Worklistmodel.fromJson(item)).toList();
          }
        });

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          separatedData = separatedData.map((key, value) {
            final filteredList = value
                .where((site) =>
                    site.firstName!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.lastName!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.work!.toLowerCase().contains(query.toLowerCase()) ||
                    site.workType!.toLowerCase().contains(query.toLowerCase()))
                .toList();
            return MapEntry(key, filteredList);
          });
        }

        return separatedData;
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Failed to load data: $e\n$stackTrace');
      throw Exception('Failed to load data: $e\n$stackTrace');
    }
  }

  Future<void> WorkUpdateapi(int id) async {
    String url =
        "https://mobileappapi.onrender.com/api/worker/update/$id"; // Update API URL

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "FirstName": firstNameController.text.trim(),
          "LastName": lastNameController.text.trim(),
          "MobileNumber": mobileNumberController.text.trim(),
          "Work": selectedWork,
          "WorkType": selectedWorkType,
          "Image": "img1.jpg".toString()
        }), // Convert model to JSON
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item update added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        worklistapi();
        print("✅ Update Successful for ID: $id");
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  String text = '';
  final List<Map<String, dynamic>> allUsers = [
    {
      "id": 1,
      "image": "assets/images/men_img.png",
      "name": "Suriya R",
      "des": "Site A; 12.9385265  |   77.707028 ",
      "Site Head": "Security",
      "Report User": "Shift - 1"
    },
    {
      "id": 2,
      "image": "assets/images/men_img.png",
      "name": "Mani R",
      "des": "Site A; 12.9385265  |   77.707028 ",
      "Site Head": "Security",
      "Report User": "Shift - 1"
    },
    {
      "id": 3,
      "image": "assets/images/2.png",
      "name": "Ram R",
      "des": "Site A; 12.9385265  |   77.707028 ",
      "Site Head": "Security",
      "Report User": "Shift - 1"
    },
    {
      "id": 4,
      "image": "assets/images/men_img.png",
      "name": "Preveen R",
      "des": "Site A; 12.9385265  |   77.707028 ",
      "Site Head": "Security",
      "Report User": "Shift - 1"
    },
    {
      "id": 5,
      "image": "assets/images/1.png",
      "name": "Kumar R",
      "des": "Site A; 12.9385265  |   77.707028 ",
      "Site Head": "Security",
      "Report User": "Shift - 1"
    },
  ];

// This list holds the data for the list view
  List<Map<String, dynamic>> foundUsers = [];
}
