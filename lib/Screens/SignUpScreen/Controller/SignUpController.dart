import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../CommenFiles/functions.dart';

class SignUpController extends GetxController {
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  RxBool isChecked = false.obs;
  RxBool sendOtp = false.obs;
  RxBool signUpLoader = false.obs;

  RxBool passwordObsecure = true.obs;
  RxBool confirmPasswordObsecure = true.obs;

  // var countryApiData = CountryApi().obs;
  final fullnameFocusNode = FocusNode();
  final surnameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final confirmEmailFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final enterOTPFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final countryFocusNode = FocusNode();

  cleaner() {
    mobilenumbercontroller.clear();
    passwordcontroller.clear();
  }

//   signUpApi() {
//     print("confirm password ${confirmPasswordController.text}");
//     postMethod(
//         statusCode: 201,
//         endPoint: 'register',
//         body: {
//           "first_name": fullNameController.text,
//           "surname": surNameController.text,
//           "email": emailController.text,
//           "confirm_email": confirmEmailController.text,
//           "mobile_number": phoneNumber.text,
//           "country": countryController.text,
//           "agreement": isChecked.value,
//           "password": yourPasswordController.text,
//           "confirmed_password": confirmPasswordController.text
//         },
//         token: '',
//         setLoader: (s) {
//           signUpLoader.value = s;
//         },
//         success: (bool) {
//           if (bool == true) {
//             cleaner();
//             Get.offNamed("/signIn");
//           }
//         });
//     // if (res.toString() != null) {
//     //   print(res);
//     // }
//   }
//
//   signUpApis() async {
//     signUpLoader.value = true;
//     print("running");
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('POST',
//         Uri.parse('https://winngoogala.winngooconsultancy.in/api/register'));
//     request.body = json.encode({
//       "first_name": fullNameController.text,
//       "surname": surNameController.text,
//       "email": emailController.text,
//       "confirm_email": confirmEmailController.text,
//       "mobile_number": phoneNumber.text,
//       "country": countryController.text,
//       "agreement": isChecked.value,
//       "password": yourPasswordController.text,
//       "password_confirmation": confirmPasswordController.text
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//     signUpLoader.value = false;
//     if (response.statusCode == 201) {
//       String responseBody = await response.stream.bytesToString();
//
//       var jsonResponse = jsonDecode(responseBody);
//       String successMessage = jsonResponse["message"];
//
//       // snackBar(isBadReqested: false, msg: successMessage);
//       cleaner();
//       Get.toNamed("/signIn");
//     } else {
//       String responseBody = await response.stream.bytesToString();
//       final responseJson = json.decode(responseBody);
//       if (responseJson.containsKey('errors')) {
//         final errors = responseJson['errors'];
//
//         // Access the specific errors and display them
//         if (errors.containsKey('email')) {
//           final emailError =
//               errors['email'][0]; // Access the first error message for email
//           // snackBar(isBadReqested: true, msg: emailError);
//         }
//
//         if (errors.containsKey('confirm_email')) {
//           final confirmEmailError = errors['confirm_email']
//               [0]; // Access the first error message for confirm email
//           // snackBar(isBadReqested: true, msg: confirmEmailError);
//         }
//       }
//     }
//   }
//
//   countryApi() async {
//     var res = await getMethod(
//         endPoint: "countries",
//         setLoader: (s) {
//           signUpLoader.value = s;
//         },
//         success: (s) {
//           if (s == true) {
//             Get.toNamed("/signUp");
//           }
//         });
//
//     if (res.toString().isNotEmpty) {
//       // countryApiData.value = countryModelData(res);
//       // print("sk done ${countryApiData.value.data![0].name}");
//     }
//   }
}
