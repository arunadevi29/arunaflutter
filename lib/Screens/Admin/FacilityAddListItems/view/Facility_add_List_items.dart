import 'dart:io';

import 'package:attendanceapp/Screens/Admin/FacilityCardListview/model/fieldstatemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../CommenFiles/translateService.dart';
import '../../AddNewFieldScreen/view/AddNewFieldList.dart';
import '../../FacilityCardListview/view/Facilities_Card_Items.dart';
import '../../FacilityDetails/View/FacilityDetails.dart';
import '../controller/FacilityAddListItemsController.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher_string.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class FacilityAddListItems extends StatefulWidget {
  const FacilityAddListItems({super.key});

  @override
  // final GlobalKey locationKey = GlobalKey();

  State<FacilityAddListItems> createState() => _FacilityAddListItemsState();
}

class _FacilityAddListItemsState extends State<FacilityAddListItems> {
  final _addlistglobalkey = GlobalKey<FormState>();

  var dropname = "";
  String? _dateTime;

  void _submit() {
    final isValid = _addlistglobalkey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _addlistglobalkey.currentState?.save();
  }

  String formattedDate =
      DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());
  File? galleryFile;
  final picker = ImagePicker();

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
          _dateTime = DateTime.now().toString();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    facilityAddListItemsController.checkPermission();
    facilityAddListItemsController.getCurrentLocation();
    // facilityAddListItemsController.CategeryController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            TranslationService.translate("Add Hospital"),
            // "Add Hospital",
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
              // Get.toNamed('/FacilitiesListView');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FacilitiesListView()),
              );
            },
          ), //IconButton
        ),
        body: Column(children: [
          Center(
            child: Column(
              children: [
                imageProfile(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _addlistglobalkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                              controller: facilityAddListItemsController
                                  .CategeryController,
                              decoration: InputDecoration(
                                labelText: "Categery",
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // Rounded corners
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FieldSideNameField(),
                        const SizedBox(
                          height: 15,
                        ),
                        LatitudeField(),
                        const SizedBox(
                          height: 15,
                        ),
                        ProximityField(),
                        const SizedBox(
                          height: 15,
                        ),
                        SiteHeadNameField(),
                        const SizedBox(
                          height: 15,
                        ),
                        MobileNumberField(),
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
          )
        ]));
  }

  Widget FieldSideNameField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "First Name can't be empty";
            //   }
            //
            //   //else if (value.length < 10) {}
            // },
            keyboardType: TextInputType.name,
            controller: facilityAddListItemsController.FieldSiteNameController,
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
                TranslationService.translate('Field Site Name'),
                // "Field Site Name",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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

  Widget LatitudeField() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 12,
          ),
          Flexible(
            child: TextFormField(
              controller: facilityAddListItemsController.LatitudeController,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Latitude can't be empty";
              //   }
              // },
              decoration: InputDecoration(
                label: Center(
                  child:
                      // Text(latitude != null
                      //     ? "$latitude"
                      //     : "Latitude"),
                      Text(
                    "${facilityAddListItemsController.lat}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  // Text(latitude != null
                  //     ? "$latitude"
                  //     : "Latitude"),
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
            // TextField(
            //   controller: LatitudeController,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(labelText: "Latitude"),
            // ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: TextFormField(
              controller: facilityAddListItemsController.LongitudeController,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Longitude can't be empty";
              //   }
              // },
              decoration: InputDecoration(
                label: Center(
                  child: Text(
                    "${facilityAddListItemsController.long}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  // Text(
                  //   "$longitude",
                  //   style: TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w500),
                  // ),
                  // Text(
                  //     longitude != null
                  //         ? "$latitude"
                  //         : "Longitude"
                  //    ),
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
            // TextField(
            //   controller: LongitudeController,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(labelText: "Longitude"),
            // ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              icon: new Image.asset(
                'assets/images/circle_img.png',
                height: 25,
                width: 25,
              ),
              //tooltip: 'Setting Icon',
              onPressed: () async {
                facilityAddListItemsController.calculateDistance();
                facilityAddListItemsController.openMap(
                    facilityAddListItemsController.lat,
                    facilityAddListItemsController.long);
              })
        ],
      ),
    );
  }

  Widget ProximityField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "Proximity can't be empty";
            //   }
            //
            //   //else if (value.length < 10) {}
            // },
            keyboardType: TextInputType.name,
            controller: facilityAddListItemsController.ProximityController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText:
                  "Distance: ${facilityAddListItemsController.distance.toStringAsFixed(2)} meters",

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
          //   TextField(
          // controller: ProximityController,
          // keyboardType: TextInputType.number,
          // decoration: InputDecoration(
          //   labelText: "Distance: ${distance.toStringAsFixed(2)} meters",
          // ),
        ),
      ),
    ]);
  }

  Widget SiteHeadNameField() {
    return
        //   Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //   Container(
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 10, right: 10),
        //       child: TextFormField(
        //         // validator: (value) {
        //         //   if (value!.isEmpty) {
        //         //     return "Site Head Name can't be empty";
        //         //   }
        //         // },
        //         keyboardType: TextInputType.name,
        //         controller: SiteHeadNameController,
        //         onChanged: (value) {
        //           // setState(() {
        //           //   // Convert the entered value to uppercase and update the controller
        //           // /  usernameController.value = TextEditingValue(
        //           //     text: value.toUpperCase(),
        //           //     selection: usernameController
        //           //         .selection, // Maintain the cursor position
        //           //   );
        //           // });
        //         },
        //         decoration: InputDecoration(
        //           label: const Text(
        //             "Site Head Name",
        //             style:
        //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        //           ),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(10),
        //             // borderSide: BorderSide.none,
        //           ),
        //           fillColor: Color(0xfff5f7fa).withOpacity(0.1),
        //           // fillColor: Colors.white54,
        //           filled: true,
        //           // prefixIcon: const Icon(Icons.person),
        //         ),
        //       ),
        //     ),
        //   ),
        // ]);
        Padding(
            padding: const EdgeInsets.all(0),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: DropdownButtonFormField<String>(
                      value: facilityCardListviewController.Siteheadname,
                      decoration: InputDecoration(
                          labelText: "Select Work Type",
                          border: OutlineInputBorder()),
                      items: facilityCardListviewController.workTypeOptions
                          .map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          facilityCardListviewController.Siteheadname = value;
                        });
                      },
                    ),
                  )),
              SizedBox(height: 10),
            ]));
  }

  Widget MobileNumberField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return TranslationService.translate(
                    "Mobile Number can't be empty");
                // "Mobile Number can't be empty";
              }
            },
            keyboardType: TextInputType.number,
            controller: facilityAddListItemsController.MobileNumberController,
            maxLength: 10,
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
              prefixText: "+91",
              label: RichText(
                text: new TextSpan(
                  text: TranslationService.translate("Mobile Number"),
                  // : ${logInController.mobileController.text}
                  // 'Mobile Number',
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
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: SizedBox(
          height: 60.0,
          child: ElevatedButton(
            child: Text(
              TranslationService.translate("Submit"),
              // 'Submit',
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
              // Get.toNamed('/Adminaddreportmanagerscreen');
              if (_addlistglobalkey.currentState!.validate()) {
                // facilityCardListviewController.addFieldStateApi();
                facilityCardListviewController.addFieldStateApi();

                // Get.toNamed("/FacilitiesListView");

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FacilitiesListView()));
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
                            'assets/images/hospitalicon.gif',
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

// Widget imageProfile() {
//   return Center(
//     child: Stack(children: <Widget>[
//       Padding(
//           padding: const EdgeInsets.only(top: 10, left: 10),
//           child: CircleAvatar(
//               radius: (100),
//               backgroundColor: Colors.white,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: SizedBox(
//                   height: 200.0,
//                   width: 300.5,
//                   child: galleryFile == null
//                       ? Padding(
//                           padding: const EdgeInsets.all(0),
//                           child: Image.asset(
//                             'assets/images/hospitalicon.gif',
//                           ),
//                         )
//                       : Center(child: Image.file(galleryFile!)),
//                 ),
//               ))
//
//           //     Container(
//           //   height: 180,
//           //   width: 180,
//           //   decoration: BoxDecoration(
//           //     color: Colors.blue.shade800,
//           //     border: Border.all(),
//           //     // borderRadius: BorderRadius.circular(10)
//           //   ),
//           //   child: SizedBox(
//           //     height: 200.0,
//           //     width: 300.5,
//           //     child: galleryFile == null
//           //         ? Padding(
//           //             padding: const EdgeInsets.all(0),
//           //             child: Image.asset(
//           //               'assets/images/hospitalicon.gif',
//           //             ),
//           //           )
//           //         : Center(child: Image.file(galleryFile!)),
//           //   ),
//           // ),
//           ),
//       Positioned(
//         bottom: 5,
//         right: 10.0,
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
//       SizedBox(
//         height: 20,
//       ),
//       Positioned(
//           left: 10,
//           top: 180,
//           child: Column(
//             children: [
//               if (_dateTime != null)
//                 Container(
//                   color: Colors.black.withOpacity(0.5),
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Text(
//                     '$_dateTime', // Display current time and date
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//             ],
//           )),
//     ]),
//   );
// }
}
