import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/Screens/ForgetPasswordScreen/Controller/forgetpasswordController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/translateService.dart';
import '../../OTPVerificationScreen/view/OTPVerificationScreen.dart';
import '../../sample.dart';

class Forgetpasswordscreen extends StatefulWidget {
  const Forgetpasswordscreen({super.key});

  @override
  State<Forgetpasswordscreen> createState() => _ForgetpasswordscreenState();
}

class _ForgetpasswordscreenState extends State<Forgetpasswordscreen> {
  @override
  final _forgetglobalkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(150.0),
                    ),
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
                      // Colors.blue.shade900,
                      Colors.blue.shade500,
                      Colors.blue.shade400,
                    ])),
                child: Column(
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
                              "Forgot Password",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Please provide your",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "mobile number",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  height: 150,
                                  width: 200,
                                  "assets/images/forget.png",
                                  color: Colors.white,
                                ),
                                // CircleAvatar(
                                //   radius: 75,
                                //   backgroundColor: Colors.white,
                                //   backgroundImage: AssetImage(
                                //     "assets/images/forget.png",
                                //   ),
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: Container(
                        height: 420,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Form(
                              key: _forgetglobalkey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return TranslationService.translate(
                                              "Enter Password can't be empty");
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      controller: forgetpasswordcontroller
                                          .passwordController,
                                      obscureText: !addContractorController
                                          .passwordVisible,
                                      //This will obscure text dynamically
                                      onChanged: (value) {
                                        // setState(() {
                                        //   // Convert the entered value to uppercase and update the controller
                                        // /  usernameController.value = TextEditingValue(
                                        //     text: value.toUpperCase(),
                                        //     selection: usernameController
                                        //         .selection, // Maintain the cursor position
                                        //   );
                                        // });
                                      },
                                      decoration: InputDecoration(
                                        label: RichText(
                                          text: new TextSpan(
                                            text: TranslationService.translate(
                                                "Enter Password"),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                  text: ' *',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide.none,
                                        ),
                                        fillColor:
                                            Color(0xfff5f7fa).withOpacity(0.1),
                                        // fillColor: Colors.white54,
                                        filled: true,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            forgetpasswordcontroller
                                                    .passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              addContractorController
                                                      .passwordVisible =
                                                  !addContractorController
                                                      .passwordVisible;
                                            });
                                          },
                                        ),
                                        // prefixIcon: const Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return TranslationService.translate(
                                              "Confirm Password can't be empty");
                                        }
                                        if (value !=
                                            forgetpasswordcontroller
                                                .passwordController.text)
                                          return TranslationService.translate(
                                              "Not Match");
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      controller: addContractorController
                                          .ConfirmPasswordController,
                                      onChanged: (value) {
                                        // setState(() {
                                        //   // Convert the entered value to uppercase and update the controller
                                        // /  usernameController.value = TextEditingValue(
                                        //     text: value.toUpperCase(),
                                        //     selection: usernameController
                                        //         .selection, // Maintain the cursor position
                                        //   );
                                        // });
                                      },
                                      decoration: InputDecoration(
                                        label: RichText(
                                          text: new TextSpan(
                                            text: TranslationService.translate(
                                                "Confirm Password"),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                  text: ' *',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide.none,
                                        ),
                                        fillColor:
                                            Color(0xfff5f7fa).withOpacity(0.1),
                                        // fillColor: Colors.white54,
                                        filled: true,
                                        // prefixIcon: const Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  // TextFormField(
                                  //     obscureText: true,
                                  //     keyboardType: TextInputType.number,
                                  //     maxLength: 10,
                                  //     validator: (value) {
                                  //       if (value!.isEmpty) {
                                  //         return "Mobile Number can't be empty";
                                  //       }
                                  //       if (value.length != 10)
                                  //         return 'Mobile Number must be of 10 digit';
                                  //       else
                                  //         return null;
                                  //     },
                                  //     controller: forgetpasswordcontroller
                                  //         .mobileController,
                                  //     decoration: InputDecoration(
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             width: 3,
                                  //             color:
                                  //                 Colors.blue), //<-- SEE HERE
                                  //       ),
                                  //       border: OutlineInputBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(10),
                                  //
                                  //         // borderSide: BorderSide.none,
                                  //       ),
                                  //       label: RichText(
                                  //         text: new TextSpan(
                                  //           text: 'Mobile Number',
                                  //           style: TextStyle(
                                  //               fontSize: 18,
                                  //               fontWeight: FontWeight.normal,
                                  //               color: Colors.black),
                                  //           children: <TextSpan>[
                                  //             new TextSpan(
                                  //                 text: ' *',
                                  //                 style: new TextStyle(
                                  //                     fontWeight:
                                  //                         FontWeight.bold,
                                  //                     color: Colors.red)),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      _forgetglobalkey.currentState?.validate();
                                      String NewPassword =
                                          forgetpasswordcontroller
                                              .passwordController.text
                                              .trim();
                                      String ConfirmPassword =
                                          forgetpasswordcontroller
                                              .ConfirmPasswordController.text
                                              .trim();
                                      if (NewPassword.isNotEmpty &&
                                          ConfirmPassword.isNotEmpty) {
                                        forgetpasswordcontroller.forgotPassword(
                                            NewPassword, ConfirmPassword);
                                      } else {
                                        print("Enter a valid email");
                                      }

                                      // Get.toNamed('/Otpverificationscreen');
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           UploadScreen()),
                                      // );
                                    },
                                    height: 50,
                                    // margin: EdgeInsets.symmetric(horizontal: 50),
                                    color: Color(0xff0056F1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // decoration: BoxDecoration(
                                    // ),
                                    child: Center(
                                      child: Text(
                                        "GET OTP",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
