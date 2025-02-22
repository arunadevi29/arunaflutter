import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../widgets/AppBarSample.dart';

import '../../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../../SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'Shift_Time_From_screen.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedItem;

class Shifttimeviewscreen extends StatefulWidget {
  Shifttimeviewscreen();

  @override
  State<Shifttimeviewscreen> createState() => _ShifttimeviewscreenState();
}

class _ShifttimeviewscreenState extends State<Shifttimeviewscreen> {
  String? _selectedOption;

  // Options for the dropdown
  final List<String> _options = [
    'House Keeping',
    'Security',
    'Watchman',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shift"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 35,
                color: Color(0xff0066FF),
              ),
              //tooltip: 'Setting Icon',
              onPressed: () {
                Get.toNamed('/ShiftTimeFromScreen');
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (context) => ShiftTimeFromScreen()),
                // );
              },
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            Get.toNamed('/Admindashboard');
            // Get.toNamed('/Siteheaddashboard');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ), //IconButton
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
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
                        labelText: shifttimeformController.SelectWorkTypedrop,
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: _selectedOption,

                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Select Work Type can't be empty";
                    //   } else {
                    //     return null;
                    //   }
                    // },

                    items: _options.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                      });
                    },
                  ))),
              SizedBox(height: 10),
              // Conditionally rendering forms based on dropdown selection
              // if (_selectedOption == 'Site Head') ...[
              //   SiteHead(),
              // ]
              Column(children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${shifttimeformController.SelectShiftdrop}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff0056F1),
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          PopupMenuButton<SampleItem>(
                            initialValue: selectedItem,
                            onSelected: (SampleItem item) {
                              selectedItem = item;
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<SampleItem>>[
                              const PopupMenuItem<SampleItem>(
                                value: SampleItem.itemOne,
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem<SampleItem>(
                                value: SampleItem.itemTwo,
                                child: Text('Disable'),
                              ),
                              // const PopupMenuItem<SampleItem>(
                              //   value: SampleItem.itemThree,
                              //   child: Text('Item 3'),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  ('${shifttimeformController.FromshiftController.text}')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  ('${shifttimeformController.ToshiftController.text}')),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Afternoon Shift",
                    //         style: TextStyle(
                    //             fontSize: 16,
                    //             color: Color(0xff0056F1),
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //       Spacer(),
                    //       PopupMenuButton<SampleItem>(
                    //         initialValue: selectedItem,
                    //         onSelected: (SampleItem item) {
                    //           selectedItem = item;
                    //         },
                    //         itemBuilder: (BuildContext context) =>
                    //             <PopupMenuEntry<SampleItem>>[
                    //           const PopupMenuItem<SampleItem>(
                    //             value: SampleItem.itemOne,
                    //             child: Text('Edit'),
                    //           ),
                    //           const PopupMenuItem<SampleItem>(
                    //             value: SampleItem.itemTwo,
                    //             child: Text('Disable'),
                    //           ),
                    //           // const PopupMenuItem<SampleItem>(
                    //           //   value: SampleItem.itemThree,
                    //           //   child: Text('Item 3'),
                    //           // ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 15),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text("02:00 PM - 10:00 PM"),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Night Shift",
                    //         style: TextStyle(
                    //             fontSize: 16,
                    //             color: Color(0xff0056F1),
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //       Spacer(),
                    //       PopupMenuButton<SampleItem>(
                    //         initialValue: selectedItem,
                    //         onSelected: (SampleItem item) {
                    //           selectedItem = item;
                    //         },
                    //         itemBuilder: (BuildContext context) =>
                    //             <PopupMenuEntry<SampleItem>>[
                    //           const PopupMenuItem<SampleItem>(
                    //             value: SampleItem.itemOne,
                    //             child: Text('Edit'),
                    //           ),
                    //           const PopupMenuItem<SampleItem>(
                    //             value: SampleItem.itemTwo,
                    //             child: Text('Disable'),
                    //           ),
                    //           // const PopupMenuItem<SampleItem>(
                    //           //   value: SampleItem.itemThree,
                    //           //   child: Text('Item 3'),
                    //           // ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 15),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text("10:00 PM - 06:00 AM"),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // )
                  ],
                ))
              ])
              // else if (_selectedOption == 'Report Manager') ...[
              //   ReportManager(),
              // ] else if (_selectedOption == 'Add Contractor') ...[
              //   AddContractor(),
              // ] else if (_selectedOption == 'Site Worker') ...[
              //   SiteWorker(),
              // ],
            ],
          ),
        ),
      ),
    );
  }
}

class SiteHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Morning Shift',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("06:00 AM - 02:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Afternoon Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("02:00 PM - 10:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Night Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("10:00 PM - 06:00 AM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      ))
    ]);
  }
}

/////////Report/////////////
class ReportManager extends StatelessWidget {
  const ReportManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Morning Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("06:00 AM - 02:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Afternoon Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("02:00 PM - 10:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Night Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("10:00 PM - 06:00 AM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      ))
    ]);
  }
}

class AddContractor extends StatelessWidget {
  const AddContractor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Morning Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("06:00 AM - 02:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Afternoon Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("02:00 PM - 10:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Night Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("10:00 PM - 06:00 AM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      ))
    ]);
  }
}

class SiteWorker extends StatelessWidget {
  const SiteWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Morning Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("06:00 AM - 02:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Afternoon Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("02:00 PM - 10:00 PM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Night Shift",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0056F1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('Disable'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("10:00 PM - 06:00 AM"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      ))
    ]);
  }
}
