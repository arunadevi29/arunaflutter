import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../CommenFiles/functions.dart';
import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../widgets/AppBarSample.dart';
import '../model/ShiftTimeModel.dart';
import '../view/Shift_Time_From_screen.dart';

class ShifttimeformController extends GetxController {
  TextEditingController SelectWorkTypeController = TextEditingController();
  TextEditingController SelectShiftController = TextEditingController();
  TextEditingController FromshiftController = TextEditingController();
  TextEditingController ToshiftController = TextEditingController();
  Map<String, List<HouseKeeping>> shifttimeData = {};

  List<HouseKeeping> shifttimedata = [];

  bool Loading = true;
  TextEditingController searchController = TextEditingController();

  // SampleItem? selectedItem;

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

  ///// Timedate////////

  TextEditingController timeRangeController = TextEditingController();
  RxBool refreshLoader = false.obs;

  // Dropdown selections
  var selectedWorkType = RxnString();
  var selectedShiftName = RxnString();

  // Time selections
  var selectedFromTime = Rxn<TimeOfDay>();
  var selectedToTime = Rxn<TimeOfDay>();

  // Controllers for displaying selected time
  final TextEditingController fromTimeController = TextEditingController();
  final TextEditingController toTimeController = TextEditingController();

  // Work Type & Shift Name Options
  final List<String> workTypes = ["Electrician", "Plumber", "Driver"];
  final List<String> shiftNames = ["Morning", "Afternoon", "Night"];

  ///Edit///
  // void editshifttime(BuildContext context, int? shiftId, String? workType,
  //     String? shiftName, String? shiftFrom, String? shiftTo) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text("Edit Sitehead"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //                 controller: shifttimeformController.fromTimeController,
  //                 decoration: InputDecoration(labelText: "First Name")),
  //             TextField(
  //                 controller: shifttimeformController.toTimeController,
  //                 decoration: InputDecoration(labelText: "Last Name")),
  //             DropdownButton(
  //                 underline: SizedBox(),
  //                 icon: Icon(
  //                   Icons.arrow_drop_down,
  //                   color: Colors.blue,
  //                   size: 35,
  //                 ),
  //                 items: [
  //                   DropdownMenuItem(
  //                       value: selectedWorkType,
  //                       child: Text(
  //                         'work type',
  //                         style: TextStyle(color: Colors.black, fontSize: 18),
  //                       )),
  //                   DropdownMenuItem(
  //                       value: selectedShiftName,
  //                       child: Text(
  //                         'shift',
  //                         style: TextStyle(color: Colors.black, fontSize: 18),
  //                       )),
  //                 ],
  //                 onChanged: (value) {
  //                   // controller.setLocale(value);
  //                 }),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text("Cancel"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               // int siteheadid = 5;
  //               workerListController.WorkUpdateapi(shiftId!);
  //
  //               Navigator.pop(context);
  //             },
  //             child: Text("Save"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void editShiftTime(BuildContext context, int? shiftId, String? workType,
      String? shiftName, String? shiftFrom, String? shiftTo) {
    TextEditingController fromTimeController =
        TextEditingController(text: shiftFrom);
    TextEditingController toTimeController =
        TextEditingController(text: shiftTo);
    String? selectedWorkType = workType;
    String? selectedShiftName = shiftName;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Shift Time"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fromTimeController,
                decoration: InputDecoration(labelText: "Shift From"),
              ),
              TextField(
                controller: toTimeController,
                decoration: InputDecoration(labelText: "Shift To"),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Work Type",
                  border: OutlineInputBorder(),
                ),
                value:
                    shifttimeformController.workTypes.contains(selectedWorkType)
                        ? selectedWorkType
                        : null, // Ensure valid value
                items: shifttimeformController.workTypes
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
                  labelText: "Select Work Type",
                  border: OutlineInputBorder(),
                ),
                value: shifttimeformController.shiftNames
                        .contains(selectedWorkType)
                    ? selectedWorkType
                    : null, // Ensure valid value
                items: shifttimeformController.shiftNames
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (shiftId == null ||
                    selectedWorkType == null ||
                    selectedShiftName == null ||
                    fromTimeController.text.isEmpty ||
                    toTimeController.text.isEmpty) {
                  Get.snackbar("Error", "⚠ Please fill all fields!",
                      backgroundColor: Colors.red, colorText: Colors.white);
                  return;
                }

                await updateShifts(
                  shiftId.toString(),
                  selectedWorkType!,
                  selectedShiftName!,
                  fromTimeController.text,
                  toTimeController.text,
                );

                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> updateShifts(String shiftId, String workType, String shiftName,
      String shiftFrom, String shiftTo) async {
    String url = "https://mobileappapi.onrender.com/api/shift/update/$shiftId";

    final Map<String, dynamic> requestBody = {
      "WorkType": workType,
      "ShiftName": shiftName,
      "ShiftFrom": formatTimes(shiftFrom),
      "ShiftTo": formatTimes(shiftTo),
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
        Shifttimegetapi();
        print("✅ Update Successful for ID: $shiftId"); // Reload updated data
      } else {
        Get.snackbar("Error", "❌ Failed to update shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  String formatTimes(String time) {
    DateTime parsedTime = DateTime.parse(time);
    return "${parsedTime.hour.toString().padLeft(2, '0')}:${parsedTime.minute.toString().padLeft(2, '0')}:00";
  }

  // Function to pick time
  Future<void> pickTime(bool isFromTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      if (isFromTime) {
        selectedFromTime.value = pickedTime;
        fromTimeController.text = formatTime(pickedTime);
      } else {
        selectedToTime.value = pickedTime;
        toTimeController.text = formatTime(pickedTime);
      }
    }
  }

  // Format TimeOfDay to "HH:mm:ss"
  String formatTime(TimeOfDay? time) {
    if (time == null) return "";
    final now = DateTime.now();
    return DateFormat('HH:mm:ss')
        .format(DateTime(now.year, now.month, now.day, time.hour, time.minute));
  }

  // Function to send data to API

  String formattedDate =
      DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
  File? galleryFile;
  final picker = ImagePicker();

  void showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery, context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera, context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(ImageSource img, context) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      galleryFile = File(pickedFile!.path);
      shifttimeformController.dateTime = DateTime.now().toString();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
          const SnackBar(content: Text('Nothing is selected')));
    }
  }

/////////postmethod//////
  Future<void> addShift() async {
    String url = "https://mobileappapi.onrender.com/api/shift/create";

    if (selectedWorkType.value == null ||
        selectedShiftName.value == null ||
        selectedFromTime.value == null ||
        selectedToTime.value == null) {
      Get.snackbar("Error", "⚠ Please fill all fields!",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    final Map<String, dynamic> requestBody = {
      "WorkType": selectedWorkType.value,
      "ShiftName": selectedShiftName.value,
      "ShiftFrom": formatTime(selectedFromTime.value),
      "ShiftTo": formatTime(selectedToTime.value),
    };

    print("📩 Sending Request: ${jsonEncode(requestBody)}");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print("🔍 Response Status Code: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Shift added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "❌ Failed to add shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

//////getmethod////////
  Future<Map<String, List<HouseKeeping>>> Shifttimegetapi(
      {String? query}) async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/shift/all'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<HouseKeeping>>(
                key,
                List<HouseKeeping>.from(
                    value.map((x) => HouseKeeping.fromJson(x)))));

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          final filteredSiteheads = siteheads.map((key, value) {
            final filteredList = value
                .where((site) =>
                    site.workType!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.shiftName!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.shiftFrom!
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    site.shiftTo!.toLowerCase().contains(query.toLowerCase()))
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

// Future<void> updateShift(String shiftId) async {
//   String url = "https://mobileappapi.onrender.com/api/shift/update/$shiftId";
//
//   if (selectedWorkType.value == null ||
//       selectedShiftName.value == null ||
//       selectedFromTime.value == null ||
//       selectedToTime.value == null) {
//     Get.snackbar("Error", "⚠ Please fill all fields!",
//         backgroundColor: Colors.red, colorText: Colors.white);
//     return;
//   }
//
//   final Map<String, dynamic> requestBody = {
//     "WorkType": selectedWorkType.value,
//     "ShiftName": selectedShiftName.value,
//     "ShiftFrom": formatTime(selectedFromTime.value),
//     "ShiftTo": formatTime(selectedToTime.value),
//   };
//
//   print("📩 Sending Update Request: ${jsonEncode(requestBody)}");
//
//   try {
//     final response = await http.put(
//       Uri.parse(url), // ✅ Use PUT request
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(requestBody),
//     );
//
//     print("🔍 Response Status Code: ${response.statusCode}");
//     print("🔍 Response Body: ${response.body}");
//
//     if (response.statusCode == 200) {
//       Get.snackbar("Success", "✅ Shift updated successfully!",
//           backgroundColor: Colors.green, colorText: Colors.white);
//       Shifttimegetapi();
//       print("✅ Update Successful for ID: $shiftId");
//     } else {
//       Get.snackbar("Error", "❌ Failed to update shift: ${response.body}",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   } catch (e) {
//     Get.snackbar("Error", "⚠ API Error: $e",
//         backgroundColor: Colors.red, colorText: Colors.white);
//   }
// }

//   Future<void> selectStartTime(BuildContext context) async {
//     final TimeOfDay? selectedStartTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     if (selectedStartTime != null) {
//       final now = DateTime.now();
//       final selectedDateTime = DateTime(now.year, now.month, now.day,
//           selectedStartTime.hour, selectedStartTime.minute);
//       final formattedStartTime =
//           DateFormat.jm().format(selectedDateTime); // Format as AM/PM
//
//       // If end time is already set, combine both start and end times
//       String currentTimeRange =
//           shifttimeformController.FromshiftController.text;
//       if (currentTimeRange.contains('-')) {
//         shifttimeformController.FromshiftController.text =
//             formattedStartTime + " - " + currentTimeRange.split(' - ')[1];
//       } else {
//         shifttimeformController.FromshiftController.text =
//             formattedStartTime; // Set start time if end time isn't set
//       }
//     }
//   }
//
// // Function to show time picker for End Time and update the TextField
//   Future<void> selectEndTime(BuildContext context) async {
//     final TimeOfDay? selectedEndTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     if (selectedEndTime != null) {
//       final now = DateTime.now();
//       final selectedDateTime = DateTime(now.year, now.month, now.day,
//           selectedEndTime.hour, selectedEndTime.minute);
//       final formattedEndTime =
//           DateFormat.jm().format(selectedDateTime); // Format as AM/PM
//
//       // If start time is already set, combine both start and end times
//       String currentTimeRange = shifttimeformController.ToshiftController.text;
//       if (currentTimeRange.contains('-')) {
//         shifttimeformController.ToshiftController.text =
//             currentTimeRange.split(' - ')[0] + " - " + formattedEndTime;
//       } else {
//         shifttimeformController.ToshiftController.text = currentTimeRange +
//             formattedEndTime; // Set end time if start time isn't set
//       }
//     }
//   } //

// Function to show time picker for Start Time and update the TextField
}
