import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../CommenFiles/functions.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';

class LogInController extends GetxController {
  final GetStorage localStorage = GetStorage();

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString token = "".obs;

  RxBool password = true.obs;
  RxBool logInLoader = false.obs;
  RxBool passwordObsecure = true.obs;

  // var loginApi = LoginData().obs;
  // var membersApiData = MembersData().obs;
  RxBool rememberMe = false.obs;

  late FocusNode mailFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();
  bool lang = false;
  String phoneNumber = '';

  cleaner() {
    mobileController.text = "";
    passwordController.text = "";
  }

  bool isLoading = false;

  Future<void> loginUser(
    String mobileNumber,
    String password,
  ) async {
    isLoading = true; // Show loading indicator

    String url = "https://mobileappapi.onrender.com/api/auth/login".trim();

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

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        String token = responseData['token']; // Extract token
        print("✅ Login successful! Token: $token");
        Get.snackbar("Success", "✅ Login successful!",
            backgroundColor: Colors.green, colorText: Colors.white);

        // You can now store the token using SharedPreferences or another method
      } else {
        Get.snackbar("Error", "❌ Login failed: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
        print("❌ Login failed. Status: ${response.statusCode}");
        print("❌ Error Response: ${response.body}");
      }
    } catch (e) {
      print("⚠ Error: $e");
    }

    isLoading = false; // Hide loading indicator
  }
}
