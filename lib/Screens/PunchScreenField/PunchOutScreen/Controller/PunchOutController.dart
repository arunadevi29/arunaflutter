import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PunchOutController extends GetxController {
  TextEditingController SelectWorkTypeController = TextEditingController();
  TextEditingController SelectShiftController = TextEditingController();
  TextEditingController FromshiftController = TextEditingController();
  TextEditingController ToshiftController = TextEditingController();

  // String AssociateContractor = 'Mohan Kumar R';
  // String SelectWorkType = 'Security';
  // String MorningShift = "Morning Shift";
  // String Workerdetail = 'Mani';
  String Assoicate = 'Raja';
  String First = 'Mani';
  String Last = 'vel';
  String SelectWork = 'Security';
  String SelectShiftTime = 'First Shift';

  // List of items in our dropdown menu
  var AssociateContractor = ['Raja', 'Rani'];
  var FirstName = ['Mani', 'Kavi'];
  var LastName = ['vel', 'Ravi'];
  var SelectWorkType = ['House Keeping', 'Security', 'watchman'];
  var SelectShift = ['First Shift', 'Second Shift', 'Night Shift'];

  String? dateTime;
  final picker = ImagePicker();
  bool circular = false;

  late PickedFile imageFile;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  File? galleryFile;
}
