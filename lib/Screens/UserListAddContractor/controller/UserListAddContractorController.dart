import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Admin/FacilityCardDetails/view/Facilities_Screen.dart';

class UserListAddContractorController extends GetxController {
  TextEditingController HospitalNameController = TextEditingController();
  TextEditingController SecurityNameController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController reportNameController = TextEditingController();
  List<Reportsmodel> reportsmodel = List.empty(growable: true);
  TextEditingController _controller = TextEditingController();
  Set<int> disabledItems = {};

  void editcontractor(BuildContext context, int id, String firstName,
      String lastName, String mobileNumber, String? image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Contractor"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: addContractorController.FirstNameController,
                  decoration: InputDecoration(labelText: "First Name")),
              TextField(
                  controller: addContractorController.LastNameController,
                  decoration: InputDecoration(labelText: "Last Name")),
              TextField(
                  controller: addContractorController.MobileNumberController,
                  decoration: InputDecoration(labelText: "Mobile Number")),
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
                addContractorController.ContractorUpdateapi(id);
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
}
