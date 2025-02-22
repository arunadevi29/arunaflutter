import 'dart:math';

import 'package:attendanceapp/Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';

class Piechartscreen extends StatefulWidget {
  const Piechartscreen({super.key});

  @override
  State<Piechartscreen> createState() => _PiechartscreenState();
}

class _PiechartscreenState extends State<Piechartscreen> {
  @override
  @override
  void initState() {
    // pickedDate = DateTime.now();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PieChart"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.black,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            Get.toNamed('/Siteheaddashboard');
            // Get.toNamed('/Admindashboard');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/pie.png",
                height: 300,
                width: 300,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 40, right: 40),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Column(
          //         children: [
          //           Text(
          //             "From Date",
          //             style: TextStyle(fontSize: 20, color: Colors.blue),
          //           ),
          //           Container(
          //             decoration: BoxDecoration(border: Border.all()),
          //             child: TextButton(
          //               onPressed: () async {
          //                 final result = await showDatePicker(
          //                     context: context,
          //                     initialDate: DateTime.now(),
          //                     firstDate: DateTime(2000),
          //                     lastDate: DateTime(2050));
          //                 if (result != null) {
          //                   setState(() {
          //                     pickedDate = result;
          //                   });
          //                 }
          //               },
          //               child: Text(
          //                 _dateString(),
          //                 style: TextStyle(fontSize: 20),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       Column(
          //         children: [
          //           Text(
          //             "To Date",
          //             style: TextStyle(fontSize: 20, color: Colors.blue),
          //           ),
          //           Container(
          //             decoration: BoxDecoration(border: Border.all()),
          //             child: TextButton(
          //               onPressed: () async {
          //                 final result = await showDatePicker(
          //                     context: context,
          //                     initialDate: DateTime.now(),
          //                     firstDate: DateTime(2000),
          //                     lastDate: DateTime(2050));
          //                 if (result != null) {
          //                   setState(() {
          //                     pickedDate = result;
          //                   });
          //                 }
          //               },
          //               child: Text(
          //                 _dateString(),
          //                 style: TextStyle(fontSize: 20),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 20, right: 20),
          //       child: Row(
          //         children: [
          //           IconButton(
          //             icon: Icon(
          //               Icons.date_range_rounded,
          //               size: 30,
          //               color: Colors.blue,
          //             ),
          //             onPressed: () =>
          //                 piechartController.selectDateRange(context),
          //           ),
          //           Text(
          //             "From Date: ",
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             piechartController.selectedDateRange == null
          //                 ? "From: ${piechartController.selectedDateRange!.start.toString().split(' ')[0]}"
          //                 : "Date",
          //             textAlign: TextAlign.center,
          //           ),
          //           // Text(
          //           //   piechartController.FromDate != null
          //           //       ? piechartController.FromDate!
          //           //           .toLocal()
          //           //           .toString()
          //           //           .split(' ')[0]
          //           //       : 'Date',
          //           //   style: TextStyle(
          //           //       fontSize: 20,
          //           //       color: Colors.black,
          //           //       fontWeight: FontWeight.bold),
          //           // ),
          //         ],
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 20, right: 20),
          //       child: Row(
          //         children: [
          //           IconButton(
          //             icon: Icon(
          //               Icons.date_range_rounded,
          //               size: 30,
          //               color: Colors.blue,
          //             ),
          //             onPressed: () =>
          //                 piechartController.selectToRange(context),
          //           ),
          //           Text(
          //             "To Date: ",
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             piechartController.selectedDateRange == null
          //                 ? "To: ${piechartController.selectedDateRange!.start.toString().split(' ')[0]}"
          //                 : "Date",
          //             textAlign: TextAlign.center,
          //           ),
          //         ],
          //       ),
          //     ),
          //
          //     SizedBox(height: 40),
          //     // ElevatedButton(
          //     //   onPressed: () {
          //     //     if (fromDate != null && toDate != null) {
          //     //       if (toDate!.isBefore(fromDate!)) {
          //     //         ScaffoldMessenger.of(context).showSnackBar(
          //     //           SnackBar(
          //     //               content: Text(
          //     //                   'The "To Date" should be after the "From Date".')),
          //     //         );
          //     //       } else {
          //     //         ScaffoldMessenger.of(context).showSnackBar(
          //     //           SnackBar(
          //     //               content: Text(
          //     //                   'From: ${fromDate!.toLocal().toString().split(' ')[0]} To: ${toDate!.toLocal().toString().split(' ')[0]}')),
          //     //         );
          //     //       }
          //     //     }
          //     //   },
          //     //   child: Text('Submit'),
          //     // ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: piechartController.fromDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "From Date",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: () => piechartController.selectDate(
                          context, piechartController.fromDateController),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: piechartController.toDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "To Date",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: () => piechartController.selectDate(
                          context, piechartController.toDateController),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
