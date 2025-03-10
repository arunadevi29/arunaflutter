import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/controller/AddSiteHeadController.dart';
import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/model/Siteheadmodel.dart';
import 'package:attendanceapp/Screens/UserListAddSiteHeader/controller/UserListSiteHeaderController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/AppBarSample.dart';
import '../../../UserListAddSiteHeader/view/AddSiteHeaderUser.dart';
import '../../AddReportManager/view/AdminAddReportManagerScreen.dart';

class Adminaddsiteheadscreen extends StatefulWidget {
  const Adminaddsiteheadscreen({super.key});

  @override
  State<Adminaddsiteheadscreen> createState() => _AdminaddsiteheadscreenState();
}

class _AdminaddsiteheadscreenState extends State<Adminaddsiteheadscreen> {
  @override
  final _Sitehigeglobalkey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _Sitehigeglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _Sitehigeglobalkey.currentState?.save();
  }

  @override
  void initState() {
    addSiteHeadController.passwordVisible = false;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: // here the desired height
            AppBar(
          title: Text(TranslationService.translate("Add Site Head")),

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),

            //tooltip: 'Setting Icon',
            onPressed: () {
              Get.toNamed('/Addsiteheaderuser');
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //       builder: (context) => Addsiteheaderuser()),
              // );
            },
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
          ], //IconButton
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _Sitehigeglobalkey,
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
                          Field(),
                          const SizedBox(
                            height: 15,
                          ),
                          FieldSiteNameField(),
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
                ),
              ),
            ),
          ],
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
            controller: addSiteHeadController.FirstNameController,
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
                  text: TranslationService.translate('First Name'),
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
            controller: addSiteHeadController.LastNameController,
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
                    'Mobile Number must be of 10 digit');
              else
                return null;

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.number,
            controller: addSiteHeadController.MobileNumberController,
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

  Widget Field() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "Field can't be empty";
            //   }
            // },
            keyboardType: TextInputType.name,
            controller: addSiteHeadController.FieldController,
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
              label: Text(
                TranslationService.translate("Facility"),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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

  Widget FieldSiteNameField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "Field Site Name can't be empty";
            //   }
            // },
            keyboardType: TextInputType.name,
            controller: addSiteHeadController.FieldSiteNamerController,
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
              label: Text(
                TranslationService.translate("Field Site Name"),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
            keyboardType: TextInputType.name,
            controller: addSiteHeadController.EnterPasswordController,
            obscureText: !addSiteHeadController.passwordVisible,
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
                  text: TranslationService.translate("Password"),
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
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  addSiteHeadController.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    addSiteHeadController.passwordVisible =
                        !addSiteHeadController.passwordVisible;
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
              if (value != addSiteHeadController.EnterPasswordController.text)
                return 'Not Match';
            },
            keyboardType: TextInputType.name,
            controller: addSiteHeadController.ConfirmPasswordController,
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
                  text: TranslationService.translate("Confirm Password"),
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
          height: 60.0,
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
              if (_Sitehigeglobalkey.currentState!.validate()) {
                addSiteHeadController.addPostapi();
                // if (addSiteHeadController.FirstNameController.text.isNotEmpty &&
                //     addSiteHeadController.LastNameController.text.isNotEmpty &&
                //     addSiteHeadController
                //         .MobileNumberController.text.isNotEmpty &&
                //     addSiteHeadController.FieldController.text.isNotEmpty &&
                //     addSiteHeadController
                //         .FieldSiteNamerController.text.isNotEmpty &&
                //     addSiteHeadController
                //         .EnterPasswordController.text.isNotEmpty &&
                //     addSiteHeadController
                //         .ConfirmPasswordController.text.isNotEmpty &&
                //     addSiteHeadController.images.isNotEmpty) {
                //   addSiteHeadController.addItem();

                Get.toNamed('/Addsiteheaderuser');
              }
            },
          ),
        ),
      ),
    );
  }
}
