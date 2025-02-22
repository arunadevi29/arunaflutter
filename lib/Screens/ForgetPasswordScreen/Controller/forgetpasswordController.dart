import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Forgetpasswordcontroller extends GetxController {
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
}
