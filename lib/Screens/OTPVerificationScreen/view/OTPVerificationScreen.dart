import 'dart:async';

import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../UserScreen/view/UserScreen.dart';

class Otpverificationscreen extends StatefulWidget {
  const Otpverificationscreen({super.key});

  @override
  State<Otpverificationscreen> createState() => _OtpverificationscreenState();
}

class _OtpverificationscreenState extends State<Otpverificationscreen> {
  @override
  final otpglobalkey = GlobalKey<FormState>();

  @override
  void initState() {
    otpController.startTimer();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade500,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Verification",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Please enter the code to ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    "check authentication",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    height: 150,
                                    width: 200,
                                    "assets/images/otp.png",
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            myInputBox(context, otpController.txt1),
                            myInputBox(context, otpController.txt2),
                            myInputBox(context, otpController.txt3),
                            myInputBox(context, otpController.txt4),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Haven't received OTP yet?",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 10),
                          otpController.resendTime == 0
                              ? InkWell(
                                  onTap: () {
                                    // Resend OTP Code
                                    otpController.invalidOtp = false;
                                    otpController.resendTime = 60;
                                    otpController.startTimer();
                                    //
                                  },
                                  child: const Text(
                                    'Resend',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                      const SizedBox(height: 10),
                      otpController.resendTime != 0
                          ? Text(
                              'You can resend OTP after ${otpController.strFormatting(otpController.resendTime)} second(s)',
                              style: const TextStyle(fontSize: 18),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 5),
                      Text(
                        otpController.invalidOtp ? 'Invalid otp!' : '',
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 80),
                          child: MaterialButton(
                            onPressed: () {
                              // final otp =
                              //     txt1.text + txt2.text + txt3.text + txt4.text;
                              // if (otp == '1989') {
                              //   // Go to welcome
                              //   stopTimer();
                              //   Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //       builder: (context) => Userscreen(),
                              //     ),
                              //   );
                              // } else {
                              //   setState(() {
                              //     invalidOtp = true;
                              //   });
                              // }
                              // _globalkey.currentState?.validate();
                              Get.toNamed('/Userscreen');
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) => Userscreen()),
                              // );
                            },
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            // color: Color(0xff0056F1),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: Center(
                              child: Text(
                                "Verify",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff0056F1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ));
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 70,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 40),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3, color: Colors.blue), //<-- SEE HERE
            ),
            fillColor: Colors.blue,
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    ),
  );
}
