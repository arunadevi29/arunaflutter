import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../CommenFiles/functions.dart';
import '../../../../CommenFiles/getXcontroller.dart';
import '../../AddNewFacilityScreen/model/facilitymodeldata.dart';
import '../model/FacilitylistModel.dart';

class FacilityCardDetailsController extends GetxController {
  List Hospital = [
    "Appolo",
    "East Coast Hospitals",
    "JIPMER Hospital",
    "A.G. Padmavati's Hospital Ltd"
  ];
  RxBool loader = false.obs;
  RxBool refreshLoader = false.obs;
  int index = 0;
  List<String> list = [];
  bool Loading = false;
  bool isDisabled = false;
  TextEditingController searchController = TextEditingController();
  Map<String, List<FacilityModeldata>> facilityData = {};
  final RxList<String> images = [
    "assets/images/hopital1.png",
  ].obs;
  List<String> image = [
    "assets/images/hopital1.png",
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController entryController = TextEditingController();
  TextEditingController CategeryController = TextEditingController();
  List<FacilityModeldata> facilities = [];
  bool visible = false;
  Set<int> disabledItems = {}; // Store IDs of disabled items

  void disableItem(int id) {
    disabledItems.add(id); // Mark item as disabled
  }

  cleaner() {
    nameController.clear();
    imageController.clear();
  }

  ///edit option//////

  void editFacility(
      BuildContext context, int id, String currentName, String currentImage) {
    TextEditingController nameController =
        TextEditingController(text: currentName);
    TextEditingController imageController =
        TextEditingController(text: currentImage);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Facility"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Facility Name"),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: "Facility Image URL"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            facilityCardDetailsController.Loading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () {
                      facilityCardDetailsController.refreshLoader.value = true;
                      facilityUpdateapi(
                          nameController.text, imageController.text, id);
                      facilityCardDetailsController.refreshLoader.value = false;
                      Navigator.pop(context); // Close the dialog after updating
                    },
                    child: Text("Update"),
                  ),
          ],
        );
      },
    );
  }

  var selectedImage = Rxn<File>(); // Observable image file

  // 📌 Function to pick an image
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // 📌 Function to upload text + image

  Future<void> uploadData() async {
    if (nameController.text.isEmpty || selectedImage.value == null) {
      Get.snackbar("Error", "Please enter text and select an image",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final url =
        Uri.parse("https://mobileappapi.onrender.com/api/facility/create");
    var request = http.MultipartRequest("POST", url);

    request.fields["text"] = nameController.text;

    var multipartFile = await http.MultipartFile.fromPath(
      "image",
      selectedImage.value!.path,
      contentType: MediaType('image', 'jpeg'), // Force image type
    );

    request.files.add(multipartFile);

    try {
      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print("Response Code: ${response.statusCode}");
      print("Response Body: $responseString"); // This shows the full error

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Upload Successful",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Failed", "Upload Failed: $responseString",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future<void> uploadData() async {
  //   if (nameController.text.isEmpty || selectedImage.value == null) {
  //     Get.snackbar("Error", "Please enter text and select an image",
  //         snackPosition: SnackPosition.BOTTOM);
  //     return;
  //   }
  //
  //   final url =
  //       Uri.parse("https://mobileappapi.onrender.com/api/facility/create");
  //   var request = http.MultipartRequest("POST", url);
  //
  //   request.fields["text"] = nameController.text;
  //   request.files.add(
  //     await http.MultipartFile.fromPath("image", selectedImage.value!.path),
  //   );
  //
  //   try {
  //     final response = await request.send();
  //     final responseString = await response.stream.bytesToString();
  //     if (response.statusCode == 200) {
  //       Get.snackbar("Success", "Upload Successful",
  //           snackPosition: SnackPosition.BOTTOM);
  //     } else {
  //       Get.snackbar("Failed", "Upload Failed: $responseString",
  //           snackPosition: SnackPosition.BOTTOM);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Something went wrong: $e",
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  Future<void> addField(
    String fieldName,
    String fieldImage,
  ) async {
    refreshLoader.value = true;
    final url = Uri.parse(
        "https://mobileappapi.onrender.com/api/facility/create"); // Change to your API URL

    final Map<String, dynamic> requestBody = {
      "FieldName": fieldName,
      "FieldImage": fieldImage,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
        refreshLoader.value = false;
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    //     print("Field added successfully!");
    //   } else {
    //     print("Failed to add field. Status: ${response.statusCode}");
    //     print("Response: ${response.body}");
    //   }
    // } catch (e) {
    //   print("Error: $e");
    // }
  }

  ///get method///////
  // Future<List<int>> facilitygetApis() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('https://mobileappapi.onrender.com/api/facility/50'),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonData = jsonDecode(response.body);
  //
  //       List<int> ids = [];
  //       jsonData.forEach((key, value) {
  //         ids.addAll(List<FacilityModeldata>.from(
  //                 value.map((x) => FacilityModeldata.fromJson(x)))
  //             .map((facility) => facility.id)
  //             .toList());
  //       });
  //
  //       return ids;
  //     } else {
  //       throw Exception(
  //           'Failed to load data. Status code: ${response.statusCode}');
  //     }
  //   } catch (e, stackTrace) {
  //     print('Failed to load data: $e\n$stackTrace');
  //     throw Exception('Failed to load data: $e\n$stackTrace');
  //   }
  // }

  Future<Map<String, List<FacilityModeldata>>> facilitygetApi(
      {String? query}) async {
    refreshLoader.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/facility/all'),
      );

      if (response.statusCode == 200) {
        print("sathya");
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<FacilityModeldata>>(
                key,
                List<FacilityModeldata>.from(
                    value.map((x) => FacilityModeldata.fromJson(x)))));

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

  Future<void> facilityUpdateapi(
      String fieldName, String fieldImage, int id) async {
    refreshLoader.value = true;
    String url =
        "https://mobileappapi.onrender.com/api/facility/update/$id"; // Update API URL

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": id,
          "FieldName": fieldName,
          "FieldImage": fieldImage
        }), // Convert model to JSON
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item update added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
        print("✅ Update Successful for ID: $id");
        facilitygetApi();
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

////Delete api////
  var workList = <Map<String, FacilityModeldata>>[].obs;

  Future<void> deleteWork(int Id) async {
    refreshLoader.value = true;
    String url =
        "https://mobileappapi.onrender.com/api/facility/delete/$Id"; // Delete API URL

    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        workList.removeWhere((work) => work['id'] == Id); // Remove from list
        Get.snackbar("Success", "✅ Work item deleted successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
        refreshLoader.value = false;
      } else {
        Get.snackbar("Error", "❌ Failed to delete work: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
