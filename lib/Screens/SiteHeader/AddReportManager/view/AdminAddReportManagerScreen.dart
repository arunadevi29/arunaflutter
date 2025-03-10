import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/AppBarSample.dart';
import '../../../UserListAddReport/view/AddReportUserList.dart';

class Adminaddreportmanagerscreen extends StatefulWidget {
  const Adminaddreportmanagerscreen({super.key});

  @override
  State<Adminaddreportmanagerscreen> createState() =>
      _AdminaddreportmanagerscreenState();
}

class _AdminaddreportmanagerscreenState
    extends State<Adminaddreportmanagerscreen> {
  final Reportglobalkey = GlobalKey<FormState>();

  void _submit() {
    final isValid = Reportglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    Reportglobalkey.currentState?.save();
  }

  @override
  void initState() {
    addReportController.passwordVisible = false;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            TranslationService.translate("Add Report Manager"),
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
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
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                    DropdownMenuItem(
                        value: "ka",
                        child: Text(
                          'Kannada',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                  ],
                  onChanged: (value) {
                    controller.setLocale(value);
                  }),
            )
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
            //tooltip: 'Setting Icon',
            onPressed: () {
              Get.toNamed('/Addreportuserlist');
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //       builder: (context) => Addreportuserlist()),
              // );
            },
          ), //IconButton
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Form(
              key: Reportglobalkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FirstNameField(),
                  const SizedBox(
                    height: 15,
                  ),
                  LastNameField(),
                  const SizedBox(
                    height: 15,
                  ),
                  MobileNumberField(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          TranslationService.translate("Set Password"),
                          style: TextStyle(
                              color: Color(0xff0056F1),
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  EnterPasswordField(),
                  const SizedBox(
                    height: 15,
                  ),
                  ConfirmPasswordField(),
                  const SizedBox(
                    height: 15,
                  ),
                  submit_button(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget FirstNameField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return TranslationService.translate("First Name is required");
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: addReportController.FirstNameController,
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
                  text: TranslationService.translate("First Name"),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: ' *',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
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
    ]);
  }

  Widget LastNameField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return TranslationService.translate("Last Name is required");
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: addReportController.LastNameController,
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
                  text: TranslationService.translate("Last Name"),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: ' *',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
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
    ]);
  }

  Widget MobileNumberField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            maxLength: 10,
            validator: (value) {
              if (value!.isEmpty) {
                return TranslationService.translate(
                    "Mobile Number is required");
              }
              if (value.length != 10)
                return TranslationService.translate(
                    "Mobile Number must be of 10 digit");
              else
                return null;

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.number,
            controller: addReportController.MobileNumberController,
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
                  text: TranslationService.translate("Mobile Number"),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: ' *',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
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
    ]);
  }

  Widget EnterPasswordField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return TranslationService.translate("Password is required");
              }
            },
            keyboardType: TextInputType.number,
            controller: addReportController.EnterPasswordController,
            obscureText: !addReportController.passwordVisible,
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
                  text: TranslationService.translate("Enter Password"),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: ' *',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              // label: const Text(
              //   "Enter Password",
              //   style:
              //       TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                // borderSide: BorderSide.none,
              ),
              fillColor: Color(0xfff5f7fa).withOpacity(0.1),
              // fillColor: Colors.white54,
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  addReportController.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    addReportController.passwordVisible =
                        !addReportController.passwordVisible;
                  });
                },
              ),
              // prefixIcon: const Icon(Icons.person),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget ConfirmPasswordField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return TranslationService.translate(
                    "Confirm Password is required");
              }
              if (value != addReportController.EnterPasswordController.text)
                return TranslationService.translate("Not Match");
            },
            keyboardType: TextInputType.number,
            controller: addReportController.ConfirmPasswordController,
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
                  text: TranslationService.translate("Confirm Number"),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: ' *',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
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
    ]);
  }

  Widget submit_button() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            child: Text(
              TranslationService.translate("Submit"),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 170),
              backgroundColor: Color(0xff0056f1),
              // side: BorderSide(color: Colors.yellow, width: 5),

              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {
              if (Reportglobalkey.currentState!.validate()) {
                addReportController.addreportmanagerPostapi();
                Get.toNamed('/Addreportuserlist');
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         AddCustomerDetailsScreen(
                //           FieldSite: FieldSiteNameController.text.toString(),
                //           // ContractorName:
                //           //     ContractorNameController.text.toString(),
                //           Latitude: LatitudeController.text.toString(),
                //           Longitude: LongitudeController.text.toString(),
                //           Proximity: ProximityController.text.toString(),
                //           SiteHead: SiteHeadNameController.text.toString(),
                //           MobileNo: MobileNumberController.text.toString(),
                //         )));
              }
            },
          ),
        ),
      ),
    );
  }
}
