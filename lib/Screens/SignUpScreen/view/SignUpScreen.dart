import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/Screens/LoginScreen/view/LoginScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //     Container(
              //       width: double.infinity,
              //       // decoration: BoxDecoration(
              //       //     borderRadius: BorderRadius.only(
              //       //       bottomLeft: Radius.circular(10.0),
              //       //       bottomRight: Radius.circular(150.0),
              //       //     ),
              //           gradient:
              //               LinearGradient(begin: Alignment.topCenter, colors: [
              //             // Colors.blue.shade900,
              //             Colors.blue.shade500,
              //             Colors.blue.shade400,
              //           ])
              // ),
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
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
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
                    child: Container(
                      // decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(50),
                      //         topRight: Radius.circular(50))),
                      child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Form(
                            key: _signglobalkey,
                            child: Column(
                              children: <Widget>[
                                // SizedBox(
                                //   height: 10,
                                // ),
                                TextFormField(
                                    // obscureText: true,

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
                                    controller:
                                        signUpController.mobilenumbercontroller,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.white), //<-- SEE HERE
                                      ),
                                      border: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(30),

                                          // borderSide: BorderSide.none,
                                          ),
                                      label: RichText(
                                        text: new TextSpan(
                                          text: 'Mobile Number ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                          children: <TextSpan>[
                                            new TextSpan(
                                                text: '*',
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                    obscureText:
                                        signUpController.passwordObsecure.value,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password is required";
                                      }
                                    },
                                    // controller: WorkTypeController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        //  color: Colors.white,
                                        icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            signUpController
                                                    .passwordObsecure.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.white
                                            //Theme.of(context).primaryColor,
                                            ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            signUpController
                                                    .passwordObsecure.value =
                                                !signUpController
                                                    .passwordObsecure.value;
                                          });
                                        },
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.white), //<-- SEE HERE
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        // borderSide: BorderSide.none,
                                      ),
                                      label: RichText(
                                        text: new TextSpan(
                                          text: 'Password',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                          children: <TextSpan>[
                                            new TextSpan(
                                                text: ' *',
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    )),
                                // SizedBox(
                                //   height: 30,
                                // ),
                                // TextButton(
                                //   onPressed: () {
                                //     // Navigator.of(context).push(
                                //     //   MaterialPageRoute(
                                //     //       builder: (context) =>
                                //     //           Forgetpasswordscreen()),
                                //     // );
                                //   },
                                //   child: Text(
                                //     "Forgot Password?",
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.blue,
                                //       fontSize: 20,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 160,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    _signglobalkey.currentState?.validate();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => Loginscreen()),
                                    );
                                  },
                                  height: 50,
                                  // margin: EdgeInsets.symmetric(horizontal: 50),
                                  color: Color(0xff0000FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // decoration: BoxDecoration(
                                  // ),
                                  child: Center(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
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
