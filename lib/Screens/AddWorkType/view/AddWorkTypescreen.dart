import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../Work/view/Work_Type_Screen.dart';
// import 'package:permission_handler/permission_handler.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class AddWorkTypeScreen extends StatefulWidget {
  const AddWorkTypeScreen({super.key});

  @override
  State<AddWorkTypeScreen> createState() => _AddWorkTypeScreenState();
}

class _AddWorkTypeScreenState extends State<AddWorkTypeScreen> {
  @override
  File? galleryFile;
  final picker = ImagePicker();
  String? _dateTime;
  SampleItem? selectedItem;

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

  TextEditingController WorkTypeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Work Type",
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
        //     itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
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
            Get.toNamed("/WorkTypeScreen");
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => WorkTypeScreen()),
            // );
          },
        ), //IconButton
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [imageProfile()],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Wrap(children: [
                TextFormField(
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Work Type can't be empty";
                    //   }
                    // },
                    controller: WorkTypeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide: BorderSide.none,
                      ),
                      labelText: "Enter Work Type",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      //hintText: "Select Start and End Time",
                    ))
              ]),
            ),
          ),
          Spacer(),
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
                  onPressed: () async {
                    // _showPicker(context: context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
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
                              'assets/images/work.gif',
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
      ]),
    );
  }
}
