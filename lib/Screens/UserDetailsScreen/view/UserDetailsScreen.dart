import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../AddUser/view/AddUserScreen.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../SiteHeader/WorkerList/view/WorkerListScreen.dart';
import '../../UserListAddContractor/view/AddContractorUserList.dart';
import '../../UserListAddReport/view/AddReportUserList.dart';
import '../../UserListAddSiteHeader/view/AddSiteHeaderUser.dart';

class Userdetailsscreen extends StatefulWidget {
  const Userdetailsscreen({super.key});

  @override
  State<Userdetailsscreen> createState() => _UserdetailsscreenState();
}

class _UserdetailsscreenState extends State<Userdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            //Get.toNamed('/Siteheaddashboard');
            Get.toNamed('/Admindashboard');

            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ),

        //IconButton
      ),
      body: Column(
        children: [
          GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(20.0),
              crossAxisCount: 2,
              children: [
                // for (int i = 1; i < 5; i++)

                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Addsiteheaderuser');
                    // Navigator.push(
                    //     context,
                    //     // MaterialPageRoute(
                    //     //     builder: (context) => Addsiteheaderuser()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEAEAEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Site Head",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Spacer(),
                                Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/u1.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "5 Site Heads",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed('/Addcontractoruserlist');
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => Get.toNamed('/Addsiteheaderuser');()));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: Color(0xffEAEAEB),
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   "Contractor",
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 18),
                //                 ),
                //                 Spacer(),
                //                 Container(
                //                     width: 42,
                //                     height: 42,
                //                     decoration: BoxDecoration(
                //                       shape: BoxShape.circle,
                //                       color: Colors.white,
                //                     ),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Image.asset(
                //                         "assets/images/u2.png",
                //                       ),
                //                     )),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(top: 80, left: 10),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   "8 Contractors",
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.normal,
                //                       fontSize: 18),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Addreportuserlist');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Addreportuserlist()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEAEAEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Report\nManager",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Spacer(),
                                Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/u3.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "10 Report Manager",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed('/Workerlistscreen');
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => Workerlistscreen()));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: Color(0xffEAEAEB),
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   "Site\nWorker",
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 18),
                //                 ),
                //                 Spacer(),
                //                 Container(
                //                     width: 42,
                //                     height: 42,
                //                     decoration: BoxDecoration(
                //                       shape: BoxShape.circle,
                //                       color: Colors.white,
                //                     ),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Image.asset(
                //                         "assets/images/u4.png",
                //                       ),
                //                     )),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(top: 80, left: 10),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   "20 Site Workers",
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.normal,
                //                       fontSize: 18),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //     onTap: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //             builder: (context) => Adduserscreen()),
                //       );
                //     },
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: Colors.blue[100],
                //           borderRadius: BorderRadius.circular(20)),
                //       height: 90,
                //       width: 150,
                //       padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                //       child: Column(
                //         children: [
                //           SizedBox(
                //             height: 10,
                //           ),
                //           InkWell(
                //             // onTap: () {
                //             //   if (_index < Hospital.length - 1) {
                //             //     _index++;
                //             //   }
                //             // },
                //             child: Icon(
                //               Icons.add,
                //               size: 80,
                //               color: Colors.blue,
                //             ),
                //           ),
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Text(
                //             "Add User",
                //             style: TextStyle(
                //                 color: Colors.blue,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20),
                //           ),
                //         ],
                //       ),
                //     ))
              ])
        ],
      ),
    );
  }
}
