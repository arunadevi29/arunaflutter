import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/Screens/LoginScreen/view/LoginScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _signglobalkey = GlobalKey<FormState>();

  @override
  @override
  void initState() {
    bool password = false;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 60, backgroundColor: Colors.white,
                            child: Icon(
                              Icons.account_circle,
                              size: 120,
                              color: Colors.blue,
                            ),
                            // backgroundImage: AssetImage(
                            //   "assets/images/human.png",
                            // ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    child:
                        // Padding(
                        //   padding: EdgeInsets.all(30),
                        //   child: Form(
                        //     key: _signglobalkey,
                        //     child: Column(
                        //       children: <Widget>[
                        //         // SizedBox(
                        //         //   height: 10,
                        //         // ),
                        //         TextFormField(
                        //             // obscureText: true,
                        //
                        //             keyboardType: TextInputType.number,
                        //             maxLength: 10,
                        //             validator: (value) {
                        //               if (value!.isEmpty) {
                        //                 return "Mobile Number is required";
                        //               }
                        //               if (value.length != 10)
                        //                 return 'Mobile Number must be of 10 digit';
                        //               else
                        //                 return null;
                        //             },
                        //             controller:
                        //                 signUpController.mobilenumbercontroller,
                        //             decoration: InputDecoration(
                        //               enabledBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 2,
                        //                     color: Colors.white), //<-- SEE HERE
                        //               ),
                        //               border: OutlineInputBorder(
                        //                   // borderRadius: BorderRadius.circular(30),
                        //
                        //                   // borderSide: BorderSide.none,
                        //                   ),
                        //               label: RichText(
                        //                 text: new TextSpan(
                        //                   text: 'Mobile Number ',
                        //                   style: TextStyle(
                        //                       fontSize: 18,
                        //                       fontWeight: FontWeight.normal,
                        //                       color: Colors.white),
                        //                   children: <TextSpan>[
                        //                     new TextSpan(
                        //                         text: '*',
                        //                         style: new TextStyle(
                        //                             fontWeight: FontWeight.bold,
                        //                             color: Colors.red)),
                        //                   ],
                        //                 ),
                        //               ),
                        //             )),
                        //         SizedBox(
                        //           height: 10,
                        //         ),
                        //         TextFormField(
                        //             obscureText:
                        //                 signUpController.passwordObsecure.value,
                        //             // validator: (value) {
                        //             //   if (value!.isNotEmpty) {
                        //             //     return "Password is required";
                        //             //   }
                        //             //   return null;
                        //             // },
                        //             // controller: WorkTypeController,
                        //             decoration: InputDecoration(
                        //               suffixIcon: IconButton(
                        //                 //  color: Colors.white,
                        //                 icon: Icon(
                        //                     // Based on passwordVisible state choose the icon
                        //                     signUpController.passwordObsecure.value
                        //                         ? Icons.visibility_off
                        //                         : Icons.visibility,
                        //                     color: Colors.white
                        //                     //Theme.of(context).primaryColor,
                        //                     ),
                        //                 onPressed: () {
                        //                   // Update the state i.e. toogle the state of passwordVisible variable
                        //                   setState(() {
                        //                     signUpController
                        //                             .passwordObsecure.value =
                        //                         !signUpController
                        //                             .passwordObsecure.value;
                        //                   });
                        //                 },
                        //               ),
                        //               enabledBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 2,
                        //                     color: Colors.white), //<-- SEE HERE
                        //               ),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 // borderSide: BorderSide.none,
                        //               ),
                        //               label: RichText(
                        //                 text: new TextSpan(
                        //                   text: 'Password',
                        //                   style: TextStyle(
                        //                       fontSize: 18,
                        //                       fontWeight: FontWeight.normal,
                        //                       color: Colors.white),
                        //                   children: <TextSpan>[
                        //                     new TextSpan(
                        //                         text: ' *',
                        //                         style: new TextStyle(
                        //                             fontWeight: FontWeight.bold,
                        //                             color: Colors.red)),
                        //                   ],
                        //                 ),
                        //               ),
                        //             )),
                        //
                        //         SizedBox(
                        //           height: 50,
                        //         ),
                        //         SizedBox(height: 20),
                        //         TextButton(
                        //           onPressed: () {
                        //             String mobile = signUpController
                        //                 .mobilenumbercontroller.text
                        //                 .trim();
                        //             String password = signUpController
                        //                 .passwordcontroller.text
                        //                 .trim();
                        //
                        //             if (mobile.isNotEmpty && password.isNotEmpty) {
                        //               signUpController.signUpUser(mobile, password);
                        //             } else {
                        //               print("⚠ Please enter all fields!");
                        //             }
                        //           },
                        //           style: TextButton.styleFrom(
                        //             backgroundColor: Colors.blue,
                        //             foregroundColor: Colors.white,
                        //             padding: EdgeInsets.symmetric(
                        //                 vertical: 12, horizontal: 24),
                        //           ),
                        //           child: Text("Sign Up"),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.number,
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
                            controller: signUpController.mobilenumbercontroller,
                            decoration: InputDecoration(
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
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText:
                                signUpController.passwordObsecure.value,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                            controller: signUpController.passwordcontroller,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    signUpController.password.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      signUpController.password.value =
                                          !signUpController.password.value;
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
                          SizedBox(height: 40),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              onPressed: () {
                                String mobile = signUpController
                                    .mobilenumbercontroller.text
                                    .trim();
                                String password = signUpController
                                    .passwordcontroller.text
                                    .trim();

                                if (mobile.isNotEmpty && password.isNotEmpty) {
                                  signUpController.signUpUser(mobile, password);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Loginscreen()));
                                } else {
                                  print("⚠ Please enter all fields!");
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),

                          // TextButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => Loginscreen()));
                          //     },
                          //     child: Text("Already have an account?")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
