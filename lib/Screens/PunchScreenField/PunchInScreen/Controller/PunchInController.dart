import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PunchinController extends GetxController {
  final _punchinglobalkey = GlobalKey<FormState>();
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

  void _submit() {
    final isValid = _punchinglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _punchinglobalkey.currentState?.save();
  }

  final _picker = ImagePicker();
  bool circular = false;
  File? galleryFile;
  final picker = ImagePicker();
  String? _dateTime;

  late PickedFile _imageFile;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
}
