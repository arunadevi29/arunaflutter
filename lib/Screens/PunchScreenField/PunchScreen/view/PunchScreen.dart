import 'package:attendanceapp/Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../../PieChartScreen/view/PieChartScreen.dart';
import '../../PunchInScreen/view/PunchInScreen.dart';
import '../../PunchOutScreen/view/PunchOutScreen.dart';

class Punchscreen extends StatefulWidget {
  const Punchscreen({super.key});

  @override
  State<Punchscreen> createState() => _PunchscreenState();
}

class _PunchscreenState extends State<Punchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            Get.toNamed("/Siteheaddashboard");
            //Get.toNamed("/AdmindashBoard");
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ),
        //IconButton

        title: Text(
          "Punch",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 70.2,
        toolbarOpacity: 0.8,
        elevation: 0.00,
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        children: [
          GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.98,
              crossAxisCount: 2,
              children: [
                // for (int i = 1; i < 5; i++)

                GestureDetector(
                  onTap: () {
                    Get.toNamed("/Punchinscreen");
                  },
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Punchinscreen()));
                  // },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEAEAEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Punch In",
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
                                        "assets/images/punch.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/p1.png",
                              height: 120,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.toNamed("/Punchoutscreen");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Punchoutscreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Punch Out",
                                  style: TextStyle(
                                      color: Colors.white,
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
                                        "assets/images/punch.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/p1.png",
                              height: 120,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/Piechartscreen");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Piechartscreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff0066FF),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Report",
                                  style: TextStyle(
                                      color: Colors.white,
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
                                        "assets/images/reporticon.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/report1.png",
                              height: 100,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
// SizedBox(
//   height: 20,
// ),
// SingleChildScrollView(
//   scrollDirection: Axis.vertical,
//   child:
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => Punchinscreen()),
//           );
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 150,
//               width: 180,
//               decoration: BoxDecoration(
//                   color: Color(0xffEAEAEB),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20, right: 20, top: 15),
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Punch In",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ),
//                         Container(
//                             width: 42,
//                             height: 42,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset(
//                                 "assets/images/punch.png",
//                               ),
//                             )),
//                       ],
//                     ),
//
//                   ),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => Punchoutscreen()),
//           );
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 150,
//               width: 180,
//               decoration: BoxDecoration(
//                   color: Color(0xffEAEAEB),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20, right: 20, top: 15),
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Punch Out",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ),
//                         Container(
//                             width: 42,
//                             height: 42,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset(
//                                 "assets/images/punch.png",
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: 8,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Flexible(
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//                 builder: (context) => FacilitiesScreen()),
//           );
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 150,
//               width: 180,
//               decoration: BoxDecoration(
//                   color: Color(0xffEAEAEB),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20, right: 20, top: 15),
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Report",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ),
//                         Container(
//                             width: 42,
//                             height: 42,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset(
//                                 "assets/images/reporticon.png",
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ),
// SizedBox(
//   height: 10,
// ),
