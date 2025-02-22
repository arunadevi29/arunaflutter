import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddContractorController extends GetxController {
  bool passwordVisible = false;

  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  var dropname = "";

  var _currentSelectedItem;
  List _studentList = ["sdfsd", "sdfsdf"];

  var timepicker = "";
  String lat = "";
  String long = "";

  // Position? position;
  bool? isLoading;
}
