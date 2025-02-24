import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../CommenFiles/functions.dart';
import '../../../../CommenFiles/getXcontroller.dart';
import '../../../Admin/FacilityDetails/View/FacilityDetails.dart';
import '../../../UserListAddSiteHeader/model/SiteHeadListModel.dart';
import '../model/SinglehospitalModel.dart';
import '../model/Siteheadmodel.dart';

class AddSiteHeadController extends GetxController {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  bool passwordVisible = false;
  var dropname = "";
  final RxList<String> images = [
    "assets/images/1.png",
  ].obs;

  var timepicker = "";
  String lat = "";
  String long = "";
  RxBool loader = false.obs;
  RxBool refreshLoader = false.obs;
  List<Map<String, dynamic>> items = [];
  var errorMessage = ''.obs;

  // Position? position;

  var Hospitallistdata = Hospital().obs;
  var products = <Hospital>[];

  var isLoading = true.obs;

  ////postmethodapi//////

  // Future<void> addUser(firstname, lastname, field, fieldsitename, mobileno,
  //     password, confirmpassword, image) async {
  //   String url =
  //       "https://mobileappapi.onrender.com/api/sitehead/create"; // Replace with actual API
  //
  //   User newUser = User(
  //       id: users.length + 1,
  //       firstName: firstname,
  //       lastName: lastname,
  //       field: field,
  //       fieldSiteName: fieldsitename,
  //       mobileNumber: mobileno,
  //       password: password,
  //       confirmPassword: confirmpassword,
  //       image: image);
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(newUser),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       users.add(newUser); // Update UI dynamically
  //     } else {
  //       print("Failed to add user: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Request failed: $e");
  //   }
  // }

/////getmethodapi/////
//////postmethod//////

  Future<void> addItem() async {
    String url =
        "https://mobileappapi.onrender.com/api/sitehead/create"; // Replace with your API endpoint

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "FirstName": FirstNameController.text,
          "LastName": LastNameController.text,
          "MobileNumber": MobileNumberController.text,
          "Field": FieldController.text,
          "FieldSiteName": FieldSiteNamerController.text,
          "Password": EnterPasswordController.text,
          "ConfirmPassword": ConfirmPasswordController.text,
          "Image": "img1.jpg".toString()
        }), // Convert object to JSON string
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // var jsonDatas = jsonDecode(response.body);
        // products.add(jsonDatas);

        fetchHospitals();

        print("Item added successfully!");
      } else {
        print("Failed to add item: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  ////getmethod/////////
  Future<List<Hospital>> fetchHospitals() async {
    print('object');
    final response = await http
        .get(Uri.parse('https://mobileappapi.onrender.com/api/sitehead/all'));

    if (response.statusCode == 200) {
      print('object1');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> Hospitallistdata = jsonData["Hospital"]; // Extract List

      return Hospitallistdata.map((json) => Hospital.fromJson(json)).toList();
    } else {
      print('object2');
      throw Exception("Failed to load hospital data");
    }
  }

// Future<User?> fetchSingleSite() async {
//   String url =
//       "https://mobileappapi.onrender.com/api/sitehead/3"; // Replace with your API URL
//
//   try {
//     var response = await http.get(Uri.parse(url));
//     print("aruna");
//     if (response.statusCode == 200) {
//       print("arunadevi");
//       var jsonData = jsonDecode(response.body)
//       as List<dynamic>; // ✅ Parse JSON as List<dynamic>
//       var jsonDatas = jsonDecode(response.body);
//       dataList.add(jsonDatas);
//       siteheadmodeldata = jsonDecode(response.body);
//       if (response
//           .toString()
//           .isNotEmpty) {
//         var jsonData = jsonDecode(response.body) as List; // ✅ Parse as List
//         users.value = User.fromJsonList(jsonData);
//       }
//     } else {
//       print("Error: ${response.statusCode}");
//       return null;
//     }
//   } catch (e) {
//     print("Request failed: $e");
//     return null;
//   }
// }
// Future<List<User>> fetchUsers() async {
//   String url =
//       "https://mobileappapi.onrender.com/api/sitehead/all"; // Replace with your API URL
//
//   try {
//     var response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       print("sk donr ${siteheadmodeldata.value.fieldSiteName}");
//       List<dynamic> jsonData = jsonDecode(response.body); // Decode JSON List
//       return jsonData.map((user) => User.fromJson(user)).toList();
//
//       // Convert List<Map> to List<User>
//     } else {
//       print("Error: ${response.statusCode}");
//       return [];
//     }
//   } catch (e) {
//     print("Request failed: $e");
//     return [];
//   }
// }
}
