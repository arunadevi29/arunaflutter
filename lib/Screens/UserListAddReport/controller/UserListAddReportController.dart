import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Admin/FacilityCardDetails/view/Facilities_Screen.dart';
import '../../SiteHeader/AddReportManager/model/ReportManagerModel.darrt.dart';

class UserListAddReportController extends GetxController {
  TextEditingController HospitalNameController = TextEditingController();
  TextEditingController SecurityNameController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController reportNameController = TextEditingController();
  List<Reportsmodel> reportsmodel = List.empty(growable: true);
  TextEditingController _controller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final RxList<String> images = [
    "assets/images/1.png",
  ].obs;
  Map<String, List<ReportManagers>> siteheadData = {};

// void editreport(BuildContext context, int reportid, String firstName,
//     String lastName, String mobileNumber, String? image) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Edit Facility"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//                 controller: addReportController.FirstNameController,
//                 decoration: InputDecoration(labelText: "First Name")),
//             TextField(
//                 controller: addReportController.LastNameController,
//                 decoration: InputDecoration(labelText: "Last Name")),
//             TextField(
//                 controller: addReportController.MobileNumberController,
//                 decoration: InputDecoration(labelText: "Mobile Number")),
//             // TextField(
//             //     controller: addReportController.images.toString(),
//             //     decoration: InputDecoration(labelText: "Field")),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // Close the dialog
//             },
//             child: Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               addReportController.reportmanagerUpdateapi(reportid!);
//               // facilityUpdateapi(
//               //     nameController.text, imageController.text, id);
//               Navigator.pop(context); // Close the dialog after updating
//             },
//             child: Text("Update"),
//           ),
//         ],
//       );
//     },
//   );
// }
}
