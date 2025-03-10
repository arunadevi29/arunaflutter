// import 'dart:io';
//
// import 'package:attendanceapp/CommenFiles/translateService.dart';
// import 'package:attendanceapp/Screens/ShiftTime/ShiftTimeScreen/controller/ShiftTimeFromController.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
//
// import '../../../../CommenFiles/getXcontroller.dart';
// import 'ShiftTimeViewScreen.dart';
//
// const List<String> shifttimedrop = <String>[
//   'Morning Shift',
//   'Night Shift',
//   'evening Shift'
// ];
// const List<String> worktypedrop = <String>[
//   'House keeping',
//   'Security',
//   'Watchman',
// ];
//
// enum SampleItem { itemOne, itemTwo, itemThree }
//
// class ShiftTimeFromScreen extends StatefulWidget {
//   const ShiftTimeFromScreen({super.key});
//
//   @override
//   State<ShiftTimeFromScreen> createState() => _ShiftTimeFromScreenState();
// }
//
// class _ShiftTimeFromScreenState extends State<ShiftTimeFromScreen> {
//   @override
//   final shiftglobalkey = GlobalKey<FormState>();
//
//   // String formattedDate =
//   //     DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
//   File? galleryFile;
//   final picker = ImagePicker();
//
//   void submit() {
//     final isValid = shiftglobalkey.currentState?.validate();
//     if (!isValid!) {
//       return;
//     }
//     shiftglobalkey.currentState?.save();
//   }
//
//   void _showPicker({
//     required BuildContext context,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Photo Library'),
//                 onTap: () {
//                   getImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   getImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   TimeOfDay? _selectedFromTime;
//   TimeOfDay? _selectedToTime;
//   String? _selectedWorkType;
//   String? _selectedShiftName;
//
//   final List<String> _workTypes = ["Electrician", "Plumber", "Driver"];
//   final List<String> _shiftNames = ["Morning", "Afternoon", "Night"];
//
//   // Function to pick time
//   Future<void> _pickTime(bool isFromTime) async {
//     TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     if (pickedTime != null) {
//       setState(() {
//         if (isFromTime) {
//           _selectedFromTime = pickedTime;
//         } else {
//           _selectedToTime = pickedTime;
//         }
//       });
//     }
//   }
//
//   // Function to format time as "HH:mm:ss"
//   String formatTime(TimeOfDay? time) {
//     if (time == null) return "";
//     final now = DateTime.now();
//     final formattedTime = DateFormat('HH:mm:ss')
//         .format(DateTime(now.year, now.month, now.day, time.hour, time.minute));
//     return formattedTime;
//   }
//
//   Future getImage(
//     ImageSource img,
//   ) async {
//     final pickedFile = await picker.pickImage(source: img);
//     XFile? xfilePick = pickedFile;
//     setState(
//       () {
//         if (xfilePick != null) {
//           galleryFile = File(pickedFile!.path);
//           shifttimeformController.dateTime = DateTime.now().toString();
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       },
//     );
//   }
//
//   TextEditingController timeRangeController = TextEditingController();
//
//   //
//   // var timepicker = "";
//
//   Widget build(BuildContext context) {
//     String formattedDate =
//         DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           TranslationService.translate("Add Shift Timing"),
//           style: TextStyle(fontSize: 20),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownButton(
//                 underline: SizedBox(),
//                 icon: Icon(
//                   Icons.language,
//                   color: Colors.blue,
//                   size: 35,
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                       value: "en",
//                       child: Text(
//                         'English',
//                         style: TextStyle(color: Colors.black, fontSize: 18),
//                       )),
//                   DropdownMenuItem(
//                       value: "ka",
//                       child: Text(
//                         'Kannada',
//                         style: TextStyle(color: Colors.black, fontSize: 18),
//                       )),
//                 ],
//                 onChanged: (value) {
//                   controller.setLocale(value);
//                 }),
//           )
//         ],
//
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//           ),
//           //tooltip: 'Setting Icon',
//           onPressed: () {
//             Get.toNamed('/Shifttimeviewscreen');
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(builder: (context) => Shifttimeviewscreen()),
//             // );
//           },
//         ), //IconButton
//       ),
//       body:
//           // Column(children: [
//           //   const SizedBox(
//           //     height: 20,
//           //   ),
//           //   Center(child: imageProfile()),
//           //   SizedBox(
//           //     height: 10,
//           //   ),
//           //   Expanded(
//           //     child: Container(
//           //       margin: const EdgeInsets.all(5),
//           //       child: Center(
//           //         child: SingleChildScrollView(
//           //           child: Form(
//           //             key: shiftglobalkey,
//           //             child: Column(
//           //               mainAxisAlignment: MainAxisAlignment.center,
//           //               children: [
//           //                 const SizedBox(
//           //                   height: 15,
//           //                 ),
//           //                 Select_Work_Type(),
//           //                 const SizedBox(
//           //                   height: 15,
//           //                 ),
//           //                 Select_Shift_Type(),
//           //                 const SizedBox(
//           //                   height: 15,
//           //                 ),
//           //                 // Select_shift_text(),
//           //                 // const SizedBox(
//           //                 //   height: 15,
//           //                 // ),
//           //                 Select_Shift_Time(),
//           //                 const SizedBox(
//           //                   height: 30,
//           //                 ),
//           //                 submit_button(),
//           //                 const SizedBox(
//           //                   height: 10,
//           //                 ),
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   )
//           // ])
//           Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Work Type Dropdown
//             DropdownButtonFormField<String>(
//               value: shifttimeformController.selectedWorkType,
//               decoration: InputDecoration(labelText: "Select Work Type"),
//               items: shifttimeformController.workTypes.map((work) {
//                 return DropdownMenuItem(value: work, child: Text(work));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   shifttimeformController.selectedWorkType = value;
//                 });
//               },
//             ),
//
//             SizedBox(height: 10),
//
//             // Shift Name Dropdown
//             DropdownButtonFormField<String>(
//               value: shifttimeformController.selectedShiftName,
//               decoration: InputDecoration(labelText: "Select Shift"),
//               items: shifttimeformController.shiftNames.map((shift) {
//                 return DropdownMenuItem(value: shift, child: Text(shift));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   shifttimeformController.selectedShiftName = value;
//                 });
//               },
//             ),
//
//             SizedBox(height: 10),
//
//             // From Time Picker
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                       "From Time: ${shifttimeformController.selectedFromTime != null ? shifttimeformController.formatTime(shifttimeformController.selectedFromTime) : "Not Selected"}"),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.access_time),
//                   onPressed: () =>
//                       shifttimeformController.pickTime(true, context),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 10),
//
//             // To Time Picker
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                       "To Time: ${shifttimeformController.selectedToTime != null ? shifttimeformController.formatTime(shifttimeformController.selectedToTime) : "Not Selected"}"),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.access_time),
//                   onPressed: () =>
//                       shifttimeformController.pickTime(false, context),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 20),
//
//             // Submit Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: shifttimeformController.addShift,
//                 child: Text("Add Shift"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget Select_Work_Type() {
//     return Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: Container(
//           // decoration: ShapeDecoration(
//           //   shape: RoundedRectangleBorder(
//           //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
//           //     borderRadius: BorderRadius.circular(10),
//           //   ),
//           // ),
//           child:
//               //     DropdownButtonFormField(
//               //   decoration: InputDecoration(
//               //       labelText: TranslationService.translate("Select Work Type"),
//               //       labelStyle: TextStyle(
//               //           fontSize: 18,
//               //           fontWeight: FontWeight.normal,
//               //           color: Colors.black),
//               //       // prefixIcon: Padding(
//               //       //   padding: const EdgeInsets.all(15.0),
//               //       //   child: Image.asset(
//               //       //     'assets/images/mech.png',
//               //       //     color: Colors.black,
//               //       //     height: 2,
//               //       //     width: 2,
//               //       //   ),
//               //       // ),
//               //       border:
//               //           OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
//               //   value: shifttimeformController.worktype,
//               //
//               //   // validator: (value) {
//               //   //   if (value == null || value.isEmpty) {
//               //   //     return "Select Shift can't be empty";
//               //   //   } else {
//               //   //     return null;
//               //   //   }
//               //   // },
//               //
//               //   items: worktypedrop.map<DropdownMenuItem<String>>((String value) {
//               //     return DropdownMenuItem(
//               //       value: value,
//               //       child: Text(value),
//               //     );
//               //   }).toList(),
//               //   // After selecting the desired option,it will
//               //   // change button value to selected value
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       shifttimeformController.worktype = newValue!;
//               //     });
//               //   },
//               // )
//               DropdownButtonFormField<String>(
//             value: shifttimeformController.selectedWorkType,
//             decoration: InputDecoration(labelText: "Select Work Type"),
//             items: shifttimeformController.workTypes.map((String type) {
//               return DropdownMenuItem<String>(
//                 value: type,
//                 child: Text(type),
//               );
//             }).toList(),
//             onChanged: (value) {
//               setState(() {
//                 shifttimeformController.selectedWorkType = value;
//               });
//             },
//           ),
//         ));
//   }
//
//   Widget Select_Shift_Type() {
//     return Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: Container(
//           // decoration: ShapeDecoration(
//           //   shape: RoundedRectangleBorder(
//           //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
//           //     borderRadius: BorderRadius.circular(10),
//           //   ),
//           // ),
//           child:
//               //     DropdownButtonFormField(
//               //   decoration: InputDecoration(
//               //       labelText: TranslationService.translate("Select Shift"),
//               //       labelStyle: TextStyle(
//               //           fontSize: 18,
//               //           fontWeight: FontWeight.normal,
//               //           color: Colors.black),
//               //       // prefixIcon: Padding(
//               //       //   padding: const EdgeInsets.all(15.0),
//               //       //   child: Image.asset(
//               //       //     'assets/images/mech.png',
//               //       //     color: Colors.black,
//               //       //     height: 2,
//               //       //     width: 2,
//               //       //   ),
//               //       // ),
//               //       border:
//               //           OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
//               //   value: shifttimeformController.shifttime,
//               //
//               //   // validator: (value) {
//               //   //   if (value == null || value.isEmpty) {
//               //   //     return "Select Shift can't be empty";
//               //   //   } else {
//               //   //     return null;
//               //   //   }
//               //   // },
//               //
//               //   items: shifttimedrop.map<DropdownMenuItem<String>>((String value) {
//               //     return DropdownMenuItem(
//               //       value: value,
//               //       child: Text(value),
//               //     );
//               //   }).toList(),
//               //   // After selecting the desired option,it will
//               //   // change button value to selected value
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       shifttimeformController.shifttime = newValue!;
//               //     });
//               //   },
//               // )
//               DropdownButtonFormField<String>(
//             value: shifttimeformController.selectedShiftName,
//             decoration: InputDecoration(labelText: "Select Work Type"),
//             items: shifttimeformController.shiftNames.map((String type) {
//               return DropdownMenuItem<String>(
//                 value: type,
//                 child: Text(type),
//               );
//             }).toList(),
//             onChanged: (value) {
//               setState(() {
//                 shifttimeformController.selectedShiftName = value;
//               });
//             },
//           ),
//         ));
//   }
//
//   Widget Select_Shift_Time() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         SizedBox(
//           width: 12,
//         ),
//         Flexible(
//           child: TextFormField(
//             controller: shifttimeformController.FromshiftController,
//             // validator: (value) {
//             //   if (value!.isEmpty) {
//             //     return "Shift From can't be empty";
//             //   }
//             // },
//             decoration: InputDecoration(
//               label: Center(
//                 child: Text(
//                   TranslationService.translate("Shift From"),
//                   // "Shift From",
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 // borderSide: BorderSide.none,
//               ),
//               fillColor: Color(0xfff5f7fa).withOpacity(0.1),
//               // fillColor: Colors.white54,
//               filled: true,
//               // prefixIcon: const Icon(Icons.person),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Flexible(
//           child: TextFormField(
//             controller: shifttimeformController.ToshiftController,
//             // validator: (value) {
//             //   if (value!.isEmpty) {
//             //     return "Shift To can't be empty";
//             //   }
//             // },
//             decoration: InputDecoration(
//               label: Center(
//                 child: Text(
//                   TranslationService.translate("Shift To"),
//                   // "Shift To",
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 // borderSide: BorderSide.none,
//               ),
//               fillColor: Color(0xfff5f7fa).withOpacity(0.1),
//               // fillColor: Colors.white54,
//               filled: true,
//               // prefixIcon: const Icon(Icons.person),
//             ),
//             readOnly: true,
//           ),
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         IconButton(
//           icon: new Image.asset(
//             'assets/images/clock.png',
//             height: 35,
//             width: 35,
//           ),
//           //tooltip: 'Setting Icon',
//           onPressed: () async {
//             if (!shifttimeformController.FromshiftController.text
//                 .contains('-')) {
//               await shifttimeformController.selectStartTime(context);
//             }
//             if (!shifttimeformController.ToshiftController.text.contains('-')) {
//               await shifttimeformController.selectEndTime(context);
//             }
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget submit_button() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: SizedBox(
//           height: 60.0,
//           child: ElevatedButton(
//             child: Text(
//               TranslationService.translate('Submit'),
//               // 'Submit',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(horizontal: 170),
//               backgroundColor: Color(0xff0056f1),
//               // side: BorderSide(color: Colors.yellow, width: 5),
//
//               textStyle: const TextStyle(
//                 fontSize: 20,
//                 fontStyle: FontStyle.normal,
//               ),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//             ),
//             onPressed: () {
//               if (shiftglobalkey.currentState!.validate()) {
//                 shifttimeformController.addShift();
//                 Get.toNamed('/Shifttimeviewscreen');
//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //     builder: (context) =>
//                 //         Shifttimeviewscreen(
//                 //         )));
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget imageProfile() {
//     return Stack(children: <Widget>[
//       Padding(
//           padding: const EdgeInsets.only(top: 10, left: 10),
//           child: CircleAvatar(
//               radius: (100),
//               backgroundColor: Color(0xff0056F1).withOpacity(0.1),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: SizedBox(
//                   height: 200.0,
//                   width: 300.5,
//                   child: galleryFile == null
//                       ? Padding(
//                           padding: const EdgeInsets.all(0),
//                           child: Image.asset(
//                             'assets/images/shifttime.gif',
//                           ),
//                         )
//                       : Center(child: Image.file(galleryFile!)),
//                 ),
//               ))),
//       Positioned(
//         bottom: 25,
//         right: 5,
//         child: InkWell(
//           onTap: () {
//             _showPicker(context: context);
//           },
//           child: Container(
//             width: 40.0,
//             height: 40.0,
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.white,
//                 ),
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   new BoxShadow(
//                     color: Colors.white,
//                     blurRadius: 2.0,
//                   ),
//                 ],
//                 color: Color(0xff0056F1)),
//             child: Icon(
//               Icons.camera_alt,
//               color: Colors.white,
//               size: 25.0,
//             ),
//           ),
//         ),
//       ),
//       Positioned(
//           left: 10,
//           top: 180,
//           child: Column(
//             children: [
//               if (shifttimeformController.dateTime != null)
//                 Container(
//                   color: Colors.black.withOpacity(0.5),
//                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                   child: Text(
//                     '${shifttimeformController.dateTime}',
//                     // Display current time and date
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//             ],
//           )),
//     ]);
//   }
// }
import 'dart:io';

import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../CommenFiles/translateService.dart';

class ShiftTimeFromScreen extends StatefulWidget {
  @override
  _ShiftTimeFromScreenState createState() => _ShiftTimeFromScreenState();
}

class _ShiftTimeFromScreenState extends State<ShiftTimeFromScreen> {
  final shiftglobalkey = GlobalKey<FormState>();

  // String formattedDate =
  //     DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
  File? galleryFile;
  final picker = ImagePicker();

  void submit() {
    final isValid = shiftglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    shiftglobalkey.currentState?.save();
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

  void showPicker({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            TranslationService.translate("Add Shift Timing"),
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
        body:
            // Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Center(child: imageProfile()),
            //       SizedBox(
            //         height: 40,
            //       ),
            //
            //       // Work Type Dropdown
            //       DropdownButtonFormField<String>(
            //         value: _selectedWorkType,
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             // Adds border around dropdown
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: BorderSide(color: Colors.blue, width: 2),
            //           ),
            //           labelText: "Select Work Type",
            //         ),
            //         items: _workTypes.map((work) {
            //           return DropdownMenuItem(value: work, child: Text(work));
            //         }).toList(),
            //         onChanged: (value) {
            //           setState(() {
            //             _selectedWorkType = value;
            //           });
            //         },
            //       ),
            //
            //       SizedBox(height: 10),
            //
            //       // Shift Name Dropdown
            //       DropdownButtonFormField<String>(
            //         value: _selectedShiftName,
            //         decoration: InputDecoration(
            //           labelText: "Select Shift",
            //           border: OutlineInputBorder(
            //             // Adds border around dropdown
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: BorderSide(color: Colors.blue, width: 2),
            //           ),
            //         ),
            //         items: _shiftNames.map((shift) {
            //           return DropdownMenuItem(value: shift, child: Text(shift));
            //         }).toList(),
            //         onChanged: (value) {
            //           setState(() {
            //             _selectedShiftName = value;
            //           });
            //         },
            //       ),
            //
            //       SizedBox(height: 10),
            //
            //       // From Time Picker
            //       Column(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 border: Border.all(),
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Text(
            //                       "From Time: ${_selectedFromTime != null ? formatTime(_selectedFromTime) : "Not Selected"}",
            //                       style: TextStyle(color: Colors.black, fontSize: 18),
            //                     ),
            //                   ),
            //                 ),
            //                 IconButton(
            //                   icon: Icon(Icons.access_time),
            //                   onPressed: () => _pickTime(
            //                     true,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //
            //       SizedBox(height: 10),
            //
            //       // To Time Picker
            //       Column(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 border: Border.all(),
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Text(
            //                       "To Time: ${_selectedToTime != null ? formatTime(_selectedToTime) : "Not Selected"}",
            //                       style: TextStyle(color: Colors.black, fontSize: 18),
            //                     ),
            //                   ),
            //                 ),
            //                 IconButton(
            //                   icon: Icon(Icons.access_time),
            //                   onPressed: () => _pickTime(false),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //
            //       SizedBox(height: 20),
            //
            //       // Submit Button
            //       Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 20),
            //             child: SizedBox(
            //               height: 60.0,
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 50),
            //                 child: ElevatedButton(
            //                     child: Text(
            //                       'Add Shift',
            //                       style: TextStyle(
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                     style: ElevatedButton.styleFrom(
            //                       padding: EdgeInsets.symmetric(horizontal: 120),
            //                       backgroundColor: Color(0xff0056f1),
            //                       // side: BorderSide(color: Colors.yellow, width: 5),
            //
            //                       textStyle: const TextStyle(
            //                         fontSize: 18,
            //                         fontStyle: FontStyle.normal,
            //                       ),
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius:
            //                               BorderRadius.all(Radius.circular(10))),
            //                     ),
            //                     onPressed: () {
            //                       // if (_sitecontractglobalkey.currentState!.validate()) {
            //                       addShift();
            //
            //                       Get.toNamed('/Shifttimeviewscreen');
            //                     }),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  // Dropdown for Work Type
                  Obx(() => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Select Work Type",
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                        value: shifttimeformController.selectedWorkType.value,
                        items: shifttimeformController.workTypes
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          shifttimeformController.selectedWorkType.value =
                              newValue;
                        },
                      )),
                  SizedBox(height: 10),

                  // Dropdown for Shift Name
                  Obx(() => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Select Shift Name",
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                        value: shifttimeformController.selectedShiftName.value,
                        items: shifttimeformController.shiftNames
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          shifttimeformController.selectedShiftName.value =
                              newValue;
                        },
                      )),
                  SizedBox(height: 10),

                  // From Time Picker
                  TextField(
                    controller: shifttimeformController.fromTimeController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "From Time",
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.access_time,
                          color: Colors.blue,
                        ),
                        onPressed: () => shifttimeformController.pickTime(true),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // To Time Picker
                  TextField(
                    controller: shifttimeformController.toTimeController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "To Time",
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.access_time,
                          color: Colors.blue,
                        ),
                        onPressed: () =>
                            shifttimeformController.pickTime(false),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          height: 60.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                                child: Text(
                                  'Add Shift',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 150),
                                  backgroundColor: Color(0xff0056f1),
                                  // side: BorderSide(color: Colors.yellow, width: 5),

                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {
                                  // if (_sitecontractglobalkey.currentState!.validate()) {
                                  shifttimeformController.addShift();

                                  Get.toNamed('/Shifttimeviewscreen');
                                }),
                          ),
                        ),
                      ),
                      // Submit Button
                      // ElevatedButton(
                      //   onPressed: shifttimeformController.addShift,
                      //   child: Text("Add Shift"),
                      // ),
                    ],
                  ),
                ])));
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
        bottom: 25,
        right: 5,
        child: InkWell(
          onTap: () {
            showPicker(context: context);
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
      Positioned(
          left: 10,
          top: 180,
          child: Column(
            children: [
              if (shifttimeformController.dateTime != null)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    '${shifttimeformController.dateTime}',
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
