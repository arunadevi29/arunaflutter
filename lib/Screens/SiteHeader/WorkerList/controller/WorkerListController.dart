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
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  String Assoicate = assoicatedrop.first;
  String work = worktypedrop.first;
  var dropname = "";
  bool passwordVisible = false;
  List<Reportsmodel> reportsmodel = List.empty(growable: true);
  TextEditingController controller = TextEditingController();
  TextEditingController searchController = TextEditingController();

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

  var workmodeldata = <Security>[].obs;

  String data = "";

  // Fetch users (GET Method)

//////getmethod//////////////////

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
