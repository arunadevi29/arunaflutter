import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/SiteHeader/WorkerList/controller/WorkerListController.dart';
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
        appBar: AppBar(
          title: Text(TranslationService.translate("Add Worker")),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        DropdownMenuItem(
                            value: "ka",
                            child: Text(
                              'Kannada',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                      ],
                      onChanged: (value) {
                        controller.setLocale(value);
                      }),
                ),
              ],
            ),
          ],
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
        ),
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
                return TranslationService.translate(
                    "First Name can't be empty");
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: workerListController.firstNameController,
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
                return TranslationService.translate("Last Name can't be empty");
              }

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.name,
            controller: workerListController.lastNameController,
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
                return TranslationService.translate(
                    "Mobile Number can't be empty");
              }
              if (value.length != 10)
                return TranslationService.translate(
                    "Mobile Number must be of 10 digit");
              else
                return null;

              //else if (value.length < 10) {}
            },
            keyboardType: TextInputType.number,
            controller: workerListController.mobileNumberController,
            onChanged: (value) {},
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

  Widget AssociateContractorField() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          child: DropdownButtonFormField<String>(
            value: workerListController.selectedWork,
            decoration: InputDecoration(labelText: "Select Work"),
            items: workerListController.workOptions.map((String work) {
              return DropdownMenuItem<String>(
                value: work,
                child: Text(work),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                workerListController.selectedWork = value;
              });
            },
          ),
        ));
  }

  Widget SelectWorkType() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          child: DropdownButtonFormField<String>(
            value: workerListController.selectedWorkType,
            decoration: InputDecoration(labelText: "Select Work Type"),
            items: workerListController.workTypeOptions.map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                workerListController.selectedWorkType = value;
              });
            },
          ),
        ));
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
                    "Confirm Password can't be empty");
              }
              if (value != addSiteWorkerController.EnterPasswordController.text)
                return TranslationService.translate("Not Match");
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
                if (_addsiteglobalkey.currentState!.validate()) {
                  workerListController.addPostapi();
                  Get.toNamed('/Workerlistscreen');
                }
              }),
        ),
      ),
    );
  }
}
