import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../widgets/AppBarSample.dart';
import '../../../UserListAddContractor/view/AddContractorUserList.dart';

class Siteheadaddcontractorscreen extends StatefulWidget {
  const Siteheadaddcontractorscreen({super.key});

  @override
  State<Siteheadaddcontractorscreen> createState() =>
      _SiteheadaddcontractorscreenState();
}

class _SiteheadaddcontractorscreenState
    extends State<Siteheadaddcontractorscreen> {
  final _sitecontractglobalkey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _sitecontractglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _sitecontractglobalkey.currentState?.save();
  }

  @override
  void initState() {
    addContractorController.passwordVisible = false;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: AppbarName(
              title: "Add Contractor",
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                //tooltip: 'Setting Icon',
                onPressed: () {
                  Get.toNamed('/Addcontractoruserlist');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => Addcontractoruserlist()),
                  // );
                },
              ), //IconButton
            )),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Form(
              key: _sitecontractglobalkey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
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
                          "Set Password",
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
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "First Name can't be empty";
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: addContractorController.FirstNameController,
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
                return "Last Name can't be empty";
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: addContractorController.LastNameController,
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
                return "Mobile Number can't be empty";
              }
              if (value.length != 10)
                return 'Mobile Number must be of 10 digit';
              else
                return null;

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.number,
            controller: addContractorController.MobileNumberController,
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
                return "Enter Password can't be empty";
              }
            },
            keyboardType: TextInputType.number,
            controller: addContractorController.EnterPasswordController,
            obscureText: !addContractorController.passwordVisible,
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
                  addContractorController.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    addContractorController.passwordVisible =
                        !addContractorController.passwordVisible;
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
                return "Confirm Password can't be empty";
              }
              if (value != addContractorController.EnterPasswordController.text)
                return 'Not Match';
            },
            keyboardType: TextInputType.number,
            controller: addContractorController.ConfirmPasswordController,
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
              'Submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 170),
              backgroundColor: Color(0xff0056f1),
              // side: BorderSide(color: Colors.yellow, width: 5),

              textStyle: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {
              if (_sitecontractglobalkey.currentState!.validate()) {
                // Get.toNamed('/Addcontractoruserlist');
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
