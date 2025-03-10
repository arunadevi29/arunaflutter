import 'dart:convert';
import 'dart:ui';

import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/model/Siteheadmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../CommenFiles/getXcontroller.dart';
import '../../Admin/FacilityCardDetails/model/FacilitylistModel.dart';
import '../../Admin/FacilityCardDetails/view/Facilities_Screen.dart';
import '../../SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
import '../model/SiteHeadListModel.dart';

class UserListSiteHeaderController extends GetxController {
  TextEditingController HospitalNameController = TextEditingController();
  TextEditingController SecurityNameController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController reportNameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<Reportsmodel> reportsmodel = List.empty(growable: true);
  TextEditingController _controller = TextEditingController();
  bool isDisabled = false;
  Map<String, List<SiteheadModel>> facilityData = {};

  Set<int> disabledItems = {}; // Track disabled item IDs

  void toggleDisableItem(int id) {
    if (disabledItems.contains(id)) {
      disabledItems.remove(id); // Enable the item
    } else {
      disabledItems.add(id); // Disable the item
    }
  }

  void editsitehead(
    BuildContext context,
    int siteheadid,
    String firstName,
    String lastName,
    String mobileNumber,
    String field,
    String fieldSiteName,
    String? image,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Sitehead"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: addSiteHeadController.FirstNameController,
                  decoration: InputDecoration(labelText: "First Name")),
              TextField(
                  controller: addSiteHeadController.LastNameController,
                  decoration: InputDecoration(labelText: "Last Name")),
              // TextField(
              //     maxLength: 10,
              //     controller: addSiteHeadController.MobileNumberController,
              //     decoration: InputDecoration(labelText: "Mobile Number")),
              TextField(
                  controller: addSiteHeadController.FieldController,
                  decoration: InputDecoration(labelText: "Field")),
              TextField(
                  controller: addSiteHeadController.FieldSiteNamerController,
                  decoration: InputDecoration(labelText: "Field Site Name")),
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
                addSiteHeadController.SiteheadUpdateapi(
                  siteheadid,
                );
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

////disable///

// void editItem(context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text("Edit Sitehead"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//                 controller: addSiteHeadController.FirstNameController,
//                 decoration: InputDecoration(labelText: "First Name")),
//             TextField(
//                 controller: addSiteHeadController.LastNameController,
//                 decoration: InputDecoration(labelText: "Last Name")),
//             TextField(
//                 controller: addSiteHeadController.MobileNumberController,
//                 decoration: InputDecoration(labelText: "Mobile Number")),
//             TextField(
//                 controller: addSiteHeadController.FieldController,
//                 decoration: InputDecoration(labelText: "Field")),
//             TextField(
//                 controller: addSiteHeadController.FieldSiteNamerController,
//                 decoration: InputDecoration(labelText: "Field Site Name")),
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
//               addSiteHeadController.SiteheadUpdateapi(siteheadid);
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
