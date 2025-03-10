import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../AddUser/view/AddUserScreen.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';

import '../../Admin/FacilityCardDetails/view/Facilities_Screen.dart';
import '../../PieChartScreen/view/PieChartScreen.dart';
import '../../PunchScreenField/PunchScreen/view/PunchScreen.dart';
import '../../SettingsScreen/view/SettingsScreen.dart';
import '../../ShiftTime/ShiftTimeScreen/view/Shift_Time_From_screen.dart';
import '../../SiteHeader/WorkerList/view/WorkerListScreen.dart';
import '../../UserDetailsScreen/view/UserDetailsScreen.dart';
import '../../UserListAddContractor/view/AddContractorUserList.dart';
import '../../UserListAddReport/view/AddReportUserList.dart';
import '../../UserListAddSiteHeader/view/AddSiteHeaderUser.dart';

import '../../Work/view/Work_Type_Screen.dart';

class Siteheaddashboard extends StatefulWidget {
  const Siteheaddashboard({super.key});

  @override
  State<Siteheaddashboard> createState() => _SiteheaddashboardState();
}

class _SiteheaddashboardState extends State<Siteheaddashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      TranslationService.translate("Hello!"),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    TranslationService.translate("Site Head"),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),

              // Padding(
              //   padding: const EdgeInsets.only(top: 15),
              //   child: IconButton(
              //     icon: const Icon(
              //       Icons.settings,
              //       size: 30,
              //     ),
              //     //tooltip: 'Setting Icon',
              //     onPressed: () {
              //       Get.toNamed('/Settingsscreen');
              //       // Navigator.of(context).push(
              //       //   MaterialPageRoute(
              //       //       builder: (context) => const Settingsscreen()),
              //       // );
              //     },
              //   ),
              // ),
            ],
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
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/boy.png',
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/Punchinscreen');
                    },
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 190,
                          width: 155,
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEB),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        TranslationService.translate(
                                            'Punch In'),
                                        // "Facilities".tr,
                                        style: adminDashboardcontroller.langsize
                                            ? TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)
                                            : TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19)),
                                    // Text(
                                    //   TranslationService.translate("Punch In"),
                                    //   style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 20),
                                    // ),
                                    Container(
                                        width: 40,
                                        height: 40,
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
                              SizedBox(
                                height: 7,
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/p1.png",
                                  height: 100,
                                  width: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/Punchoutscreen');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 190,
                          width: 155,
                          decoration: BoxDecoration(
                              color: Color(0xff0066FF),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 10, top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        TranslationService.translate(
                                            'Punch Out'),
                                        // "Facilities".tr,
                                        style: adminDashboardcontroller.langsize
                                            ? TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)
                                            : TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19)),
                                    // Text(
                                    //   TranslationService.translate("Punch Out"),
                                    //   style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 20),
                                    // ),
                                    Container(
                                        width: 40,
                                        height: 40,
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
                              SizedBox(
                                height: 7,
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/p1.png",
                                  height: 100,
                                  width: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Piechartscreen');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 190,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Color(0xffD6E4FD),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TranslationService.translate("Report"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
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
                            Image.asset(
                              "assets/images/pie.png",
                              height: 120,
                              width: 350,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/SiteheadUser');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => Userdetailsscreen()),
                    // );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 190,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Color(0xff0F2950),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TranslationService.translate("User"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
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
                                          "assets/images/contact.png",
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/usermember.png",
                              height: 100,
                              width: 350,
                              fit: BoxFit.fitHeight,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TranslationService.translate("3 Users"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
    // SingleChildScrollView(
    //   child: Column(children: [
    //     SizedBox(
    //       height: 70,
    //     ),
    //     SingleChildScrollView(
    //       scrollDirection: Axis.vertical,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Flexible(
    //             child: GestureDetector(
    //               onTap: () {
    //                 Get.toNamed('/Punchinscreen');
    //               },
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Container(
    //                     height: 190,
    //                     width: 180,
    //                     decoration: BoxDecoration(
    //                         color: Color(0xffEAEAEB),
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: Column(
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(
    //                               left: 20, right: 10, top: 15),
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text(
    //                                 "Punch In",
    //                                 style: TextStyle(
    //                                     color: Colors.black,
    //                                     fontWeight: FontWeight.bold,
    //                                     fontSize: 20),
    //                               ),
    //                               Container(
    //                                   width: 42,
    //                                   height: 42,
    //                                   decoration: BoxDecoration(
    //                                     shape: BoxShape.circle,
    //                                     color: Colors.white,
    //                                   ),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.all(8.0),
    //                                     child: Image.asset(
    //                                       "assets/images/punch.png",
    //                                     ),
    //                                   )),
    //                             ],
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 7,
    //                         ),
    //                         Center(
    //                           child: Image.asset(
    //                             "assets/images/p1.png",
    //                             height: 120,
    //                             width: 120,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Flexible(
    //             child: GestureDetector(
    //               onTap: () {
    //                 Get.toNamed('/Punchoutscreen');
    //               },
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Container(
    //                     height: 190,
    //                     width: 180,
    //                     decoration: BoxDecoration(
    //                         color: Color(0xff0066FF),
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: Column(
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(
    //                               left: 20, right: 10, top: 15),
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text(
    //                                 "Punch Out",
    //                                 style: TextStyle(
    //                                     color: Colors.white,
    //                                     fontWeight: FontWeight.bold,
    //                                     fontSize: 20),
    //                               ),
    //                               Container(
    //                                   width: 42,
    //                                   height: 42,
    //                                   decoration: BoxDecoration(
    //                                     shape: BoxShape.circle,
    //                                     color: Colors.white,
    //                                   ),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.all(8.0),
    //                                     child: Image.asset(
    //                                       "assets/images/punch.png",
    //                                     ),
    //                                   )),
    //                             ],
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 7,
    //                         ),
    //                         Center(
    //                           child: Image.asset(
    //                             "assets/images/p1.png",
    //                             height: 120,
    //                             width: 120,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: 8,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         GestureDetector(
    //           onTap: () {
    //             Get.toNamed('/Piechartscreen');
    //             // Navigator.of(context).push(
    //             //   MaterialPageRoute(
    //             //       builder: (context) => Shifttimeviewscreen(
    //             //
    //             //           )),
    //             // );
    //           },
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 height: 200,
    //                 width: 380,
    //                 decoration: BoxDecoration(
    //                     color: Color(0xffD6E4FD),
    //                     borderRadius: BorderRadius.circular(20)),
    //                 child: Column(
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(
    //                           left: 20, right: 10, top: 15),
    //                       child: Row(
    //                         mainAxisAlignment:
    //                             MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "Report",
    //                             style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 18),
    //                           ),
    //                           Spacer(),
    //                           Container(
    //                               width: 42,
    //                               height: 42,
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: Colors.white,
    //                               ),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Image.asset(
    //                                   "assets/images/reporticon.png",
    //                                 ),
    //                               )),
    //                         ],
    //                       ),
    //                     ),
    //                     Image.asset(
    //                       // color: Color(0xff0066FF),
    //                       "assets/images/pie.png",
    //                       height: 135,
    //                       // color: Colors.lightBlue,
    //                       width: 180,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //     SizedBox(
    //       height: 10,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         GestureDetector(
    //           onTap: () {
    //             Get.toNamed('/SiteheadUser');
    //             // Navigator.of(context).push(
    //             //   MaterialPageRoute(
    //             //       builder: (context) => Userdetailsscreen()),
    //             // );
    //           },
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 height: 200,
    //                 width: 380,
    //                 decoration: BoxDecoration(
    //                     color: Color(0xff0F2950),
    //                     borderRadius: BorderRadius.circular(20)),
    //                 child: Column(
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(
    //                           left: 20, right: 10, top: 15),
    //                       child: Row(
    //                         mainAxisAlignment:
    //                             MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "User",
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 20),
    //                           ),
    //                           Container(
    //                               width: 42,
    //                               height: 42,
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: Colors.white,
    //                               ),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Image.asset(
    //                                   "assets/images/contact.png",
    //                                 ),
    //                               )),
    //                         ],
    //                       ),
    //                     ),
    //                     Image.asset(
    //                       "assets/images/usermember.png",
    //                       height: 100,
    //                       width: 350,
    //                       fit: BoxFit.fitHeight,
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 20),
    //                       child: Row(
    //                         mainAxisAlignment:
    //                             MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "3 Users",
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontWeight: FontWeight.normal,
    //                                 fontSize: 18),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ]),
    // )
  }

//   Widget buildNavBarItem(IconData icon, String label, int index) {
//     return InkWell(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: _currentIndex == index ? Colors.black : Colors.blue,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: _currentIndex == index ? Colors.blue : Colors.black,
//             ),
//           )
//         ],
//       ),
//     );
//   }
}
