import 'dart:async';

import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/SignUpScreen/view/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../demo.dart';
import '../../../sample.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';

import '../../ForgetPasswordScreen/view/ForgetPasswordScreen.dart';
import '../../SignUpScreen/Controller/SignUpController.dart';
import '../../SiteHeadDashboard/view/SiteheadDashboard.dart';
import '../../example.dart';
import '../../sample.dart';
import '../Controller/LoginScreenController.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_localization/flutter_localization.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({
    super.key,
  });

  // final LogInController counterController = Get.put(LogInController());

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  final _loginglobalkey = GlobalKey<FormState>();

  @override
  void initState() {
    bool password = false;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
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
                              TranslationService.translate("Welcome"),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage(
                                    "assets/images/girl.png",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child:
                        // Padding(
                        //     padding: EdgeInsets.all(30),
                        //     child: Form(
                        //       key: _loginglobalkey,
                        //       child: Column(
                        //         children: <Widget>[
                        //           SizedBox(
                        //             height: 50,
                        //           ),
                        //           TextFormField(
                        //               // obscureText: true,
                        //
                        //               keyboardType: TextInputType.number,
                        //               maxLength: 10,
                        //               validator: (value) {
                        //                 if (value!.isEmpty) {
                        //                   return TranslationService.translate(
                        //                       "Mobile Number is required");
                        //                 }
                        //                 if (value.length != 10)
                        //                   return TranslationService.translate(
                        //                       "Mobile Number must be of 10 digit");
                        //                 else
                        //                   return null;
                        //               },
                        //               controller:
                        //                   logInController.mobileController,
                        //               decoration: InputDecoration(
                        //                 enabledBorder: OutlineInputBorder(
                        //                   borderSide: BorderSide(
                        //                       width: 3,
                        //                       color:
                        //                           Colors.blue), //<-- SEE HERE
                        //                 ),
                        //                 border: OutlineInputBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10),
                        //
                        //                   // borderSide: BorderSide.none,
                        //                 ),
                        //                 label: RichText(
                        //                   text: new TextSpan(
                        //                     text: TranslationService.translate(
                        //                         "Mobile Number"),
                        //                     style: TextStyle(
                        //                         fontSize: 18,
                        //                         fontWeight: FontWeight.normal,
                        //                         color: Colors.black),
                        //                     children: <TextSpan>[
                        //                       new TextSpan(
                        //                           text: '*',
                        //                           style: new TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold,
                        //                               color: Colors.red)),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               )),
                        //           SizedBox(
                        //             height: 10,
                        //           ),
                        //           TextFormField(
                        //               obscureText:
                        //                   logInController.password.value,
                        //               validator: (value) {
                        //                 if (value!.isEmpty) {
                        //                   return TranslationService.translate(
                        //                       "Password is required");
                        //                 }
                        //               },
                        //               controller:
                        //                   logInController.passwordController,
                        //               decoration: InputDecoration(
                        //                 suffixIcon: IconButton(
                        //                   icon: Icon(
                        //                     // Based on passwordVisible state choose the icon
                        //                     logInController.password.value
                        //                         ? Icons.visibility_off
                        //                         : Icons.visibility,
                        //                     color: Theme.of(context)
                        //                         .primaryColorDark,
                        //                   ),
                        //                   onPressed: () {
                        //                     // Update the state i.e. toogle the state of passwordVisible variable
                        //                     setState(() {
                        //                       logInController.password.value =
                        //                           !logInController
                        //                               .password.value;
                        //                     });
                        //                   },
                        //                 ),
                        //                 enabledBorder: OutlineInputBorder(
                        //                   borderSide: BorderSide(
                        //                       width: 3,
                        //                       color:
                        //                           Colors.blue), //<-- SEE HERE
                        //                 ),
                        //                 border: OutlineInputBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10),
                        //                   // borderSide: BorderSide.none,
                        //                 ),
                        //                 label: RichText(
                        //                   text: new TextSpan(
                        //                     text: TranslationService.translate(
                        //                         "Password"),
                        //                     style: TextStyle(
                        //                         fontSize: 18,
                        //                         fontWeight: FontWeight.normal,
                        //                         color: Colors.black),
                        //                     children: <TextSpan>[
                        //                       new TextSpan(
                        //                           text: ' *',
                        //                           style: new TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold,
                        //                               color: Colors.red)),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               )),
                        //           SizedBox(
                        //             height: 30,
                        //           ),
                        //           Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               TextButton(
                        //                 onPressed: () {
                        //                   Get.toNamed("/Forgetpasswordscreen");
                        //                   // Navigator.of(context).push(
                        //                   //   MaterialPageRoute(
                        //                   //       builder: (context) =>
                        //                   //           MyAppsign()),
                        //                   // );
                        //                 },
                        //                 child: Text(
                        //                   TranslationService.translate(
                        //                       "Forgot Password?"),
                        //                   style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.blue,
                        //                     fontSize: 20,
                        //                   ),
                        //                 ),
                        //               ),
                        //               DropdownButton(
                        //                   underline: SizedBox(),
                        //                   icon: Icon(
                        //                     Icons.language,
                        //                     color: Colors.blue,
                        //                     size: 35,
                        //                   ),
                        //                   items: const [
                        //                     DropdownMenuItem(
                        //                         value: "en",
                        //                         child: Text(
                        //                           'English',
                        //                           style: TextStyle(
                        //                               color: Colors.black,
                        //                               fontSize: 18),
                        //                         )),
                        //                     DropdownMenuItem(
                        //                         value: "ka",
                        //                         child: Text(
                        //                           'Kannada',
                        //                           style: TextStyle(
                        //                               color: Colors.black,
                        //                               fontSize: 18),
                        //                         )),
                        //                   ],
                        //                   onChanged: (value) {
                        //                     controller.setLocale(value);
                        //                   }),
                        //             ],
                        //           ),
                        //           SizedBox(
                        //             height: 20,
                        //           ),
                        //           MaterialButton(
                        //             onPressed: () {
                        //               _loginglobalkey.currentState?.validate();
                        //               logInController.isLoading
                        //                   ? CircularProgressIndicator()
                        //                   : ElevatedButton(
                        //                       onPressed: () {
                        //                         String mobile = logInController
                        //                             .mobileController.text
                        //                             .trim();
                        //                         String password =
                        //                             logInController
                        //                                 .passwordController.text
                        //                                 .trim();
                        //
                        //                         if (mobile.isNotEmpty &&
                        //                             password.isNotEmpty) {
                        //                           logInController.loginUser(
                        //                               mobile, password);
                        //                           Get.toNamed(
                        //                               "/Admindashboard");
                        //                         } else {
                        //                           print(
                        //                               "⚠ Please enter all fields!");
                        //                         }
                        //                       },
                        //                       child: Text("Login"),
                        //                     );
                        //
                        //               //Get.toNamed('/Siteheaddashboard');
                        //             },
                        //             height: 50,
                        //             // margin: EdgeInsets.symmetric(horizontal: 50),
                        //             color: Color(0xff0056F1),
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10),
                        //             ),
                        //             // decoration: BoxDecoration(
                        //             // ),
                        //             child: Center(
                        //               child: Text(
                        //                 TranslationService.translate("Login"),
                        //                 style: TextStyle(
                        //                     fontSize: 20,
                        //                     color: Colors.white,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     )),

                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              //
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Mobile Number is required";
                                  }
                                  if (value.length != 10)
                                    return 'Mobile Number must be of 10 digit';
                                  else
                                    return null;
                                },
                                controller: logInController.mobileController,
                                decoration: InputDecoration(
                                  prefixText: "+91",
                                  prefixIcon: Icon(
                                    Icons.add_ic_call_outlined,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(),
                                  label: RichText(
                                    text: new TextSpan(
                                      text: 'Mobile Number',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                      children: <TextSpan>[
                                        new TextSpan(
                                            text: ' *',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // IntlPhoneField(
                              //   initialCountryCode: 'IN',
                              //   disableLengthCheck: false,
                              //   // Allows incomplete numbers
                              //   showDropdownIcon: false,
                              //   // Set the default country (India)
                              //   decoration: InputDecoration(
                              //     label: RichText(
                              //       text: new TextSpan(
                              //         text: 'Mobile Number',
                              //         style: TextStyle(
                              //             fontSize: 18,
                              //             fontWeight: FontWeight.normal,
                              //             color: Colors.black),
                              //         children: <TextSpan>[
                              //           new TextSpan(
                              //               text: ' *',
                              //               style: new TextStyle(
                              //                   fontWeight: FontWeight.bold,
                              //                   color: Colors.red)),
                              //         ],
                              //       ),
                              //     ),
                              //     border: OutlineInputBorder(),
                              //   ),
                              //   onChanged: (phone) {
                              //     setState(() {
                              //       logInController.mobileController.text = phone
                              //           .completeNumber; // Includes country code
                              //     });
                              //     print(phone
                              //         .completeNumber); // Example: +918888888888
                              //   },
                              // ),
                              SizedBox(height: 10),
                              TextFormField(
                                obscureText:
                                logInController.passwordObsecure.value,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Password is required";
                                  }
                                  return null;
                                },
                                controller: logInController.passwordController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.blue,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        logInController.password.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color:
                                        Theme
                                            .of(context)
                                            .primaryColorDark,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          logInController.password.value =
                                          !logInController.password.value;
                                        });
                                      },
                                    ),
                                    label: RichText(
                                      text: new TextSpan(
                                        text: 'Password',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text: ' *',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed("/Forgetpasswordscreen");
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddFieldPage()),
                                      );
                                    },
                                    child: Text(
                                      TranslationService.translate(
                                          "Forgot Password?"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  DropdownButton(
                                      underline: SizedBox(),
                                      icon: Icon(
                                        Icons.language,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                            value: "en",
                                            child: Text(
                                              'English',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            )),
                                        DropdownMenuItem(
                                            value: "ka",
                                            child: Text(
                                              'Kannada',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            )),
                                      ],
                                      onChanged: (value) {
                                        controller.setLocale(value);
                                      }),
                                ],
                              ),
                              SizedBox(height: 10),
                              logInController.isLoading
                                  ? CircularProgressIndicator()
                                  : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 170, vertical: 15),
                                  backgroundColor: Color(0xff0056f1),
                                  // side: BorderSide(color: Colors.yellow, width: 5),

                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {
                                  String mobile = logInController
                                      .mobileController.text
                                      .trim();
                                  String password = logInController
                                      .passwordController.text
                                      .trim();

                                  if (mobile.isNotEmpty &&
                                      password.isNotEmpty) {
                                    logInController.loginUser(
                                      mobile,
                                      password,
                                    );
                                    Timer(
                                        Duration(seconds: 3),
                                            () =>
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Admin_Dashboard())));
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Don't have an account?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signupscreen()));
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(color: Colors.purple),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
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
