import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../CommenFiles/functions.dart';
import '../../../../CommenFiles/getXcontroller.dart';
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

  // List<Map<String, FacilitylistModel>> facility = [];
  // String responseMessage = "No response yet";
  // var facilityListApiData = FacilitylistModel().obs;

  // Future<void> sendPostRequest() async {
  //   print('dsfdsf');
  //   final url = Uri.parse(
  //       'https://mobileappapi.onrender.com/api//facility/create'); // Example API
  //   final headers = {'Content-Type': 'application/json'};
  //   final body =
  //       jsonEncode({"FieldName": "College", "FieldImage": "img_1.jpg"});
  //
  //   try {
  //     final response = await http.post(url, headers: headers, body: body);
  //
  //     if (response.statusCode == 201) {
  //       print('dsfdsf');
  //
  //       responseMessage = "Success: ${jsonDecode(response.body)['FieldName']}";
  //       print('day');
  //     } else {
  //       responseMessage = "Error: ${response.statusCode} - ${response.body}";
  //     }
  //   } catch (e) {
  //     responseMessage = "Failed to connect: $e";
  //   }
  // }

  Future<void> postData() async {
    try {
      final response = await http.post(
          Uri.parse('https://mobileappapi.onrender.com/api//facility/create'),
          headers: {'Content-Type': 'application/json'},
          body:
              json.encode({"FieldName": "College", "FieldImage": "img_1.jpg"}));

      if (response.statusCode == 201) {
        print('Success! Data added: ${response.body}');
        fetchfieldapi();
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<facility_data_model>> fetchfieldapi() async {
    print('object');

    final response = await http
        .get(Uri.parse('https://mobileappapi.onrender.com/api/facility/all'));

    if (response.statusCode == 200) {
      print('object1');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> hospitalList = jsonData["Hospital"]; // Extract List

      return hospitalList
          .map((json) => facility_data_model.fromJson(json))
          .toList();
    } else {
      print('object2');
      throw Exception("Failed to load hospital data");
    }
  }
}
