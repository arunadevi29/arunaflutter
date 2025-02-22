import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../widgets/AppBarSample.dart';
import '../../PunchScreen/view/PunchScreen.dart';

class Punchinscreen extends StatefulWidget {
  const Punchinscreen({super.key});

  @override
  State<Punchinscreen> createState() => _PunchinscreenState();
}

class _PunchinscreenState extends State<Punchinscreen> {
  final _punchinglobalkey = GlobalKey<FormState>();

  final _picker = ImagePicker();
  bool circular = false;
  File? galleryFile;
  final picker = ImagePicker();
  String? _dateTime;

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              // ListTile(
              //   leading: const Icon(Icons.photo_library),
              //   title: const Text('Photo Library'),
              //   onTap: () {
              //     getImage(ImageSource.gallery);
              //     Navigator.of(context).pop();
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
          _dateTime = DateTime.now().toString();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  late PickedFile _imageFile;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: AppbarName(
              title: "Punch In",
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                //tooltip: 'Setting Icon',
                onPressed: () {
                  Get.toNamed('/Siteheaddashboard');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => Punchscreen()),
                  // );
                },
              ), //IconButton,
            )),
        body: Column(children: [
          Center(child: imageProfile()),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _punchinglobalkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Associate_Contractor(),
                        const SizedBox(
                          height: 15,
                        ),
                        First_Name_Drop(),
                        const SizedBox(
                          height: 15,
                        ),
                        Last_Name_drop(),
                        const SizedBox(
                          height: 15,
                        ),
                        Select_Work_Type_drop(),
                        const SizedBox(
                          height: 15,
                        ),
                        Select_Shift_drop(),
                        const SizedBox(
                          height: 30,
                        ),
                        Select_Shift_Time(),
                        const SizedBox(
                          height: 30,
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
          )
        ]));
  }

  Widget Associate_Contractor() {
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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          value: punchinController.Assoicate,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Associate Contractor can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: punchinController.AssociateContractor.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              punchinController.Assoicate = newValue!;
            });
          },
        )));
  }

  Widget First_Name_Drop() {
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
              labelText: "First Name",
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
          value: punchinController.First,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "First Name can't be empty";
            } else {
              return null;
            }
          },

          items: punchinController.FirstName.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              punchinController.First = newValue!;
            });
          },
        )));
  }

  Widget Last_Name_drop() {
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
              labelText: "Last Name",
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
          value: punchinController.Last,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Last Name can't be empty";
            } else {
              return null;
            }
          },

          items: punchinController.LastName.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              punchinController.Last = newValue!;
            });
          },
        )));
  }

  Widget Select_Work_Type_drop() {
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
          value: punchinController.SelectWork,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Select Work Type can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: punchinController.SelectWorkType.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              punchinController.SelectWork = newValue!;
            });
          },
        )));
  }

  Widget Select_Shift_drop() {
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
              labelText: "Select Shift",
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
          value: punchinController.SelectShiftTime,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Select Shift can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: punchinController.SelectShift.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              punchinController.SelectShiftTime = newValue!;
            });
          },
        )));
  }

  Widget Select_Shift_Time() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Wrap(children: [
        Container(
          width: 500,
          height: 50,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              border: Border.all()),
          child: TextField(
              decoration: InputDecoration(
                  label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Start Time",
              // "${shiftdropdown}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ))),
        ),
      ]),
    );
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
              // if (_globalkey.currentState!.validate()) {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => Workerdetailsscreen(
              //           Contractor: dropdownvalue,
              //           WorkType: dropdownvalue,
              //           Shift: dropdownvalue,
              //           Timing: FromshiftController.text.toString(),
              //           Worker: dropdownvalue)));
              // }
            },
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: CircleAvatar(
              radius: (100),
              backgroundColor: Color(0xff0056F1).withOpacity(0.1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 200.0,
                  width: 300.5,
                  child: galleryFile == null
                      ? Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/images/punchout.gif',
                          ),
                        )
                      : Center(child: Image.file(galleryFile!)),
                ),
              ))),
      Positioned(
        bottom: 5,
        right: 10.0,
        child: InkWell(
          onTap: () {
            _showPicker(context: context);
          },
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.white,
                    blurRadius: 2.0,
                  ),
                ],
                color: Color(0xff0056F1)),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Positioned(
          left: 10,
          top: 180,
          child: Column(
            children: [
              if (_dateTime != null)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '$_dateTime', // Display current time and date
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          )),
    ]);
  }
}
