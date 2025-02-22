import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../Controller/UserScreenController.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({super.key});

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  final formglobalkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    userScreenController.passwordVisible = false;
    super.initState();
  }

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
                              "Hi User",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Set your own password ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "for further process",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  height: 150,
                                  width: 200,
                                  "assets/images/userimg.png",
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
                              key: formglobalkey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                  ),
                                  TextFormField(
                                      obscureText:
                                          userScreenController.passwordVisible,
                                      keyboardType: TextInputType.number,
                                      // maxLength: 10,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password can't be empty";
                                        }
                                        // if (value.length != 10)
                                        //   return 'Mobile Number must be of 10 digit';
                                        else
                                          return null;
                                      },
                                      controller: userScreenController
                                          .EnterPasswordController,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            userScreenController.passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              userScreenController
                                                      .passwordVisible =
                                                  !userScreenController
                                                      .passwordVisible;
                                            });
                                          },
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color:
                                                  Colors.blue), //<-- SEE HERE
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              width: 4, color: Colors.blue),
                                          // borderSide: BorderSide.none,
                                        ),
                                        label: RichText(
                                          text: new TextSpan(
                                            text: 'Enter Password',
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
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      obscureText: true,
                                      keyboardType: TextInputType.number,
                                      // maxLength: 10,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Confirm Password can't be empty";
                                        }
                                        if (value !=
                                            userScreenController
                                                .EnterPasswordController.text)
                                          return 'Not Match';
                                        else
                                          return null;
                                      },
                                      controller: userScreenController
                                          .ConfirmPasswordController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color:
                                                  Colors.blue), //<-- SEE HERE
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              width: 4, color: Colors.blue),
                                          // borderSide: BorderSide.none,
                                        ),
                                        label: RichText(
                                          text: new TextSpan(
                                            text: 'Confirm Password',
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
                                      )),
                                  Spacer(),
                                  MaterialButton(
                                    onPressed: () {
                                      formglobalkey.currentState?.validate();
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           Loginscreen()),
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
                                        "Submit",
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
