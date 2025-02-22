import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/AppBarSample.dart';

import '../../WorkerList/view/WorkerListScreen.dart';

const List<String> assoicatedrop = <String>['Anand', 'mani', 'Ravi'];
const List<String> worktypedrop = <String>[
  'House keeping',
  'Security',
  'Watchman',
];

class Siteheadaddsiteworkerscreen extends StatefulWidget {
  const Siteheadaddsiteworkerscreen({super.key});

  @override
  State<Siteheadaddsiteworkerscreen> createState() =>
      _SiteheadaddsiteworkerscreenState();
}

class _SiteheadaddsiteworkerscreenState
    extends State<Siteheadaddsiteworkerscreen> {
  final _addsiteglobalkey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _addsiteglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _addsiteglobalkey.currentState?.save();
  }

  @override
  void initState() {
    addSiteWorkerController.passwordVisible = false;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: AppbarName(
              title: "Add Worker",
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                //tooltip: 'Setting Icon',
                onPressed: () {
                  Get.toNamed('/Workerlistscreen');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => Workerlistscreen()),
                  // );
                },
              ), //IconButton
            )),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Form(
              key: _addsiteglobalkey,
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
                  AssociateContractorField(),
                  const SizedBox(
                    height: 15,
                  ),
                  SelectWorkType(),
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
                return "First Name can't be empty";
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: addSiteWorkerController.FirstNameController,
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
              // label: const Text(
              //   "First Name",
              //   style:
              //       TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              // ),
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
            controller: addSiteWorkerController.LastNameController,
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
              // label: const Text(
              //   "Last Name",
              //   style:
              //       TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              // ),
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
            controller: addSiteWorkerController.MobileNumberController,
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

  Widget AssociateContractorField() {
    return Padding(
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
              labelText: "Associate Contractor ",
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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          value: addSiteWorkerController.Assoicate,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Select Shift can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: assoicatedrop.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              addSiteWorkerController.Assoicate = newValue!;
            });
          },
        )));
  }

  Widget SelectWorkType() {
    return Padding(
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
              labelText: "Select Work Type",
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/mech.png',
                  color: Colors.black,
                  height: 2,
                  width: 2,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          value: addSiteWorkerController.work,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Select Shift can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: worktypedrop.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              addSiteWorkerController.work = newValue!;
            });
          },
        )));
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
              if (value != addSiteWorkerController.EnterPasswordController.text)
                return 'Not Match';
            },
            keyboardType: TextInputType.number,
            controller: addSiteWorkerController.ConfirmPasswordController,
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
                  text: "Confirm Password",
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
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {
              //workerListController.fetchItems();
              Get.toNamed('/Workerlistscreen');
            },
          ),
        ),
      ),
    );
  }
}
