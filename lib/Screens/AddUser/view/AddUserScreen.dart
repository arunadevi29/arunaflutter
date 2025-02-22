import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../../widgets/AppBarSample.dart';

import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../SiteHeadDashboard/view/SiteheadDashboard.dart';
import '../../SiteHeader/AddReportManager/view/AdminAddReportManagerScreen.dart';

class Adduserscreen extends StatefulWidget {
  const Adduserscreen({super.key});

  @override
  State<Adduserscreen> createState() => _AdduserscreenState();
}

class _AdduserscreenState extends State<Adduserscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppbarName(
            title: "Add User",
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
              //tooltip: 'Setting Icon',
              onPressed: () {
                Get.toNamed("/Forgetpasswordscreen");
              },
            ), //IconButton,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                      // decoration: ShapeDecoration(
                      //   shape: RoundedRectangleBorder(
                      //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: "Select Site Head",
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        // prefixIcon: Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Image.asset(
                        //     'assets/images/mech.png',
                        //     color: Colors.black,
                        //     height: 2,
                        //     width: 2,
                        //   ),
                        // ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: addUserScreenController.selectedOption,

                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Select Work Type can't be empty";
                    //   } else {
                    //     return null;
                    //   }
                    // },

                    items: addUserScreenController.options.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        addUserScreenController.selectedOption = newValue!;
                      });
                    },
                  ))),
              SizedBox(height: 10),
              // Conditionally rendering forms based on dropdown selection
              if (addUserScreenController.selectedOption == 'Site Head') ...[
                SiteHead(),
              ] else if (addUserScreenController.selectedOption ==
                  'Report Manager') ...[
                ReportManager(),
              ] else if (addUserScreenController.selectedOption ==
                  'Add Contractor') ...[
                AddContractor(),
              ] else if (addUserScreenController.selectedOption ==
                  'Site Worker') ...[
                SiteWorker(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class SiteHead extends StatelessWidget {
  @override
  final _adduserglobalkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  var dropname = "";

  void _submitForm() {
    // Safely check if the form state is available
    if (_adduserglobalkey.currentState != null &&
        _adduserglobalkey.currentState!.validate()) {
      // If the form is valid, print the value
      //print("Form Submitted! Text: ${FirstNameController.text}");
    } else {
      print("Form is not valid");
    }
  }

  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Adding Site Head",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Form(
              key: _adduserglobalkey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: FirstNameController,
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
                              text: 'First Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Last Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: LastNameController,
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
                              text: 'Last Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number can't be empty";
                          }
                          if (value.length != 10)
                            return 'Mobile Number must be of 10 digit';
                          else
                            return null;

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.number,
                        controller: MobileNumberController,
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          }
                        },
                        keyboardType: TextInputType.name,
                        controller: FieldController,
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
                          label: const Text(
                            "Facility",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field Site Name can't be empty";
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: FieldSiteNamerController,
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
                          label: const Text(
                            "Field Site Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Set Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff0056F1),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password can't be empty";
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: EnterPasswordController,
                        obscureText: !_passwordVisible,
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
                              text: 'Enter Password',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable

                              _passwordVisible = !_passwordVisible;
                            },
                          ),
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Password can't be empty";
                          }
                          if (value != EnterPasswordController.text)
                            return 'Not Match';
                        },
                        keyboardType: TextInputType.number,
                        controller: ConfirmPasswordController,
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
                              text: 'Confirm Password',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 165),
                            backgroundColor: Color(0xff0056f1),
                            // side: BorderSide(color: Colors.yellow, width: 5),

                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            if (_adduserglobalkey.currentState!.validate()) {
                              Get.toNamed('/Adminaddreportmanagerscreen');
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         Adminaddreportmanagerscreen()));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ))
    ]);
  }
}

// Form 2 Widget
class ReportManager extends StatelessWidget {
  final _userglobalkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  var dropname = "";

  void _submitForm() {
    // Safely check if the form state is available
    if (_userglobalkey.currentState != null &&
        _userglobalkey.currentState!.validate()) {
      // If the form is valid, print the value
      //print("Form Submitted! Text: ${FirstNameController.text}");
    } else {
      print("Form is not valid");
    }
  }

  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Adding Report Manager",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Form(
              key: _userglobalkey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: FirstNameController,
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
                              text: 'First Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Last Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: LastNameController,
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
                              text: 'Last Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number can't be empty";
                          }
                          if (value.length != 10)
                            return 'Mobile Number must be of 10 digit';
                          else
                            return null;

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.number,
                        controller: MobileNumberController,
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Set Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff0056F1),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password can't be empty";
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: EnterPasswordController,
                        obscureText: !_passwordVisible,
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
                              text: 'Enter Password',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable

                              _passwordVisible = !_passwordVisible;
                            },
                          ),
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Password can't be empty";
                          }
                          if (value != EnterPasswordController.text)
                            return 'Not Match';
                        },
                        keyboardType: TextInputType.number,
                        controller: ConfirmPasswordController,
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
                              text: 'Confirm Password',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 165),
                            backgroundColor: Color(0xff0056f1),
                            // side: BorderSide(color: Colors.yellow, width: 5),

                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            _submitForm();
                            // if (_globalkey.currentState!.validate()) {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => Adminaddreportmanagerscreen()));
                            // }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ))
    ]);
  }
}

// Form 3 Widget
class AddContractor extends StatelessWidget {
  final _addglobalkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  var dropname = "";

  void _submitForm() {
    // Safely check if the form state is available
    if (_addglobalkey.currentState != null &&
        _addglobalkey.currentState!.validate()) {
      // If the form is valid, print the value
      //print("Form Submitted! Text: ${FirstNameController.text}");
    } else {
      print("Form is not valid");
    }
  }

  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Adding Contractor",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Form(
              key: _addglobalkey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: FirstNameController,
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
                              text: 'First Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Last Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: LastNameController,
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
                              text: 'Last Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number can't be empty";
                          }
                          if (value.length != 10)
                            return 'Mobile Number must be of 10 digit';
                          else
                            return null;

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.number,
                        controller: MobileNumberController,
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Set Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff0056F1),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password can't be empty";
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: EnterPasswordController,
                        obscureText: !_passwordVisible,
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
                              text: 'Enter Password',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable

                              _passwordVisible = !_passwordVisible;
                            },
                          ),
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Password can't be empty";
                          }
                          if (value != EnterPasswordController.text)
                            return 'Not Match';
                        },
                        keyboardType: TextInputType.number,
                        controller: ConfirmPasswordController,
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
                              text: 'Confirm Password',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(5),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 165),
                            backgroundColor: Color(0xff0056f1),
                            // side: BorderSide(color: Colors.yellow, width: 5),

                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            if (_addglobalkey.currentState!.validate()) {
                              Get.toNamed('/Adminaddreportmanagerscreen');
                            }
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) =>
                            //           Adminaddreportmanagerscreen()));
                            // }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ))
    ]);
  }
}

class SiteWorker extends StatelessWidget {
  SiteWorker({super.key});

  final _SiteWorkerglobalkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController LongitudeController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  var dropname = "";

  void _submitForm() {
    // Safely check if the form state is available
    if (_SiteWorkerglobalkey.currentState != null &&
        _SiteWorkerglobalkey.currentState!.validate()) {
      // If the form is valid, print the value
      //print("Form Submitted! Text: ${FirstNameController.text}");
    } else {
      print("Form is not valid");
    }
  }

  String Assoicate = 'Raja';
  String First = 'Mani';
  String Last = 'vel';
  String SelectWork = 'Security';
  String SelectShiftTime = 'First Shift';
  String WorkerName = 'Ravi kumar';

  // List of items in our dropdown menu
  var AssociateContractor = ['Raja', 'Rani'];
  var FirstName = ['Mani', 'Kavi'];
  var LastName = ['vel', 'Ravi'];
  var SelectWorkType = ['House Keeping', 'Security', 'watchman'];
  var SelectShift = ['First Shift', 'Second Shift', 'Night Shift'];
  var WorkernameList = ['Ravi kumar', 'Kumar', 'vani'];

  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Adding Worker",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Form(
              key: _SiteWorkerglobalkey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: FirstNameController,
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
                              text: 'First Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Last Name can't be empty";
                          }

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.name,
                        controller: LastNameController,
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
                              text: 'Last Name',
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number can't be empty";
                          }
                          if (value.length != 10)
                            return 'Mobile Number must be of 10 digit';
                          else
                            return null;

                          //else if (value.length < 10) {}
                        },
                        keyboardType: TextInputType.number,
                        controller: MobileNumberController,
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
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide.none,
                              ),
                          fillColor: Color(0xfff5f7fa).withOpacity(0.1),
                          // fillColor: Colors.white54,
                          filled: true,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      // decoration: ShapeDecoration(
                      //   shape: RoundedRectangleBorder(
                      //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: "Associate Contractor",
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        // prefixIcon: Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Image.asset(
                        //     'assets/images/mech.png',
                        //     color: Colors.black,
                        //     height: 2,
                        //     width: 2,
                        //   ),
                        // ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: Assoicate,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Associate Contractor can't be empty";
                      } else {
                        return null;
                      }
                    },

                    items: AssociateContractor.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      Assoicate = newValue!;
                    },
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      // decoration: ShapeDecoration(
                      //   shape: RoundedRectangleBorder(
                      //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: "Select Work Type",
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        // prefixIcon: Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Image.asset(
                        //     'assets/images/mech.png',
                        //     color: Colors.black,
                        //     height: 2,
                        //     width: 2,
                        //   ),
                        // ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: SelectWork,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Select Work Type can't be empty";
                      } else {
                        return null;
                      }
                    },

                    items: SelectWorkType.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      SelectWork = newValue!;
                    },
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 165),
                            backgroundColor: Color(0xff0056f1),
                            // side: BorderSide(color: Colors.yellow, width: 5),

                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            if (_SiteWorkerglobalkey.currentState!.validate()) {
                              Get.toNamed('/Adminaddreportmanagerscreen');
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         Adminaddreportmanagerscreen()));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ))
    ]);
  }
}
