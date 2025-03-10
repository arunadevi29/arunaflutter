import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../CommenFiles/getXcontroller.dart';
import '../model/worktypemodeldata.dart';

class AddWorkTypeController extends GetxController {
  TextEditingController WorkTypeController = TextEditingController();
  Map<String, List<WorkTypeModeldata>> workData = {};

  bool Loading = true;
  TextEditingController searchController = TextEditingController();
  var workDataapi = {}.obs; // Observable map

  ///edit option//////

  void editFacility(BuildContext context, final int id, final String workType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Facility"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: WorkTypeController,
                decoration: InputDecoration(labelText: "Facility Name"),
              ),
              // TextField(
              //   controller: imageController,
              //   decoration: InputDecoration(labelText: "Facility Image URL"),
              // ),
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
                workUpdateapi(id);
                Navigator.pop(context); // Close the dialog after updating
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  ///postmethodapi////
  Future<void> addworkPostapi() async {
    String url =
        "https://mobileappapi.onrender.com/api/work/create"; // Replace with your API endpoint

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "WorkType": WorkTypeController.text.trim(),

          // "Image": "img5.png".toString()
        }), // Convert object to JSON string
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        workgetapi();
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<Map<String, List<WorkTypeModeldata>>> workgetapi(
      {String? query}) async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/work/all'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<WorkTypeModeldata>>(
                key,
                List<WorkTypeModeldata>.from(
                    value.map((x) => WorkTypeModeldata.fromJson(x)))));

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          final filteredSiteheads = siteheads.map((key, value) {
            final filteredList = value
                .where((site) =>
                    site.workType!.toLowerCase().contains(query.toLowerCase()))
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

  Future<void> workUpdateapi(int worktid) async {
    String url =
        "https://mobileappapi.onrender.com/api/work/update/$worktid"; // Update API URL

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": worktid,
          "WorkType": WorkTypeController.text,
        }), // Convert model to JSON
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅Item update successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        workgetapi();
        print("Item updated successfully!:$worktid");
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
  var workList = <Map<String, WorkTypeModeldata>>[].obs;

  Future<void> deleteWork(int workId) async {
    String url =
        "https://mobileappapi.onrender.com/api/work/delete/$workId"; // Delete API URL

    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        workList
            .removeWhere((work) => work['id'] == workId); // Remove from list
        Get.snackbar("Success", "✅ Work item deleted successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
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
