import 'dart:convert';
import 'dart:ui';

import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/model/Siteheadmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../CommenFiles/getXcontroller.dart';
import '../../Admin/FacilityCardDetails/view/Facilities_Screen.dart';
import '../model/SiteHeadListModel.dart';

class UserListSiteHeaderController extends GetxController {
  TextEditingController HospitalNameController = TextEditingController();
  TextEditingController SecurityNameController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController reportNameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<Reportsmodel> reportsmodel = List.empty(growable: true);
  TextEditingController _controller = TextEditingController();

  Rx<List<Map<String, Hospital>>> foundPlayers =
      Rx<List<Map<String, Hospital>>>([]);

// Future<List<Hospital>> fetchHospitals() async {
//   print('object');
//   final response = await http
//       .get(Uri.parse('https://mobileappapi.onrender.com/api/sitehead/all'));
//
//   if (response.statusCode == 200) {
//     print('object1');
//     Map<String, dynamic> jsonData = jsonDecode(response.body);
//     List<dynamic> hospitalList = jsonData["Hospital"]; // Extract List
//     hospitals = jsonDecode(response.body);
//     return hospitalList.map((json) => Hospital.fromJson(json)).toList();
//   } else {
//     print('object1');
//     throw Exception("Failed to load hospital data");
//   }
// }

  /// **POST Method: Add New Item**

// @override
// void onInit() {
//   super.onInit();
//   foundPlayers.value = allPlayers;
// }
//
// @override
// void onReady() {
//   super.onReady();
// }
//
// @override
// void onClose() {}
//
// void filteredItems(String enteredKeyword) {
//   List<Map<String, Hospital>> results = [];
//
//   if (enteredKeyword.isEmpty) {
//     // if the search field is empty or only contains white-space, we'll display all users
//     results = allPlayers;
//   } else {
//     results = allPlayers
//         .where((user) => user['FirstName']
//             .toString()
//             .toLowerCase()
//             .contains(enteredKeyword.toLowerCase()))
//         .toList();
//
//     // we use the toLowerCase() method to make it case-insensitive
//   }
//
//   // Refresh the UI
//
//   foundPlayers.value = results;
// }
//
// void editItem(int index, context) {
//   //HospitalNameController.text = foundUsers[index]['FirstName'];
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
//             //foundUsers[index]['FirstName'] = HospitalNameController.text;
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
//
// String text = '';
// final List<Map<String, Hospital>> allUsers = [
//   // {
//   //   "id": 1,
//   //   "image": "assets/images/men_img.png",
//   //   "name": "Kumar R",
//   //   "des": "Site A",
//   //   // "Site Head": "Security",
//   //   // "Report User": "Shift - 1"
//   // },
//   // {
//   //   "id": 2,
//   //   "image": "assets/images/men_img.png",
//   //   "name": "Mani R",
//   //   "des": "Site A",
//   //   // "Site Head": "Security",
//   //   // "Report User": "Shift - 1"
//   // },
//   // {
//   //   "id": 3,
//   //   "image": "assets/images/2.png",
//   //   "name": "Sekar R",
//   //   "des": "Site A",
//   //   // "Site Head": "Security",
//   //   // "Report User": "Shift - 1"
//   // },
//   // {
//   //   "id": 4,
//   //   "image": "assets/images/men_img.png",
//   //   "name": "Anand R",
//   //   "des": "Site A",
//   //   // "des": "Site A; 12.9385265  |   77.707028 ",
//   //   // "Site Head": "Security",
//   //   // "Report User": "Shift - 1"
//   // },
//   // {
//   //   "id": 5,
//   //   "image": "assets/images/1.png",
//   //   "name": "Arul R",
//   //   "des": "Site A",
//   //   // "Site Head": "Security",
//   //   // "Report User": "Shift - 1"
//   // },
// ];
//
// // This list holds the data for the list view
// List<Map<String, dynamic>> foundUsers = [];
}
