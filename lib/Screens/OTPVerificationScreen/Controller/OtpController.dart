import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTime = resendTime - 1;
    });
    if (resendTime < 1) {
      countdownTimer.cancel();
    }
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
}
