import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../SiteHeader/AddSiteWorker/view/SiteHeadAddSiteWorkerScreen.dart';

class ContractorAddWorkerController extends GetxController {
  bool passwordVisible = false;

  final contractglobalkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  String Assoicate = assoicatedrop.first;
  String Worktype = worktypedrop.first;
  var dropname = "";

  var timepicker = "";
  String lat = "";
  String long = "";

  // Position? position;
  bool? isLoading;

  void _submit() {
    final isValid = contractglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    contractglobalkey.currentState?.save();
  }
}
