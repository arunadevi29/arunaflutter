import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import 'ShiftTimeViewScreen.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ShiftTimeFromScreen extends StatefulWidget {
  const ShiftTimeFromScreen({super.key});

  @override
  State<ShiftTimeFromScreen> createState() => _ShiftTimeFromScreenState();
}

class _ShiftTimeFromScreenState extends State<ShiftTimeFromScreen> {
  @override
  final shiftglobalkey = GlobalKey<FormState>();
  String formattedDate =
      DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
  File? galleryFile;
  final picker = ImagePicker();

  void submit() {
    final isValid = shiftglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    shiftglobalkey.currentState?.save();
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
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
          shifttimeformController.dateTime = DateTime.now().toString();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  TextEditingController timeRangeController = TextEditingController();

  // Function to show time picker for Start Time and update the TextField
  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? selectedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedStartTime != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(now.year, now.month, now.day,
          selectedStartTime.hour, selectedStartTime.minute);
      final formattedStartTime =
          DateFormat.jm().format(selectedDateTime); // Format as AM/PM

      // If end time is already set, combine both start and end times
      String currentTimeRange =
          shifttimeformController.FromshiftController.text;
      if (currentTimeRange.contains('-')) {
        shifttimeformController.FromshiftController.text =
            formattedStartTime + " - " + currentTimeRange.split(' - ')[1];
      } else {
        shifttimeformController.FromshiftController.text =
            formattedStartTime; // Set start time if end time isn't set
      }
    }
  }

  // Function to show time picker for End Time and update the TextField
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? selectedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedEndTime != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(now.year, now.month, now.day,
          selectedEndTime.hour, selectedEndTime.minute);
      final formattedEndTime =
          DateFormat.jm().format(selectedDateTime); // Format as AM/PM

      // If start time is already set, combine both start and end times
      String currentTimeRange = shifttimeformController.ToshiftController.text;
      if (currentTimeRange.contains('-')) {
        shifttimeformController.ToshiftController.text =
            currentTimeRange.split(' - ')[0] + " - " + formattedEndTime;
      } else {
        shifttimeformController.ToshiftController.text = currentTimeRange +
            formattedEndTime; // Set end time if start time isn't set
      }
    }
  }

  //
  // var timepicker = "";

  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Shift Timing",
            style: TextStyle(fontSize: 20),
          ),
          // actions: <Widget>[
          //   PopupMenuButton<SampleItem>(
          //     initialValue: selectedItem,
          //     onSelected: (SampleItem item) {
          //       setState(() {
          //         selectedItem = item;
          //       });
          //     },
          //     itemBuilder: (BuildContext context) =>
          //         <PopupMenuEntry<SampleItem>>[
          //       const PopupMenuItem<SampleItem>(
          //         value: SampleItem.itemOne,
          //         child: Text('Edit'),
          //       ),
          //       const PopupMenuItem<SampleItem>(
          //         value: SampleItem.itemTwo,
          //         child: Text('Disable'),
          //       ),
          //       // const PopupMenuItem<SampleItem>(
          //       //   value: SampleItem.itemThree,
          //       //   child: Text('Item 3'),
          //       // ),
          //     ],
          //   ),
          // ], //<Widget>[]

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            //tooltip: 'Setting Icon',
            onPressed: () {
              Get.toNamed('/Shifttimeviewscreen');
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => Shifttimeviewscreen()),
              // );
            },
          ), //IconButton
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
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
                    key: shiftglobalkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Select_Work_Type(),
                        const SizedBox(
                          height: 15,
                        ),
                        Select_Shift_Type(),
                        const SizedBox(
                          height: 15,
                        ),
                        // Select_shift_text(),
                        // const SizedBox(
                        //   height: 15,
                        // ),
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

  Widget Select_Work_Type() {
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
          value: shifttimeformController.SelectWorkTypedrop,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Select Work Type can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: shifttimeformController.items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              shifttimeformController.SelectWorkTypedrop = newValue!;
            });
          },
        )));
  }

  Widget Select_Shift_Type() {
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
          value: shifttimeformController.SelectShiftdrop,

          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Select Shift can't be empty";
          //   } else {
          //     return null;
          //   }
          // },

          items: shifttimeformController.Shifts.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              shifttimeformController.SelectShiftdrop = newValue!;
            });
          },
        )));
  }

  Widget Select_Shift_Time() {
    return

        //   Padding(
        //   padding: const EdgeInsets.only(left: 10, right: 10),
        //   child: Wrap(children: [
        //     TextFormField(
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return "Select Shift Type can't be empty";
        //         }
        //       },
        //       AddContractor: SelectShiftController,
        //       decoration: InputDecoration(
        //         border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(10),
        //           // borderSide: BorderSide.none,
        //         ),
        //         labelText: "Select Shift",
        //         labelStyle: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.normal,
        //             color: Colors.black),
        //         //hintText: "Select Start and End Time",
        //         suffixIcon:
        //         IconButton(
        //           icon: new Image.asset(
        //             'assets/images/clock.png',
        //             height: 25,
        //             width: 25,
        //           ),
        //           //tooltip: 'Setting Icon',
        //           onPressed: () async {
        //             if (!SelectShiftController.text.contains('-')) {
        //               await _selectStartTime(context);
        //               await _selectEndTime(context);
        //             }
        //           },
        //         ),
        //       ),
        //       readOnly: true,
        //     ),
        //   ]),
        // );
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 12,
        ),
        Flexible(
          child: TextFormField(
            controller: shifttimeformController.FromshiftController,
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "Shift From can't be empty";
            //   }
            // },
            decoration: InputDecoration(
              label: Center(
                child: const Text(
                  "Shift From",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
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
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: TextFormField(
            controller: shifttimeformController.ToshiftController,
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "Shift To can't be empty";
            //   }
            // },
            decoration: InputDecoration(
              label: Center(
                child: const Text(
                  "Shift To",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
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
            readOnly: true,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        IconButton(
          icon: new Image.asset(
            'assets/images/clock.png',
            height: 35,
            width: 35,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () async {
            if (!shifttimeformController.FromshiftController.text
                .contains('-')) {
              await _selectStartTime(context);
            }
            if (!shifttimeformController.ToshiftController.text.contains('-')) {
              await _selectEndTime(context);
            }
          },
        ),
      ],
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
              if (shiftglobalkey.currentState!.validate()) {
                shifttimeformController.postData();
                Get.toNamed('/Shifttimeviewscreen');
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         Shifttimeviewscreen(
                //         )));
              }
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
                            'assets/images/shifttime.gif',
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
              if (shifttimeformController.dateTime != null)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '$shifttimeformController.dateTime',
                    // Display current time and date
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
