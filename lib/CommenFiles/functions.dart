import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'Widget.dart';

///Get storage
GetStorage localStorage = GetStorage();

///Global Colors
Color? primaryColor = const Color(0xff5669FF);
Color? primaryColor2 = const Color(0xff3D50DF);
Color? secondarycolor = const Color(0xff4a5fed);
Color? buttonColor = const Color(0xff5669FF);
Color? sheduleButtonColor = const Color(0xff182490);
Color headingTextColor = Colors.white;
Color circleColor = Colors.indigoAccent;

///Font size
double contentSize = 16;
double headingSize = 20;

///images
var psycoPng = "assets/psyco.png";

Future<void> futureDelay(Duration delay) async {
  await Future.delayed(delay);
}

Future<String?> postMethod({
  required String endPoint,
  required Map<String, dynamic> body,
  String? route,
  int? statusCode,
  bool? isGetOff,
  required String? token,
  required Function(bool) setLoader,
  required Function(bool) success,
}) async {
  try {
    setLoader(true);

    var headers = {
      'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    // print("Headers: $headers");

    var request = http.Request(
      'POST',
      Uri.parse('https://mobileappapi.onrender.com/api/$endPoint'),
    );

    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseBody);

    if (response.statusCode == (statusCode ?? 200)) {
      success(true);
      print("POST call response: ${jsonResponse.toString()}");

      // Handle specific endpoint responses
      if (endPoint == "make-payment" && jsonResponse.containsKey("success")) {
        snackBar(isBadReqested: false, msg: jsonResponse["success"]);
      }

      // General success messages
      if (jsonResponse.containsKey("message")) {
        snackBar(isBadReqested: false, msg: jsonResponse["message"]);
      } else if (jsonResponse.containsKey("error")) {
        snackBar(isBadReqested: false, msg: jsonResponse["error"]);
      }

      // Navigation
      if (route != null && route.isNotEmpty) {
        isGetOff == true ? Get.offNamed("/$route") : Get.toNamed("/$route");
      }

      setLoader(false);
      return responseBody;
    } else {
      success(false);
      setLoader(false);
      print("logout res ${response.reasonPhrase}");
      // Handle error responses
      if (jsonResponse.containsKey("message") && endPoint != 'register') {
        snackBar(isBadReqested: true, msg: jsonResponse["message"]);
      } else if (jsonResponse.containsKey("error")) {
        snackBar(isBadReqested: true, msg: jsonResponse["error"]);
      } else if (jsonResponse.containsKey("errors")) {
        final errors = jsonResponse['errors'];
        errors.forEach((key, value) {
          snackBar(isBadReqested: true, msg: value[0]);
        });
      }

      return responseBody;
    }
  } catch (e) {
    // Handle exceptions
    String errorMessage = "Unexpected error: $e";
    if (e is FormatException) {
      errorMessage = "Invalid response format.";
    } else if (e.toString().contains('SocketException')) {
      errorMessage = "Network error. Please try again.";
    } else if (e.toString().contains('TimeoutException')) {
      errorMessage = "Request timed out. Please try again.";
    }

    snackBar(isBadReqested: true, msg: errorMessage);
    print("Error in POST request: $e");

    return null;
  }
}

Future<dynamic> getMethod({
  required String endPoint,
  required Function(bool) setLoader,
  required Function(bool) success,
}) async {
  // print('get 1');
  setLoader(true);

  final String? token = localStorage.read('api_token');
  // print('get 2');
  // print('get 3');
  // var headers = {'Authorization': 'Bearer $token'};
  // print('get 4');
  var request = http.Request(
      'GET', Uri.parse('https://mobileappapi.onrender.com/api/$endPoint'));

  // print('get 4');
  request.body = '''''';
  // request.headers.addAll(headers);
  // print('get 5');
  http.StreamedResponse response = await request.send();
  // print('get 6');

  setLoader(false);
  if (response.statusCode == 200) {
    // print('get 7');
    var responseBody = await response.stream.bytesToString();

    // print('get 8');
    // print("${responseBody}");
    success(true);
    return responseBody;
  } else {
    success(false);

    print("BAD STATEMENT ERROR ${response.reasonPhrase}");
    snackBar(isBadReqested: true, msg: "Please Contact Admin");
    var responseBody = await response.stream.bytesToString();
    return responseBody;
  }
}

Object? initialRoute() {
  final token = localStorage.read('api_token'); // Read token from storage
  print('initial rout');
  if (token != null) {
    return Get.offNamed('/homeScreen'); // Navigate to Home if token exists
  } else {
    return Get.offNamed('/signIn'); // Navigate to Login if no token
  }
}
