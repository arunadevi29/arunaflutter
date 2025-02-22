import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../CommenFiles/functions.dart';

class LogInController extends GetxController {
  final GetStorage localStorage = GetStorage();

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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



  // signInApi() async {
  //   try {
  //     print("sin in wrk 1");
  //
  //     print(logInLoader.value);
  //     // final String? token = localStorage.read('api_token');
  //     dynamic res = await postMethod(
  //         success: (s) {},
  //         token: "",
  //         endPoint: 'login',
  //         body: {
  //           "email": mobileController.text,
  //           "password": passwordController.text,
  //         },
  //         route: "homeScreen",
  //         isGetOff: true,
  //         setLoader: (s) {
  //           logInLoader.value = s;
  //         });
  //     print("sin in wrk 2");
  //     if (res.toString().isNotEmpty) {
  //       // print("1");
  //       // loginApi.value = loginValueData(res);
  //       //
  //       // print("2");
  //       // localStorage.write('api_token', loginApi.value.data?.token);
  //       //
  //       // print("token res ${loginApi.value.data?.token}");
  //       // await membersApi();
  //     }
  //   } catch (e) {
  //     print("Error in signInApi: $e");
  //     // snackBar(isBadReqested: true, msg: "Something went wrong.");
  //   }
  //
  //   Future.delayed((const Duration(seconds: 2)), () {
  //     logInLoader.value = false;
  //   });
  // }
}
