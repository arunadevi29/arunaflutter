import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Forgetpasswordcontroller extends GetxController {
  final GetStorage localStorage = GetStorage();
  bool passwordVisible = false;
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  RxString token = "".obs;

  RxBool password = true.obs;
  RxBool logInLoader = false.obs;

  // var loginApi = LoginData().obs;
  // var membersApiData = MembersData().obs;
  RxBool rememberMe = false.obs;

  late FocusNode mailFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();

  cleaner() {
    mobileController.text = "";
    passwordController.text = "";
  }

  bool isLoading = false;

  Future<void> resetPassword(context) async {
    if (passwordController.text != ConfirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    isLoading = true;

    final response = await http.post(
      Uri.parse("https://mobileappapi.onrender.com/api/auth/forgotpassword"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "new_password": passwordController.text,
        "confirm_password": ConfirmPasswordController.text
      }),
    );

    isLoading = false;

    if (response.statusCode == 200) {
      // Success: Show message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset successful!")),
      );
    } else {
      // Error: Show message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Error: ${jsonDecode(response.body)['message']}")),
      );
    }
  }

  Future<void> forgotPassword(
      String NewPassword, String ConfirmPassword) async {
    final url =
        Uri.parse("https://mobileappapi.onrender.com/api/auth/forgotpassword");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {"NewPassword": NewPassword, "ConfirmPassword": ConfirmPassword}),
      );

      if (response.statusCode == 200) {
        // Success response
        print("Password reset link sent to your email.");
      } else {
        // API returned an error
        print("Failed: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
