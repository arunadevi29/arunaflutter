import 'dart:convert';

import 'package:attendanceapp/Screens/LoginScreen/view/LoginScreen.dart';
import 'package:attendanceapp/Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../CommenFiles/functions.dart';

class SignUpController extends GetxController {
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  RxBool isChecked = false.obs;
  RxBool sendOtp = false.obs;
  RxBool signUpLoader = false.obs;
  RxBool password = true.obs;
  RxBool passwordObsecure = true.obs;
  RxBool confirmPasswordObsecure = true.obs;

  cleaner() {
    mobilenumbercontroller.clear();
    passwordcontroller.clear();
  }

  var isLoading = false.obs; // For showing loading indicator

  Future<void> signUp() async {
    String url =
        " https://mobileappapi.onrender.com/api/auth/register"; // Replace with your API URL

    // if (mobilenumbercontroller.text.isEmpty ||
    //     passwordcontroller.text.isEmpty) {
    //   Get.snackbar("Error", "⚠ Please fill all fields!",
    //       backgroundColor: Colors.red, colorText: Colors.white);
    //   return ;
    // }

    final Map<String, dynamic> requestBody = {
      "mobileNumber": mobilenumbercontroller.text.trim(),
      "password": passwordcontroller.text.trim(),
    };

    try {
      isLoading.value = true; // Show loading
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      isLoading.value = false; // Hide loading

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Signup successful!",
            backgroundColor: Colors.green, colorText: Colors.white);
        // Get.offNamed('/login'); // Navigate to login screen after success
      } else {
        Get.snackbar("Error", "❌ Signup failed: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  String result = '';

  Future<void> signUpUser(String mobileNumber, String password) async {
    String url = "https://mobileappapi.onrender.com/api/auth/register"
        .trim(); // Ensure no spaces

    final Map<String, dynamic> requestBody = {
      "mobileNumber": mobileNumber,
      "password": password
    };

    print("📩 Sending Request to: $url");
    print("🔍 Request Body: ${jsonEncode(requestBody)}");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      print("🔍 Response Status: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ Signup successful!");
      } else {
        print("❌ Signup failed. Status: ${response.statusCode}");
        print("❌ Error Response: ${response.body}");
      }
    } catch (e) {
      print("⚠ Error: $e");
    }
  }

  void main() {
    signUpUser("3234567897", "1230448");
  }
}
